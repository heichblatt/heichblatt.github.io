---
layout: post
title: "Installing Shrew Soft IPsec VPN Client on CentOS 7"
description: "TODO"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}

To install [Shrew Soft IPsec VPN Client](https://www.shrew.net/download/ike) on CentOS 7, follow these steps.

    yum groupinstall -y "Development Tools"
    yum install -y wget qt qt-devel cmake make openssl-devel libedit-devel
    wget -P /usr/src https://www.shrew.net/download/ike/ike-2.2.1-release.tgz
    cd /usr/src
    tar xf ike-2.2.1-release.tgz
    cd ike
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES
    make
    make install
