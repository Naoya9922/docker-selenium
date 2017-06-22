#!/bin/bash 

set -e 
apt-get update 
apt-get install -y --no-install-recommends software-properties-common xvfb x11vnc  libasound2 libxcomposite1 x11vnc fonts-ipafont-gothic openjdk-9-jre-headless firefox 
apt-get clean 
rm -rf /var/lib/apt/lists/* 
curl http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar -o /opt/selenium-server.jar
curl -L https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz -o /tmp/geckodriver.tar.gz
cd /tmp/
tar xvzf geckodriver.tar.gz
cp /tmp/geckodriver /usr/bin/

