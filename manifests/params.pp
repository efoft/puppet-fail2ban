#
class fail2ban::params {

  case $::osfamily {
    'redhat' : {
      $service_name  = 'fail2ban'
      $jail_d_path   = '/etc/fail2ban/jail.d'
      $filter_d_path = '/etc/fail2ban/filter.d'
      $cfgfile       = '/etc/fail2ban/jail.local'
      case $::operatingsystemmajrelease {
        '6' : {
          $package_name = 'fail2ban'
        }
        '7' : {
          $package_name = 'fail2ban-server'
        }
        default: {
          fail('Sorry! Your OS version is not supported')
        }
      }
    }
    default: {
      fail('Sorry! Your OS is not supported')
    }
  }
}
