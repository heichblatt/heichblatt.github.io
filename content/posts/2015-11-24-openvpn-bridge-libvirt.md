---
title: "Access a Remote LibVirt Network via OpenVPN"
date: 2015-11-24
draft: false
tags: 
  - tech
  - howto
---
This is very loosely based on a [how-to by the Koofr team](http://koofr.net/bridging-two-host-local-virtual-networks-with-openvpn/).
We assume the following:

- You have a remote box with libvirtd running on a RHEL 7-compatible OS.
- You have created a network 192.168.100.0/24 in said libvirtd.
- You want to access the VMs in said network from your local box.
- The bridge interface is called virbr1.

We start on the remote server. First, we install the necessary software packages.

    yum install openvpn easy-rsa 
    mkdir -p /etc/openvpn/easy-rsa
    cp -rf /usr/share/easy-rsa/2.0/* /etc/openvpn/easy-rsa/
    cd /etc/openvpn/easy-rsa/
    vim vars  # set your vars
    cp /etc/openvpn/easy-rsa/openssl-1.0.0.cnf /etc/openvpn/easy-rsa/openssl.cnf

Now we create some keys and certificates.

    cd /etc/openvpn/easy-rsa/
    source ./vars 
    ./clean-all
    ./build-ca   # build CA key and certificate
    ./build-dh   # build Diffie-Hellman parameters
    ./build-key-server server
    ./build-key client  # your client key and certificate
    cd /etc/openvpn
    cp easy-rsa/keys/ca.{crt,key} easy-rsa/keys/dh2048.pem easy-rsa/keys/server.{crt,key} .

Put the following in /etc/openvpn/libvirt-bridge.conf, your server config:

    mode server
    tls-server
    local YOUR_SERVERS_PUBLIC_IP
    port 1194
    proto udp
    dev tap0
    script-security 2
    up "/etc/openvpn/bridgeup.sh virbr1 tap0 1500"
    down "/etc/openvpn/bridgedown.sh virbr1 tap0"
    persist-key
    persist-tun
    ca ca.crt
    cert server.crt
    key server.key
    dh dh2048.pem
    cipher BF-CBC
    comp-lzo yes
    ifconfig-pool-persist ipp.txt
    server-bridge 192.168.100.1 255.255.255.0 192.168.100.201 192.168.100.201
    max-clients 3   # only this many clients can connect simultaneously
    user nobody
    group nobody
    keepalive 10 120
    status server.log
    verb 3

You might have noticed two scripts mentioned in the config: `bridgeup.sh` and `bridgedown.sh`. These are the scripts OpenVPN calls when it successfully creates and destroys its own network interface. They add or remove the OpenVPN interface from the LibVirt bridge, respectively.

`bridgeup.sh`

    #!/bin/sh
    BR=$1
    DEV=$2
    MTU=$3
    /sbin/ip link set "$DEV" up promisc on mtu "$MTU"
    /sbin/brctl addif "$BR" "$DEV"
    exit 0

`bridgedown.sh`

    #!/bin/sh 
    BR=$1
    DEV=$2
    /sbin/brctl delif "$BR" "$DEV"
    /sbin/ip link set "$DEV" down
    exit 0

Finally, we open the OpenVPN port in [firewalld](https://fedoraproject.org/wiki/FirewallD).

    firewall-cmd --get-active-zones   # find out your currently active zone
    firewall-cmd --zone=public  --add-port=1194/udp # change current config
    firewall-cmd --zone=public  --add-port=1194/udp --permanent # change permanent config

After starting the service (careful, [systemd instantiated units](http://0pointer.de/blog/projects/instances.html)), we should be done with the server side.

    systemctl enable openvpn@libvirt-bridge
    systemctl start openvpn@libvirt-bridge

On your local machine, install OpenVPN, download `ca.crt`, `client.crt` and `client.key` from your server and put them in one directory. On SELinux-enabled machines this directory should be under `~/.cert`. Then we add our `client.conf`, which should look like this:

    client
    remote YOUR_SERVERS_PUBLIC_IP 1194
    dev tap 
    proto udp
    resolv-retry infinite
    nobind
    persist-key
    persist-tun
    verb 2
    ca YOUR_HOME/.cert/myvpn/ca.crt
    cert YOUR_HOME/.cert/myvpn/client.crt
    key YOUR_HOME/.cert/myvpn/client.key
    comp-lzo yes
    script-security 2

You can now start your client with

    sudo openvpn --config client.conf

After that, you should be able to connect directly to your VMs living in your libvirtd network, e.g.

    nmap -p 22 192.168.100.123
