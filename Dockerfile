FROM centos:centos7

ARG PIP_PACKAGE_VERSION=20.1.*
ARG VAGRANT_VERSION=2.2.19
ARG VAGRANT_GOOGLE_VERSION=2.6.0

RUN yum install -y epel-release \
	&& yum-config-manager --add-repo \
		https://repo.corona.uberspace.de/uberspace.repo \
	&& yum upgrade -y \
	&& yum install -y \
		bind-utils \
		gcc \
		git \
		libffi-devel \
		openssl \
		openssl-devel \
		python-devel \
		python-pip \
		python-setuptools \
		rsync \
		ubrspc_python39 \
	&& rm -rf /var/lib/apt/lists/*

RUN yum install -y \
	"https://releases.hashicorp.com/vagrant/$VAGRANT_VERSION/vagrant_${VAGRANT_VERSION}_x86_64.rpm" \
	&& vagrant plugin install \
		vagrant-google --plugin-version "$VAGRANT_GOOGLE_VERSION"

COPY requirements.txt /tmp
# we need the pinned version for $(pip) and some updated for Python v2
# FIXME: hopefully this will be cleaner with v3
RUN python2.7 -m pip install --upgrade pip==$PIP_PACKAGE_VERSION \
	&& python2.7 -m pip install --upgrade setuptools wheel \
	&& python2.7 -m pip install -r /tmp/requirements.txt

WORKDIR /root
ENTRYPOINT ["/usr/bin/ansible"]
CMD ["--version"]
