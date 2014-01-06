# == Class ngircd::params
#
# This class is meant to be called from ngircd
# It sets variables according to platform
#
class ngircd::params {
  case $::osfamily {
    'RedHat', 'Amazon': {
      $package_name = 'ngircd'
      $service_name = 'ngircd'
      $config = '/etc/ngircd.conf'
      $motd   = '/etc/ngircd.motd'
      $server_uid = 'ngircd'
      $server_gid = 'ngircd'
      $pidfile = '/var/run/ngircd/ngircd.pid'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
