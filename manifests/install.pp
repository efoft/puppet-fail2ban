#
class fail2ban::install inherits fail2ban {

  package { $package_name:
    ensure => $ensure ? { 'absent' => 'purged', default => $ensure },
  }
}
