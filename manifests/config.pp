#
class fail2ban::config inherits fail2ban {

  assert_private('This is private class')

  file { $jail_d_path:
    ensure  => $ensure ? { 'present' => 'directory', default => $ensure },
    recurse => ($fail2ban::purge_unmanaged_jails or $ensure == 'absent'),
    purge   => ($fail2ban::purge_unmanaged_jails or $ensure == 'absent'),
    force   => ($fail2ban::purge_unmanaged_jails or $ensure == 'absent'),
  }

  file { $cfgfile:
    ensure  => $ensure,
    content => template('fail2ban/jail.local.erb'),
  }
}
