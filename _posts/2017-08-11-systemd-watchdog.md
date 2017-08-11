---
layout: post
title: "Underappreciated Systemd Features: Builtin Watchdog"
description: "Avoid quitely crashing services with this one weird trick"
category: personal
tags: 
- tech
- comment
- howto
---
{% include JB/setup %}
In my opinion, you massively underestimate `systemd(1)` when you think of it as just another `init(1)` daemon. It actually provides some features that one would expect to be used quite widely by now but aren't. I want to try to present some of these in a couple of blog posts. These will only provide simple introductory examples to get you started. In this specific case, Lennart Poettering himself provided a [comprehensive tutorial on the topic](http://0pointer.de/blog/projects/watchdog.html).

Suppose we have a tiny binary we want to run to provide a certain functionality. This binary acts as a `daemon(7)` and thus needs to be started by your `init(1)`. To achieve this, we create a `systemd.unit(5)`. At this point, if the process crashes, `systemd(1)` would simply restart it and everything would be fine. However, there are cases in which your process becomes unresponsive and stops providing its intended functionality without actually crashing. In that case, our simple unit from before would not be restarted by `systemd(1)` because the latter has no way of knowing it crashed. As long as the process is running, `systemd(1)` will deem it alive and leave it be.

`systemd(1)` provides a mechanism for the process to notify it in defined time intervals and will react in a defined manner if it has not received a signal during the last interval. I will call that signal a heartbeat. There are two ways for the process to notify `systemd(1)`:

- a call to `sd_notify(3)` when the binary is linked against the relevant library
- calling `systemd-notify(1)` with the appropriate command line arguments

The following `systemd(1)` unit will provide a simple example:

    [Unit]
    Description=my daemon
    
    [Service]
    Type=simple
    ExecStart=/bin/sh -xc "while : ; do date ; sleep 3 ; test -f /tmp/DONT_NOTIFY || systemd-notify \"WATCHDOG=1\" ; done"
    
    NotifyAccess=all
    WatchdogSec=6
    Restart=on-failure

This unit starts a subshell (`sh(1p)`) because your `ExecStart` directive needs the full path to a binary. This subshell will then enter into an infinite loop (`while : ; do .. ; done`). Every three seconds (`sleep 3`) it prints the current date and time (`date`) and checks if a file called `/tmp/DONT_NOTIFY` exists (`test -f`). If it does not (`||`) exist, `/usr/bin/systemd-notify` is called with the command line argument `WATCHDOG=1`, thus sending a heartbeat to `systemd(1)`.

The other directives define how `systemd(1)` will react in case of error and how the error state is defined. By setting `WatchdogSec` we activate the watchdog functionality and set the time interval in which we expect heartbeats to six seconds. However, I recommend sending more often, half the interval [seems to be best practice](http://0pointer.de/blog/projects/watchdog.html), which is why we `sleep(1)` for three seconds. Because we activated the watchdog functionality, `systemd(1)` will set the `WATCHDOG_USEC` environment variable for the process, which could in turn use it to calculate how often it needs to send a heartbeat.

If `systemd(1)` does not receive the heartbeat in time, it will restart the daemon (`Restart=on-failure`). In our example we could trigger this behaviour by `touch(1)`ing `/tmp/DONT_NOTIFY` and wait for a few seconds. Most of the time, your daemon will start new child processes, which `systemd(1)` will of course notice and also manage. The directive `NotifyAccess=all` tells `systemd(1)` to accept the heartbeat from all processes belonging to that specific unit, not just the main (parent) process. In our case this does not change behaviour, I only include it because in most real-world cases you would need it.
