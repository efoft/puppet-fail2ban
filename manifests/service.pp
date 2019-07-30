#
class fail2ban::service inherits fail2ban {

  assert_private('This is private class')

  service { $service_name:
    ensure => $ensure ? { 'present' => 'running', 'absent' => undef },
    enable => $ensure ? { 'present' => true, 'absent' => undef },
  }
}
