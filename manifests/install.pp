#
class fail2ban::install inherits fail2ban {

  assert_private('This is private class')

  package { $package_name:
    ensure => $ensure ? { 'absent' => 'purged', default => $ensure },
  }
}
