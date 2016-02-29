#!/bin/sh

export DISPLAY=:10
/usr/bin/Xvfb :10 -screen 0 1024x768x24 -ac &
SELENIUM_HUB_PORT=${SELENIUM_HUB_PORT:-"4444"}
SELENIUM_NODE_PORT=${SELENIUM_NODE_PORT:-"5555"}

[ -z "${SELENIUM_HUB_HOST}" ] && exit 1

exec /usr/bin/java -jar /opt/selenium-server.jar \
  -role webdriver \
  -hub  http://${SELENIUM_HUB_HOST}:${SELENIUM_HUB_PORT}/grid/register \
  -port ${SELENIUM_NODE_PORT}



