FROM williamyeh/ansible:centos7

RUN yum install epel-release -y
RUN yum install python-pip -y

RUN yum install git -y

# required by http://docs.ansible.com/ansible/gce_module.html
RUN yum install python-libcloud -y
# required by http://docs.ansible.com/ansible/synchronize_module.html
RUN yum install rsync -y
