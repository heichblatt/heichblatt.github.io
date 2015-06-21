---
layout: post
title: "First Steps using diskimage-builder"
description: "TODO"
category: personal
tags:
- tech
- comment
---
{% include JB/setup %}

## Requirements

* root access to a CentOS 7 machine

## Installation

Install Python [pip](https://pip.pypa.io/en/stable/) and some dependencies of dib.

    yum install python-pip libyaml-devel gcc python-devel
    pip install diskimage-builder
