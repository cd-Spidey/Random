#!/usr/bin/env bash

# Copyright (C) Azul 2022. All rights reserved.
# SPDX-License-Identifier: GPL-3.0-only
# Script to setup an AOSP Build environment on Ubuntu 20.04 or latest.

# Initial Preparation
sudo apt-get -q update

# Initial Packages
sudo apt-get -yq install gnupg curl 

# Setup Azul's Public Key
sudo apt-key adv \
    --keyserver hkp://keyserver.ubuntu.com:80 \
    --recv-keys 0xB1998361219BD9C9

# Download Azul's Repo
curl -O https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb

# Install Azul's Repo
sudo apt-get install ./zulu-repo_1.0.0-3_all.deb

# Post Update
sudo apt-get update

# Install Java-Zulu v18
sudo apt-get install zulu18-jdk
