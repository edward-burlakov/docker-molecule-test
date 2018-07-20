# Docker image to run Molecule from a Jenkinsfile
FROM centos:7

RUN yum update -y
RUN yum install -y epel-release deltarpm
RUN yum install -y python python2-pip
RUN yum install -y gcc python-devel
RUN yum install -y docker

RUN yum install -y sudo
# Shortcut for build tools. Way too much !!
# RUN yum groupinstall -y "Development Tools"

RUN pip install molecule
RUN pip install docker

RUN adduser molecule
RUN echo "molecule ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/molecule
USER molecule
WORKDIR /home/molecule

CMD ["molecule"]

#includedir /etc/sudoers.d
# molecule ALL=(ALL) NOPASSWD:ALL
