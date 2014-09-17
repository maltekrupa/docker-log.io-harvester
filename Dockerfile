FROM debian:jessie

RUN apt-get update

# Install curl and nodejs
RUN apt-get -y install curl && curl -sL https://deb.nodesource.com/setup | bash -

# Add requirements, add user and install log.io
RUN apt-get -y install adduser make gcc g++ nodejs
RUN adduser --shell /bin/false --gecos "" --disabled-password logio
RUN export USER=logio; export HOME=/home/logio; npm install -g log.io --user "logio"

USER logio
ENV HOME /home/logio
ENV USER logio
WORKDIR /home/logio
EXPOSE 28777 28778

CMD log.io-harvester
