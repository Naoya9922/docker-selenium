#!/bin/bash 

set -e 
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
apt-get update 

apt-get install -y --no-install-recommends software-properties-common xvfb x11vnc  libasound2 libxcomposite1 x11vnc fonts-ipafont-gothic openjdk-9-jre-headless firefox google-chrome-stable

apt-get clean 
rm -rf /var/lib/apt/lists/* 
curl http://selenium-release.storage.googleapis.com/3.4/selenium-server-standalone-3.4.0.jar -o /opt/selenium-server.jar

# geckdriver 
curl -L https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz -o /tmp/geckodriver.tar.gz
cd /tmp/
tar xvzf geckodriver.tar.gz
cp /tmp/geckodriver /usr/bin/

# chrome driver
curl -L https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip -o /tmp/chromedriver.zip
cd /tmp/
unzip chromedriver.zip
cp /tmp/chromedriver /usr/bin/

