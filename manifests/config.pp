# == Class ngircd::config
#
# This class is called from ngircd
#
class ngircd::config {

  file { $::ngircd::params::config:
    ensure  => $::ngircd::ensure,
    owner   => 'root',
    group   => 'ngircd',
    mode    => '0660',
    content => template('ngircd/ngircd.conf.erb')
  }

}
