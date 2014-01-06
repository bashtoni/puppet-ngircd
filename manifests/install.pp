# == Class ngircd::install
#
class ngircd::install {
  include ngircd::params

  package { $ngircd::params::package_name:
    ensure => present,
  }
}
