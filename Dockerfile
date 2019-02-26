FROM ubuntu:18.04

RUN apt-get update \
 && apt-get install -y dirmngr \
		       less \
		       ssh \
		       sudo \
		       time \
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

		       

# Create gpadmin user and add the user to the sudoers
RUN useradd -md /home/gpadmin/ gpadmin

