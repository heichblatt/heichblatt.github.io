---
layout: post
title: "Installing OpenVPN Server on CentOS/RH/Scientific Linux"
description: "TODO"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
There are a couple of How-Tos around the net but none of them worked for me so I just want to dump my command line history here. This is loosely based on [Digital Ocean's How-To](https://www.digitalocean.com/community/articles/how-to-setup-and-configure-an-openvpn-server-on-centos-6) but includes some additions and corrections. I use CentOS 6.5.

    yum install openvpn -y
    yum install easy-rsa -y
    cp /usr/share/doc/openvpn-2.3.2/sample/sample-config-files/server.conf /etc/openvpn/server.conf
    vim openvpn/server.conf # set dh dh2048.pem
    mkdir -p /etc/openvpn/easy-rsa
    cp -rf /usr/share/easy-rsa/2.0/* /etc/openvpn/easy-rsa/
    cd /etc/openvpn/easy-rsa/
    vim vars # define your variables
    cp /etc/openvpn/easy-rsa/openssl-1.0.0.cnf /etc/openvpn/easy-rsa/openssl.cnf
    cd /etc/openvpn/easy-rsa/
    source ./vars 
    ./clean-all
    ./build-ca 
    time ./build-dh # this takes forever
    ./build-key-server server
    cd /etc/openvpn/easy-rsa/keys
    cp dh2048.pem ca.crt server.crt server.key /etc/openvpn/
    cd /etc/openvpn/easy-rsa/
    ./build-key --batch client1
    # the next three lines set 10.8.0.10 as static IP for client1 
    vim /etc/openvpn/server.conf # uncomment client-config-dir ccd
    mkdir -p /etc/openvpn/ccd
    echo "ifconfig-push 10.8.0.10 10.8.0.11" > /etc/openvpn/ccd/client1
    service openvpn start

If you have several clients you can use the following script to ease generating keys for them. Substitute USERNAME with your own username.

    #!/bin/bash
    [ $# -eq 0 ] && { echo "Usage: $0 client_id"; exit 1; }
    ID="$1"
    cd /etc/openvpn/easy-rsa
    source ./vars
    ./build-key --batch "$ID"
    tar czvf /tmp/"$ID".tgz ./keys/{"$ID"*,ca.crt}
    chown USERNAME /tmp/"$ID".tgz

After each run, you can pull the new keys to your client and use them.

    scp $YOURSERVER:/tmp/$YOURCLIENT.tgz .
