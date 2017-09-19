#
define fail2ban::jail(
  $enabled = true,
  $port    = undef,
  $logpath = undef,
  $backend = undef,
  $bantime = undef,
  $maxretry = undef,
  $filter   = undef,
  $action   = undef,
) {

  include ::fail2ban

  file { "$fail2ban::params::jail_d_path/${title}.local":
    content => template('fail2ban/customization.local.erb'),
    notify  => Service[$fail2ban::params::service_name],
  }
}
