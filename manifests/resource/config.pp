# A description of what this defined type does
#
# @summary A short summary of the purpose of this defined type.
#
# @example
#    nginx::resource::config { '99-gitlab-logging':
#        template => 'profile/gitlab/nginx/conf.d/gitlab-logging.conf.erb',
#    }
define nginx::resource::config (
  Optional[String]
          $content      = undef,
  Optional[String]
          $template     = undef,
  String  $filename     = $name,
  Hash    $options      = {},
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
  $configpath = "${conf_dir}/conf.d/${configname}"

  if $content {
    $config_content = $content
  }
  elsif $template {
    $config_content = epp($template, $options)
  }
  else {
    fail("Either EPP template or direct content for configuration file ${configpath} must be provided")
  }

  file { $configpath:
    ensure  => file,
    content => $config_content,
    require => File["${conf_dir}/conf.d"],
    notify  => Service[$service_name],
  }
}
