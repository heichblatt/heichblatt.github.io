---
layout: post
title: "Dockerized Oracle Linux"
description: ""
category: personal
tags:
- tech
---
{% include JB/setup %}
If you ever find yourself in need of a Docker container based on [Oracle Linux](http://www.oracle.com/technetwork/server-storage/linux/overview/index.html), the following command will get you there:

    wget -O- --no-check-certificate https://public-yum.oracle.com/docker-images/OracleLinux/OL7/oraclelinux-7.0.tar.xz \
      | unxz \
      | docker load
    docker images|grep oraclelinux
    docker run -ti oraclelinux:7.0 bash
    cat /etc/oracle-release
      Oracle Linux Server release 7.0

Obviously, running OL under Docker prevents you fromt taking advantage of the [Unbreakable Enterprise Kernel](http://www.oracle.com/technetwork/server-storage/linux/technologies/uek-overview-2043074.html).
