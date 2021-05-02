FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    \
    apt-get install -y --no-install-recommends -qq \
        p7zip-full ca-certificates locales libgl1 wget gnupg software-properties-common && \
    \
    wget -nc https://dl.winehq.org/wine-builds/winehq.key -P /tmp/ && \
    apt-key add /tmp/winehq.key && \
    rm -f /tmp/winehq.key && \
    \
    add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' && \
    apt-get install -y winehq-stable && \
    rm -rf /var/lib/apt/lists/*

ARG ARG_UID
ARG ARG_GID
ARG ARG_USER

RUN locale-gen "en_US.UTF-8" && \
    mkdir -p /home/${ARG_USER} && \
    bash -c "echo \"${ARG_USER}:x:${ARG_UID}:${ARG_GID}:User,,,:/home/${ARG_USER}:/bin/bash\" >> /etc/passwd" && \
    bash -c "echo \"${ARG_USER}:x:${ARG_GID}:\" >> /etc/group" && \
    chown "${ARG_UID}:${ARG_GID}" -R /home/${ARG_USER} && \
    true

USER ${ARG_USER}

VOLUME /home/${ARG_USER}

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
