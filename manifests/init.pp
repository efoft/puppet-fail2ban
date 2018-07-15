# === Class fail2ban ===
#
# === Parameters ===
# [*ignoreip*]
#   Array of IP that must not be banned.
#
# [*bantime*]
#   Time in second after with banned IP is removed from blacklist.
#
# [*findtime*]
#   Time interval in seconds during which *maxretry* must be reached.
#
# [*maxretry*]
#   Number of attempts within *findtime*.
#
# [*backend*]
#   Backend to be used to detect changes in the logpath.
#   It defaults to "auto" which will try "pyinotify", "gamin", "systemd" before "polling".
#
# [*usedns*]
#  Use DNS to resolve HOST names that appear in the logs. 
#  By default it is "warn" which will resolve hostnames to IPs however it will also log a warning.
#  This  can  be  set to "yes" to prevent warnings in the log or "no" to disable DNS resolution altogether (thus ignoring
#  entries where hostname, not an IP is logged).
#
# [*logencoding*]
#   Encoding of log files used for decoding. Default value of "auto" uses current system locale.
#
# [*destemail*]
#   Destination email address used solely for the interpolations in # jail.{conf,local} configuration files.
#   This address is used for sending notification upon bans.
#
# [*sender*]
#   E-mail from which fail2ban will send notifications.
#
# [*mta*]
#   MTA for the mailing.
#
# [*protocol*]
#   Default protocol.
#
# [*chain*]
#   iptables chain to insert rules.
#
# [*port*]
#   Default port.
#
# [*banaction*]
#   Banning action (default iptables-multiport) typically specified in the [DEFAULT] section for all jails.
#   Can be redefined in separately for each jail.
#
# [*banaction_allports*]
#   The same as banaction but for some "allports" jails like "pam-generic" or "recidive" (default iptables-allports).
#
class fail2ban (
  Enum['present','absent'] $ensure                = 'present',
  Optional[Array[Stdlib::Ip::Address]] $ignoreip  = undef,
  Optional[Numeric] $bantime                      = undef,
  Optional[Numeric] $findtime                     = undef,
  Optional[Numeric] $maxretry                     = undef,
  Optional[String] $backend                       = undef,
  Optional[Enum['yes','no','warn']] $usedns       = undef,
  Optional[String] $logencoding                   = undef,
  Optional[String] $destemail                     = undef,
  Optional[String] $sender                        = undef,
  Optional[Enum['sendmail','mta']] $mta           = undef,
  Optional[Enum['tcp','udp']] $protocol           = undef,
  Optional[String] $chain                         = undef,
  Optional[Numeric] $port                         = undef,
  Optional[String] $banaction                     = undef,
  Optional[String] $banaction_allports            = undef,
) inherits fail2ban::params {

  class { 'fail2ban::install': } ->
  class { 'fail2ban::config':  } ~>
  class { 'fail2ban::service': }

}
