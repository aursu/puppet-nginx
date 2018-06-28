# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#   nginx::resource::config { 'namevar': }
define nginx::resource::config (
  String  $template,
  String  $filename     = $name,
  Stdlib::Unixpath
          $conf_dir     = $nginx::conf_dir,
  String  $service_name = $nginx::service_name,
) {
  if ! defined(Class['nginx']) {
    fail('You must include the nginx base class before using any defined resources')
  }

  $pathdata = split($filename, '/')
  $basename = $pathdata[-1]
  $namedata = split($basename, '.')

  if $namedata[-1] == 'conf' {
    $configname = $basename
  }
  else {
    $configname = "${basename}.conf"
  }

  file { "${conf_dir}/conf.d/${configname}":
    ensure  => file,
    content => template($template),
    require => File["${conf_dir}/conf.d"],
    notify  => Service[$service_name]
  }
}
