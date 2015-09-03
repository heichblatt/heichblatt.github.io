---
layout: post
title: "Install Docker Compose on Fedora"
description: "Not everyone uses Ubuntu"
category: personal
tags:
- tech
- howto
---
{% include JB/setup %}
Fedora 22 currently only has [version 1.0.0](https://apps.fedoraproject.org/packages/fig/overview/) of [Docker Compose](https://docs.docker.com/compose/install/) in its repositories and the instructions on Docker's website do not work at the moment. I'm here to help.

    sudo dnf install python-devel gcc
    sudo pip install -U docker-compose==1.4.0 websocket
    docker-compose --version