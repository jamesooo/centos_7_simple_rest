#!/bin/bash
if [ -e /etc/yum.repos.d/puppet5.repo ]
  then exit
fi
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
# yum update -y
yum makecache
yum install -y puppet-agent

