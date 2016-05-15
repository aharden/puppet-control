#!/bin/bash

HOSTNAME=`hostname`
BASEDIR="/opt/puppetlabs"

if [[ $HOSTNAME =~ vagrant ]]; then
  MODPATH='/vagrant/site'
else
  MODPATH='/etc/puppetlabs/code/environments/production/site'
fi

${BASEDIR}/bin/puppet apply -e 'include profile::puppet::r10k' --modulepath=$MODPATH

rm -rf /etc/puppetlabs/code/environments/production

${BASEDIR}/bin/r10k deploy environment -p production --puppetfile \
  --verbose debug

${BASEDIR}/bin/puppet agent -t
