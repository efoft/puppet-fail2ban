#
class fail2ban::service {

  service { $fail2ban::params::service_name:
    ensure => $fail2ban::ensure ? { 'present' => 'running', 'absent' => undef },
    enable => $fail2ban::ensure ? { 'present' => true, 'absent' => undef },
  }
}
