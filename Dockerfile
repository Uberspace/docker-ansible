FROM williamyeh/ansible:centos7

RUN yum install epel-release -y

RUN yum install python-pip -y
RUN yum install python-libcloud -y

