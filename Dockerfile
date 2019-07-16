FROM centos:centos7
ARG ANSIBLE_VERSION=2.4.*
ARG VAGRANT_VERSION=2.0.4

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

RUN pip install --upgrade pip \
	&& pip install 'requests[security]' ansible==$ANSIBLE_VERSION \
	&& yum install -y "https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/vagrant_${VAGRANT_VERSION}_x86_64.rpm" \
	&& vagrant plugin install vagrant-google

CMD ansible
