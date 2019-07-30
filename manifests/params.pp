#
class fail2ban::params {

  case $::osfamily {
    'redhat' : {
      $package_name  = 'fail2ban-server'
      $service_name  = 'fail2ban'
      $jail_d_path   = '/etc/fail2ban/jail.d'
      $filter_d_path = '/etc/fail2ban/filter.d'
      $cfgfile       = '/etc/fail2ban/jail.local'
    }
    default: {
      fail('Sorry! Your OS is not supported')
    }
  }
}
