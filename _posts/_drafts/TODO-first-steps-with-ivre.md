---
layout: post
title: "First Steps with IVRE"
description: "TODO"
category: howto
tags: TODO
- tech
- howto
---
{% include JB/setup %}

Posts http://pierre.droids-corp.org/blog/html/tags/ivre.html
HowTo http://pierre.droids-corp.org/blog/html/2014/09/12/_active__network_recon_with_ivre.html

    git clone https://github.com/cea-sec/ivre/
    cd ivre
    cd docker
    mkdir -m 1777 var_lib_mongodb var_log_mongodb ivre-share
    vagrant up --no-parallel
    docker exec -ti $(docker ps |grep "ivre/client") bash


    cd /ivre-share/
    runscans --range 192.168.1.1 192.168.1.254 --limit 1000 --nmap-ports fast --output XMLFork --processes 10
    nmap2db -r -s Scanner001 -c RANGE-192.168.1.1-192.168.1.254 scans/RANGE-192.168.1.1-192.168.1.254/up/
