# syntax=docker/dockerfile
FROM gitpod/openvscode-server
WORKDIR /tmp
RUN sudo apt-get update -y \
    && sudo apt-get full-upgrade -y \
    && sudo apt-get install -y wget apt-transport-https software-properties-common unzip nano openssh-client apt-utils \
    && wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" \
    && sudo dpkg -i packages-microsoft-prod.deb \
    && rm packages-microsoft-prod.deb \
    && curl -fsSL https://deb.nodesource.com/setup_20.x \
    | sudo -E bash - \
    && curl -fsSL https://get.docker.com -o get-docker.sh \
    && sudo sh get-docker.sh \
    && sudo apt-get install -y nodejs powershell \
    && sudo npm i -g npm \
    && sudo npm i -g yarn \
    && git config --global user.email "pouriasa37@gmail.com" \
    && git config --global user.name "xdadev37" \
    && sudo usermod -s /usr/bin/pwsh openvscode-server
COPY proxy.conf /etc/apt/apt.conf.d/
WORKDIR /home/workspace
CMD sudo chown openvscode-server:openvscode-server /home/workspace/.docker -R \
    && yarn set version berry \
    && rm package.json
