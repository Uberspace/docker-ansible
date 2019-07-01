FROM centos:centos7
ARG ANSIBLE_VERSION=2.7.0
ARG VAGRANT_VERSION=2.2.5

RUN yum install -y epel-release \
	&& yum upgrade -y \
	&& yum install -y \
		bind-utils \
		gcc \
		git \
		libffi-devel \
		openssl \
		openssl-devel \
		python-devel \
		python-libcloud \
		python-pip \
		rsync

RUN pip install --upgrade pip 'requests[security]' ansible~=$ANSIBLE_VERSION
RUN yum install -y "https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/vagrant_${VAGRANT_VERSION}_x86_64.rpm"
RUN vagrant plugin install vagrant-google

CMD ansible
