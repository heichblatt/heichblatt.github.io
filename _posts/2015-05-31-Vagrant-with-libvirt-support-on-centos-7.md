---
layout: post
title: "Vagrant with libvirtd on CentOS 7"
description: "Provisioning configurable test VMs on a professional provider"
category: personal
tags: tech

---
{% include JB/setup %}

[Vagrant](http://vagrantup.com/) is a tool to

> [c]reate and configure lightweight, reproducible, and portable development environments.

It takes a declarative definition (a [Vagrantfile](https://docs.vagrantup.com/v2/vagrantfile/index.html)) of a virtual machine and creates that machine for you. Among its supported virtualization technologies are [VirtualBox](http://virtualbox.org) and [libvirt](http://libvirt.org/). We want to be able to do this on a server running CentOS 7 and use an [already installed `libvirtd`](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Virtualization_Deployment_and_Administration_Guide/) as the provider.

First, we remove any previously installed versions of Vagrant.

{% highlight bash %}
yum remove vagrant
{% endhighlight %}

We will install Vagrant from the [jstribny/vagrant1](https://copr.fedoraproject.org/coprs/jstribny/vagrant1/) [COPR](https://fedorahosted.org/copr/) which depends on two other COPRs providing the [Ruby200](https://www.softwarecollections.org/en/scls/rhscl/ruby200/) and [Ror40](https://www.softwarecollections.org/en/scls/rhscl/ror40/) [Software Collections](https://www.softwarecollections.org/). This is the way [Fedora Magazine recommended](http://fedoramagazine.org/running-vagrant-fedora-22/).

{% highlight bash %}
cd /etc/yum.repos.d/
wget https://copr.fedoraproject.org/coprs/rhscl/ruby200-el7/repo/epel-7/rhscl-ruby200-el7-epel-7.repo
wget https://copr.fedoraproject.org/coprs/rhscl/ror40-el7/repo/epel-7/rhscl-ror40-el7-epel-7.repo
wget https://copr.fedoraproject.org/coprs/jstribny/vagrant1/repo/epel-7/jstribny-vagrant1-epel-7.repo
yum install vagrant1 vagrant1-vagrant-libvirt
{% endhighlight %}

Because we want to use our own default provider instead of VirtualBox, we need to tell Vagrant by setting an environment variable. You may append this into your shell configuration file ([or your Vagrantfile](http://fabiorehm.com/blog/2013/11/12/set-the-default-vagrant-provider-from-your-vagrantfile/)).

{% highlight bash %}
export VAGRANT_DEFAULT_PROVIDER=libvirt
{% endhighlight %}

Now we activate the `vagrant1` Software Collection for our current shell.
{% highlight bash %}
scl enable vagrant1 $SHELL
{% endhighlight %}

Change into the directory containing our Vagrantfile (for example by cloning and entering [vagrant-fedora22](https://github.com/heichblatt/vagrant-fedora22)) and start the VM.

{% highlight bash %}
vagrant up
{% endhighlight %}
