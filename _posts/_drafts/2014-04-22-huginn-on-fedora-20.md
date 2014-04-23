---
layout: post
title: "Install Huginn on Fedora 20"
description: "TODO"
category: personal
tags: TODO
- tech
- howto
---
{% include JB/setup %}

    yum install -y ruby rubygems ruby-devel gcc-c++ mysql-server mysql-devel
    yum groupinstall -y "Development Tools"
    systemctl start mariadb.service
    mysql_secure_installation
    systemctl restart mariadb.service
    systemctl enable mariadb.service
    gem install rake bundle
    mysql -u root -p
    mysql> CREATE DATABASE huginn CHARACTER SET utf8;
    mysql> GRANT ALL ON huginn.* TO 'huginn'@'localhost' IDENTIFIED BY 'huginn' WITH GRANT OPTION;
    mysql> \q
    adduser huginn
    su - huginn
    cd ~
    git clone git@github.com:cantino/huginn.git
    cd huginn
    bundle install
