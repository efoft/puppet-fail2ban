#
class fail2ban::install {

  assert_private('This is private class')

  package { $fail2ban::params::package_name:
    ensure => $fail2ban::ensure ? { 'absent' => 'purged', default => $fail2ban::ensure },
  }
}
