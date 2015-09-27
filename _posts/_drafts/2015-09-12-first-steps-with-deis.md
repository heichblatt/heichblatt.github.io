---
layout: post
title: "First Steps with Deis"
description: "TODO"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
TODO: What is Deis?

## Requisites: 

* Fedora 22
* VirtualBox 4.3
* Vagrant

## Installation

First, we clone the [Deis GitHub repo](https://github.com/deis/deis) and cd into the clone.

    git clone https://github.com/deis/deis.git
    cd deis

Deis on Vagrant needs the triggers plugin for Vagrant, which in turn has its own dependencies. We install first them and then the plugin itself.

    sudo dnf install libvirt-devel gcc-c++
    vagrant plugin install vagrant-triggers

We then generate a discovery URL.

    make discovery-url

Finally, we can start building our Deis cluster. The next command will provision and start three Deis VMs based on [CoreOS](https://coreos.com/).

    vagrant up

After this quite time consuming step, we now have three VMs running.

    vagrant status
    Current machine states:

    deis-01                   running (virtualbox)
    deis-02                   running (virtualbox)
    deis-03                   running (virtualbox)

    vagrant ssh deis-01
    deisctl --version
    export DEISCTL_TUNNEL=172.17.8.100
    deisctl config platform set domain=example.com

