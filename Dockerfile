FROM conyac/base:ubuntu20170517.1

COPY ./scripts /opt/
RUN /opt/build.sh

EXPOSE 5555 5900 
CMD exec /opt/start.sh
