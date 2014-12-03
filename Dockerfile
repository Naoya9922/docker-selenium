FROM conyac/base:latest

# Install packages for building ruby
RUN apt-get -y update
RUN apt-get install -y software-properties-common xvfb \
    fonts-ipafont-gothic openjdk-7-jre-headless firefox &&  apt-get clean
ADD http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar /opt/selenium-server.jar
Add ./start.sh /opt/start.sh
RUN chmod +x /opt/start.sh
CMD /opt/start.sh
