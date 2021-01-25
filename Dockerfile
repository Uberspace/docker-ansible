FROM centos:centos7
ARG ANSIBLE_VERSION=2.10.*
ARG VAGRANT_VERSION=2.2.5
ARG VAGRANT_GOOGLE_VERSION=2.4.0

RUN yum install -y epel-release \
	&& yum upgrade -y \
	&& yum install -y \
		python3 \
		bind-utils \
		gcc \
		git \
		libffi-devel \
		openssl \
		openssl-devel \
		python3-devel \
		python3-wheel \
		python3-pip \
		rsync

RUN python3 -m pip install --upgrade pip \
	&& python3 -m pip install apache-libcloud \
	&& python3 -m pip install 'requests[security]' ansible==$ANSIBLE_VERSION \
	&& yum install -y "https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/vagrant_${VAGRANT_VERSION}_x86_64.rpm" \
	&& vagrant plugin install vagrant-google --plugin-version $VAGRANT_GOOGLE_VERSION

ENTRYPOINT ["/usr/bin/ansible"]
CMD ["--version"]
