FROM debian:jessie

ENV LANG=en_US.UTF-8 DEBIAN_FRONTEND=noninteractive 
# Install packages for building ruby
RUN echo 'deb http://packages.linuxmint.com debian import' >> /etc/apt/sources.list \
  && apt-get update \
  &&  apt-get install -y --force-yes --no-install-recommends software-properties-common xvfb x11vnc   libgtk2.0-0 libasound2 libXcomposite1 \
  fonts-ipafont-gothic openjdk-7-jre-headless firefox \
 && apt-get clean &&  rm -rf /var/lib/apt/lists/* 

ADD http://selenium-release.storage.googleapis.com/2.52/selenium-server-standalone-2.52.0.jar /opt/selenium-server.jar

Add ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD exec /opt/start.sh
EXPOSE 4444 5900 
