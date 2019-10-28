#
class fail2ban::config inherits fail2ban {

  file { $jail_d_path:
    ensure  => $ensure ? { 'present' => 'directory', default => $ensure },
    recurse => true,
    purge   => true,
    force   => true,
  }

  file { $cfgfile:
    ensure  => $ensure,
    content => template('fail2ban/jail.local.erb'),
  }
}
