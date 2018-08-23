# Docker image to run Molecule from a Jenkinsfile w/ Docker in Docker
FROM docker:stable-dind

# Defining default variables and build arguments
ARG user=molecule
ARG group=molecule
ARG uid=1000
ARG gid=1000
ARG molecule_user_home=/home/${user}

RUN apk add --no-cache \
    ansible \
    python2-dev \
    py2-pip \
    py2-psutil \
    py2-paramiko

RUN pip install docker molecule

RUN addgroup -g ${gid} ${group} \
  && adduser \
    -h "${molecule_user_home}" \
    -u "${uid}" \
    -G "${group}" \
    -s /bin/bash \
    -D "${user}" \
  && echo "${user}:${user}" | chpasswd

# Default working directory
USER ${user}
WORKDIR ${molecule_user_home}
