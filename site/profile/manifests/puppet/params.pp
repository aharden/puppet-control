# this file is for negotiating sensible
# defaults for your profile::puppet::*
# classes. This makes your code less messy
# and follows puppet best practices.
class profile::puppet::params {
  $hieradir = '"/etc/puppetlabs/puppet/environments/%{::environment}/hieradata"'
  $environmentpath = "${::settings::confdir}/environments"
  case $::settings::server {
    'xmaster.vagrant.vm': {
      $remote = '/vagrant'
    }
    default: {
      $remote = 'git@github.com:terrimonster/puppet-control.git'
    }
  }
}
