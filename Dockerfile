FROM ubuntu:trusty
MAINTAINER Jakub Porebski <jakub.porebski@gmail.com>

# PRevent dpkg errors
ENV TERM=xterm-256color

RUN sed -i "s/http:\/\/archive./http:\/\/pl.archive./g" /etc/apt/sources.list

# Install Ansible
RUN apt-get update -qy && \
    apt-get install -qy software-properties-common && \
    apt-add-repository -y ppa:ansible/ansible && \
    apt-get update -qy && \
    apt-get install -qy ansible

# Add Volume for Ansible playbook
VOLUME /ansible
WORKDIR /ansible

# Entrypoint
ENTRYPOINT ["ansible-playbook"]
CMD ["site.yml"]
