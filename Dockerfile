FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y dirmngr \
		       less \
		       ssh \
		       sudo \
		       time \
		       iproute2 \
		       libzstd1-dev \
		       bison \
		       ccache \
		       cmake \
		       curl \
		       flex \
		       git-core \
		       gcc \
		       g++ \
		       inetutils-ping \
		       libapr1-dev \
		       libbz2-dev \
		       libcurl4-gnutls-dev \
		       libevent-dev \
		       libkrb5-dev \
		       libpam-dev \
		       libperl-dev \
		       libreadline-dev \
		       libssl-dev \
		       libxerces-c-dev \
		       libxml2-dev \
		       libyaml-dev \
		       libzstd-dev \
		       locales \
		       net-tools \
		       ninja-build \
		       openssh-client \
		       openssh-server \
		       openssl \
		       python-dev \
		       python-lockfile \
		       python-paramiko \
		       python-pip \
		       python-psutil \
		       python-yaml \
		       zlib1g-dev

#
# Root specific steps
#
RUN useradd -md /home/gpadmin/ gpadmin

RUN echo "gpadmin ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/gpadmin && \
    chmod 0440 /etc/sudoers.d/gpadmin

RUN locale-gen en_US.UTF-8

#
#  All user specific steps
#
USER gpadmin
    
RUN ssh-keygen -f ~/.ssh/id_rsa -N '' \
    && cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys

RUN sudo service ssh start && \
    ssh-keyscan -H localhost >> ~/.ssh/known_hosts

