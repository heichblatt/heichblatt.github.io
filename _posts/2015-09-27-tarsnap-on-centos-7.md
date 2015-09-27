---
layout: post
title: "Install Tarsnap on CentOS 7"
description: "Because Backups"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
To use the excellent [Tarsnap online backup service](https://www.tarsnap.com/) on a CentOS 7 system, follow these steps:

    cd /usr/src/
    wget https://www.tarsnap.com/download/tarsnap-autoconf-1.0.36.1.tgz
    tar xf tarsnap-autoconf-1.0.36.1.tgz 
    wget https://www.tarsnap.com/download/tarsnap-sigs-1.0.36.1.asc
    cat tarsnap-sigs-1.0.36.1.asc 
    sha256sum -c tarsnap-sigs-1.0.36.1.asc
    cd tarsnap-autoconf-1.0.36.1
    yum install gcc e2fsprogs-devel zlib-devel openssl-devel 
    ./configure 
    make
    make install
    cp /usr/local/etc/tarsnap.conf.sample /usr/local/etc/tarsnap.conf

Edit `/usr/local/etc/tarsnap.conf`. Then create a key:

    /usr/local/bin/tarsnap-keygen --keyfile /root/tarsnap.key --user YOUR_USER_ID --machine MACHINE_ID

Copy the key to a save location, otherwise you cannot access the backup data in case of loss of this key.

Create cronjobs like this one:

    @daily  /usr/local/bin/tarsnap -c -f my-root-server-$(date +\%Y\%m\%d) /var/lib/mysql /home /etc /var/log
