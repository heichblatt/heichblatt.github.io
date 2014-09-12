---
layout: post
title: "Build your own Centos 7 media"
description: "before they are released"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
We use Red Hat Linux derivatives at work, so naturally, this year's launch of RHEL 7 will bring a lot of changes and potential pitfalls for me that I want to anticipate and get to know beforehand. CentOS 7 won't be released for another few months and the RC of RHEL is simply too restricted for my purposes. There is, however, a way to build my own live medium with the Kickstart files provided by the [live media special interest group of the CentOS project](https://github.com/CentOS/sig-core-livemedia) as was hinted at in [Fabian Arrotin's article](http://seven.centos.org/2014/05/centos-7-live-media-spins/).

We will use virt-install for this and provide an URL to the current package tree and said kickstart config.

	sudo yum install virt-install
	git clone https://github.com/CentOS/sig-core-livemedia.git
	cd sig-core-livemedia/kickstarts/
	vim centos-7-live-gnome.cfg  # set root password
	sudo virt-install --name centos7 \
		--hvm \
		--ram 1024 \
		--disk path=/var/lib/libvirt/images/centos7.img,size=10,size=10 \
		--network network:default \
		--vnc \
		--os-type=linux \
		--os-variant=rhel7 \
		--location http://ftp.redhat.com/redhat/rhel/rc/7/Client/x86_64/os/ \
		-x centos-7-live-gnome.cfg