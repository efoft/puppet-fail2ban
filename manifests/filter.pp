#
# @summary   Configures custom filter or modifies existing build-in filter.
#
# @param journalmatch
#   Specifies the systemd journal match used to filter the journal entries.
#   See journalctl(1) and systemd.journal-fields(7) for matches syntax and 
#   more details on special journal fields. 
#   This option is only valid for the systemd backend.
#
# @param definition_prepend
#   Array of lines to put in the very beginning of [Definition] section.
#
# @param failregex
#   Array of python regex lines to match against in the log files.
#
# @param ignoreregex
#   Array of regex lines which, if the log line matches, would cause Fail2Ban not consider that line.
#   This line will be ignored even if it matches a failregex of the jail or any of its filters
#
define fail2ban::filter(
  Optional[String[1]]        $journalmatch       = undef,
  Optional[Array[String[1]]] $definition_prepend = undef,
  Array[String[1]]           $failregex,
  Optional[Array[String[1]]] $ignoreregex        = undef,
) {

  include fail2ban

  file { "$fail2ban::params::filter_d_path/${title}.local":
    content => template('fail2ban/custom_filter.local.erb'),
    notify  => Service[$fail2ban::params::service_name],
  }
}
