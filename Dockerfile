FROM postgres:11
MAINTAINER magno.mabreu@gmail.com
RUN mkdir /opt/arcanjo-db
COPY ./arcanjo.sql /opt/arcanjo-db/
