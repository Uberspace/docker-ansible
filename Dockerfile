FROM centos:centos7

RUN yum install epel-release -y
RUN yum install python-pip python-devel -y
RUN yum install gcc libffi-devel openssl-devel -y
RUN yum install bind-utils -y
RUN pip install ansible~=2.1.0

RUN yum install git openssl -y

# required by http://docs.ansible.com/ansible/gce_module.html
RUN yum install python-libcloud -y
# required by http://docs.ansible.com/ansible/synchronize_module.html
RUN yum install rsync -y
