FROM centos:centos7

RUN yum install epel-release -y
RUN yum install python-pip python-devel -y
RUN yum install gcc libffi-devel openssl-devel -y
RUN yum install bind-utils -y
RUN pip install ansible~=2.2.0

RUN yum install git openssl -y

RUN yum install https://releases.hashicorp.com/vagrant/2.0.0/vagrant_2.0.0_x86_64.rpm -y
RUN vagrant plugin install vagrant-google

# required by http://docs.ansible.com/ansible/gce_module.html
RUN yum install python-libcloud -y
# required by http://docs.ansible.com/ansible/synchronize_module.html
RUN yum install rsync -y
