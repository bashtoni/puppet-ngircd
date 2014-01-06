# == Class: ngircd
#
# Full description of class ngircd here.
#
# === Parameters
#
# [*servername*]
#   Server name in the IRC network, must contain at least one dot
#   (".") and be unique in the IRC network. Required!
#
# [*info*]
#   Info text of the server. This will be shown by WHOIS
#
# [*listen*]
#   Comma seperated list of IP addresses on which the server should
#   listen on.  Defaults to all addresses
#
# [*ports*]
#   Comma seperated list of ports to listen on.  Defaults to 6667
#
# [*motd*]
#   Optional message of the day (< 256 chars)
#   Cannot be combined with motdfile
#
# [*motdfile*]
#   File location (eg 'puppet:///modules/data/irc/motd') to deploy
#   for message of the day
#   Cannot be combined with motd
#
# [*password*]
#   Global password for all users needed to connect to the server
#
# [*admindesc*]
#   Server description information used for admin command.
#
# [*adminlocation*]
#   Server location information used for admin command.
#
# [*customglobalvars*]
#   Hash of additional global variables
#
# [*operators*]
#   Array of operator hashes.  Each hash should contain Name, Password, and optoinally mask
#
# [*servers*]
#   Array of hashes of other servers to connect to
#
# [*channels*]
#   Array of hashes of channels
class ngircd (
  $servername       = 'bad.irc.server',
  $info             = 'Badly configured IRC server',
  $listen           = '0.0.0.0',
  $ports            = '6667',
  $motd             = undef,
  $motdfile         = undef,
  $password         = undef,
  $admindesc        = undef,
  $adminlocation    = undef,
  $adminemail       = undef,
  $customglobalvars = {},
  $operators        = [{}],
  $servers          = [{}],
  $channelvars      = [{}]
) inherits ngircd::params {

  # validate parameters here

  class { 'ngircd::install': } ->
  class { 'ngircd::config': } ~>
  class { 'ngircd::service': } ->
  Class['ngircd']
}
