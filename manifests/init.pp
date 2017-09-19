#
class fail2ban (
  $ensure             = 'present',
  $ignoreip           = undef,
  $bantime            = undef,
  $findtime           = undef,
  $maxretry           = undef,
  $backend            = undef,
  $usedns             = undef,
  $logencoding        = undef,
  $destemail          = undef,
  $sender             = undef,
  $mta                = undef,
  $protocol           = undef,
  $chain              = undef,
  $port               = undef,
  $banaction          = undef,
  $banaction_allports = undef,
) inherits fail2ban::params {

  validate_re($ensure, ['present','absent'], "${ensure} is not valid for ensure, must be present or absent")

  class { 'fail2ban::install': } ->
  class { 'fail2ban::config':  } ~>
  class { 'fail2ban::service': }

}
