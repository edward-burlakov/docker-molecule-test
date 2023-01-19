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
    bash \
    curl \
    tini
RUN yum install -y python3-pip
RUN yum install -y python3-psutil
RUN yum install -y python3-devel.x86_64
RUN pip3 install paramiko
RUN pip3 install docker molecule

RUN addgroup -g ${gid} ${group} \
  && adduser \
    -h "${molecule_user_home}" \
    -u "${uid}" \
    -G "${group}" \
    -s /bin/bash \
    -D "${user}" \
  && echo "${user}:${user}" | chpasswd

# Custom start script
COPY ./entrypoint.bash /usr/local/bin/entrypoint.bash

# Default working directory
# USER ${user}
WORKDIR ${molecule_user_home}

# Define the "default" entrypoint command executed on the container as PID 1
ENTRYPOINT ["/sbin/tini","-g","--","bash","/usr/local/bin/entrypoint.bash"]
