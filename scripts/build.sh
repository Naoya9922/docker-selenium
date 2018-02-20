#!/bin/bash 

set -ex
apt-get update 

apt-get install -y --no-install-recommends software-properties-common xvfb x11vnc  libasound2 libxcomposite1 x11vnc fonts-ipafont-gothic openjdk-9-jre-headless firefox dbus

apt-get clean 
rm -rf /var/lib/apt/lists/* 
dbus-uuidgen > /etc/machine-id
IFS_ORIGINAL="$IFS"
IFS=.
set -- $SELENIUM_VERSION
SELENIUM_MINOR_VERSION="$1.$2"
IFS="$IFS_ORIGINAL"

curl http://selenium-release.storage.googleapis.com/$SELENIUM_MINOR_VERSION/selenium-server-standalone-${SELENIUM_VERSION}.jar -o /opt/selenium-server.jar

# geckdriver 
curl -L https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz -o /tmp/geckodriver.tar.gz
cd /tmp/
tar xvzf geckodriver.tar.gz
cp /tmp/geckodriver /usr/bin/

### chrome driver
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
#echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
#apt-get install -y --no-install-recommends google-chrome-stable dbus
#apt-get update 
#curl -L https://chromedriver.storage.googleapis.com/2.30/chromedriver_linux64.zip -o /tmp/chromedriver.zip
#cd /tmp/
#unzip chromedriver.zip
#cp /tmp/chromedriver /usr/bin/
#
