---
layout: post
title: "First Steps with runC"
description: "Because Docker was just the beginning"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}

We will take a look at [runC](https://github.com/opencontainers/runc), a tool

> for spawning and running containers according to the OCF specification.

You can read more about the [Open Container Format specification](https://github.com/opencontainers/specs), read [their website](https://runc.io/) or the the [announcement by Docker Inc](https://blog.docker.com/2015/06/runc/).

## Installation

I use Fedora 22.

    export GOPATH=$HOME/golang
    mkdir -pv $GOPATH/src/github.com/opencontainers
    cd $GOPATH/src/github.com/opencontainers
    git clone https://github.com/opencontainers/runc
    cd runc
    make
    sudo make install   # forgive me

## First Usage

We have runC create a template container definition. We then create a directory called `rootfs` to keep our filesystem.

    runc spec > config.json
    mkdir rootfs

We pull the current CentOS image.

    docker pull centos:7

We export said image to a tarball.

    docker export $(docker create centos:7) > centos.tar

We then expand that tarball to the sub-directory `rootfs`, remove the tarball and `chmod` the directory to root.

    tar -C rootfs -xf centos.tar
    rm centos.tar
    sudo chown root:root -R rootfs

Because UTS namespaces are [not supported yet](http://crosbymichael.com/creating-containers-part-1.html), we need to remove the `hostname` line.

    sed -i '/hostname/d' config.json

We then make the `rootfs` writable (`readonly: false`). This command will remove the tabs before the `readonly` line. This is only cosmetical but easier than dealing with `sed`'s tab handling.

    sed -i '/\"rootfs\"\,/!b;n;c\"readonly\"\:\ false' config.json

runC needs to run as root, yet root does not have `/usr/bin/local` in her `$PATH` so we call the binary  with its full path.

    /usr/local/bin/runc

We're in.

    sh-4.2#

## Notes

While I was preparing this post, Georg Kunz of CloudGear wrote a [very similar howto](https://www.cloudgear.net/blog/2015/getting-started-with-runc/). And got featured in [Docker Weekly](https://blog.docker.com/docker-weekly-archives/). I think mine has enough difference and additional detail to publish it anyway. See also the [official documentation](https://github.com/opencontainers/runc), which at the time of writing is incomplete.
Keep in mind that runC is still pre-alpha.
