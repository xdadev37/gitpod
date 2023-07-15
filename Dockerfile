# syntax=docker/dockerfile
FROM gitpod/openvscode-server
WORKDIR /tmp
RUN sudo apt-get update -y \
    && sudo apt-get full-upgrade -y \
    && sudo apt-get install -y wget apt-transport-https software-properties-common unzip nano openssh-client \
    && wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" \
    && sudo dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && curl -fsSL https://deb.nodesource.com/setup_20.x \
    | sudo -E bash - \
    && sudo apt-get install -y nodejs powershell \
    && sudo npm i -g npm \
    && sudo npm i -g yarn \
    && yarn set version berry \
    && rm package.json
