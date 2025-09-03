#!/bin/bash
apt-get update

apt-get -y install unzip wget bc git

# to be installed if daily cron tasks are configured
apt-get -y install cron
