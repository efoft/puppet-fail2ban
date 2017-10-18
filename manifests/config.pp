#
class fail2ban::config {

  assert_private('This is private class')

  file { $fail2ban::params::jail_d_path:
    ensure  => $fail2ban::ensure ? { 'present' => 'directory', default => $fail2ban::ensure },
    recurse => true,
    purge   => true,
  }

  file { $fail2ban::params::cfgfile:
    ensure  => $fail2ban::ensure,
    content => template('fail2ban/jail.local.erb'),
  }
}
