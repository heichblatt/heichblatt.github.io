---
layout: post
title: "Underappreciated Systemd Features: systemd-nspawnd"
description: "There's a container solution in my init(1)"
category: personal
tags:
- tech
- comment
- howto
---
{% include JB/setup %}
`systemd(1)` does contain something that looks very similar to a minimal container solution. It is [not meant to be a full blown container solution](http://0pointer.net/blog/projects/changing-roots.html) but merely meant to

> cover testing, debugging, building, installing, recovering. That's what you should use it for and what it is really good at, and where it is a much much nicer alternative to chroot(1).

You can think of `systemd-nspawn(1)` more like LXC, less than Docker. Changes to your filesystem are persistent across container boots and there is no clearly defined repository for operating system images for example. Nevertheless it provides a built-in (since most Linux distributions use `systemd(1)` nowadays) way to start a Linux system without sprinkling your filesystem with the remnants of your experiments.

Your containers will live in a directory for each one under `/var/lib/machines`. Suppose we want to create an [Arch Linux](https://www.archlinux.org/) container, we can use `pacman(8)` to bootstrap our root filesystem:

    # cd /var/lib/machines
    # mkdir ./archcontainer
    # pacstrap -i -c -d /var/lib/machines/archcontainer --noconfirm base base-devel

This will install the `base` and `base-devel` groups, essential for every Arch Linux system into our directory under `/var/lib/machines`. We then need to make a couple of configuration changes. First, we activate `systemd-networkd(8)`, `systemd(1)`'s built-in network manager. At this point, you could also use `NetworkManager(8)`. Additionally, we activate `systemd-resolved(8)`, a local DNS resolver. We use `chroot(1)` to execute the command within the container.

    # chroot /var/lib/machines/archcontainer sh -c "systemctl enable systemd-networkd systemd-resolved"

To be able to log in to your container afterwards, we have to set a passwort for the `root` account to "`r00tpw`". We use `chroot(1)` again.

    # chroot /var/lib/machines/archcontainer sh -c "echo root:r00tpw | chpasswd"

Since our login will not happen via `ssh(1)` or local login, we need to add `/dev/pts(4)` to the list of secure `tty(4)`s in `/etc/securetty(5)`.

    # echo "pts/0" >> /var/lib/archcontainer/etc/securetty

Since we used the default location for the directory containing our root filesystem, the container is automatically recognized as a machine by `machinectl(1)`.

    # machinectl start archcontainer
    # machinectl list

The last command should show your container. There are two ways to get access to your running container from the host system.
You can directly start a shell session in your container.

    # machinectl shell archcontainer

You could also get a console with a login prompt for the machine by issuing the following command.

    # machinectl login archcontainer

If you chose the latter way, you can disconnect from the console by pressing `Ctrl+5` three times within one second.
You can stop the container by issuing the following command.

    # machinectl stop archcontainer

There is another way to start the container besides using `machinectl(1)`, unsurprisingly also using `systemd(1)`, in this case [instantiated units](http://0pointer.de/blog/projects/instances.html).

    # systemctl start systemd-nspawn@archcontainer
    # systemctl status systemd-nspawn@archcontainer
    # systemctl stop systemd-nspawn@archcontainer

Do not mix the `machinectl(1)` and `systemd-nspawn(1)` way of controlling the container.

One interesting effect of the integration of all these concepts in `systemd(1)`, we can use our host's `systemctl(1)` to control the container's `systemd(1)`. For example you can list all units running in the container by issuing the following command on the host.

    # systemctl -M archcontainer status

Nevertheless, always keep in mind that this is not a full-blown container technology but a nice way to start a lightweight container to test a task or two.
