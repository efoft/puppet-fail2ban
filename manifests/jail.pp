# === Define fail2ban::jail ===
# Configures specific built-in or custom jail.
# For built-in jail minimum config is required (e.g. enabled is enough).
#
# === Parameters ===
# See parameters description in fail2ban.pp
#
define fail2ban::jail(
  Boolean $enabled                      = true,
  Optional[Numeric] $port               = undef,
  Optional[Enum['tcp','udp']] $protocol = undef,
  Optional[Stdlib::Unixpath] $logpath   = undef,
  Optional[String] $backend             = undef,
  Optional[Numeric] $bantime            = undef,
  Optional[Numeric] $maxretry           = undef,
  Optional[String] $filter              = undef,
  Optional[String] $action              = undef,
) {

  include ::fail2ban

  if $fail2ban::ensure == 'present' {
    file { "$fail2ban::params::jail_d_path/${title}.local":
      content => template('fail2ban/custom_jail.local.erb'),
      notify  => Service[$fail2ban::params::service_name],
    }
  }
}
