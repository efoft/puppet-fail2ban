#
class fail2ban::config inherits fail2ban {

  assert_private('This is private class')

  file { $jail_d_path:
    ensure  => $ensure ? { 'present' => 'directory', default => $ensure },
    recurse => $fail2ban::purge_unmanaged_jails,
    purge   => $fail2ban::purge_unmanaged_jails,
    force   => $fail2ban::purge_unmanaged_jails,
  }

  file { $cfgfile:
    ensure  => $ensure,
    content => template('fail2ban/jail.local.erb'),
  }
}
