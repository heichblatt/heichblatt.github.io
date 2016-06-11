---
layout: post
title: "Accessing a FritzBox via VPN from Debian Wheezy"
description: "Someone has to do it"
category: personal
tags:
- tech
- comment
- howto
---
{% include JB/setup %}
{% include JB/setup %}

Suppose, we are on a Debian box running wheezy, how can we connect to a
FritzBox VPN?

We need to install ShreSoft VPN Client locally. Get the tarball on the
[downloads page](https://www.shrew.net/download/ike).

    wget https://www.shrew.net/download/ike/ike-2.2.1-release.tgz
    tar xf ./ike-2.2.1-release.tgz
    cd ike
    sudo apt-get install -y libqt4-dev qt4-dev-tools build-essential
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DQTGUI=YES -DETCDIR=/etc -DNATT=YES -LIBDIR=/lib
    make qikec qikea
    sudo checkinstall make install

Start the daemon (`iked`) and the client (`qikec`).

    sudo iked &
    qikec &

In the client, create a new connection with [the following
settings](http://www.avm.de/de/Service/Service-Portale/Service-Portal/VPN_Interoperabilitaet/15729.php)
:

-   General:
    -   "Host Name or IP Adress" host name of your FritzBox
    -   "Port" 500
    -   "Auto Configuration" "ike config pull"
    -   "Adress Method" "Use a virtual adapter and assigned address"
    -   Activate "Obtain Automatically".

<!-- -->

-   [Client]() keep defaults
-   "Name Resolution"
    -   Deactivate "Enable WINS", "Enable DNS" and [Enable Split DNS]()
-   "Authentication"
    -   "Authentication Method" "Mutual PSK".
    -   "Local Identity"
        -   "Identification Type" "User Fully Qualified Domain Name".
        -   "UFQDN String" VPN user's e-mail address
    -   "Remote Identity"
        -   "Identification Type" "IP Address"
        -   "Use a discovered remote host address".
    -   "Credentials"
        -   "Pre Shared Key" your VPN password
-   "Phase 1"
    -   "Exchange Type" "aggressive"
    -   "Dh Exchange" "group 2"
    -   "Cipher Algorithm" "aes"
    -   "Cipher Key Length" "256" bits
    -   "Hash Algorithm" "sha1".
    -   "Key Life Time limit" "3600"
-   "Phase 2"
    -   "Transform Algorithm" "esp-aes"
    -   "Transform Key Length" "256" bits
    -   "HMAC Algorithm" "sha1"
    -   "PFS Exchange" "group 2"
    -   "Compress Algorithm" "deflate"
-   "Policy"
    -   deactivate "Maintain Persistent Security Associations" and
        "Obtain Topology Automatically or Tunnel All".
    -   click "Add", window "Topology Entry"
        -   "Type" "Include".
        -   "Address" IP network (192.168.100.0) of the FritzBox
        -   "Netmask" subnet mask (255.255.255.0) of the FritzBox
        -   "OK".
-   "Save"

