---
layout: post
title: "First Steps with runC Containers"
description: "Because Docker was just the beginning"
category: personal
tags:
- tech
- comment
- linkdump
---
{% include JB/setup %}

## Installation

    cd
    mkdir -pv go/src/github.com/opencontainers
    export GOPATH=$HOME/go
    cd go/src/github.com/opencontainers
    git clone https://github.com/opencontainers/runc
    cd runc
    make
    sudo make install

## First Usage

    cd ~/go/src
    git init myproject
    cd myproject
    runc spec > config.json
    mkdir rootfs
    echo rootfs >> .gitignore


    docker pull centos:7
    docker export $(docker create centos:7) > centos.tar
    tar -C rootfs -xf centos.tar
    sed -i 's/\"user\"\:\ \"daemon\"/\"user\"\:\ \"root\"/g' config.json  # change user from daemon to root
    runc
