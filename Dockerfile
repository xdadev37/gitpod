# syntax=docker/dockerfile
FROM reg.oncolog.ir/openvscode-server
WORKDIR /tmp
RUN apt-get update -y \
    && apt-get full-upgrade -y \
    && apt-get install -y wget apt-transport-https software-properties-common \
    && wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" \
    && dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell
RUN useradd -ms /usr/bin/pwsh pouriasa
USER pouriasa
RUN apt-get install unzip nano \
    && curl -fsSL https://deb.nodesource.com/setup_20.x \
    | bash - \
    && apt-get install -y nodejs \
    && npm i -g npm \
    && npm i -g yarn \
    && yarn set version berry \
    && rm package.json
WORKDIR /home/workspace/Projects
