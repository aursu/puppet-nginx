# Class: nginx
#
# This module manages NGINX.
#
# Parameters:
#
# Actions:
#
# Requires:
#  puppetlabs-stdlib - https://github.com/puppetlabs/puppetlabs-stdlib
#
#  Packaged NGINX
#    - RHEL: EPEL or custom package
#    - Debian/Ubuntu: Default Install or custom package
#    - SuSE: Default Install or custom package
#
#  stdlib
#    - puppetlabs-stdlib module >= 0.1.6
#
# Sample Usage:
#
# The module works with sensible defaults:
#
# node default {
#   include nginx
# }
class nginx (
  ### START Nginx Configuration ###
  Optional[String] $client_body_temp_path                    = undef, # 'client_body_temp'
  Boolean $confd_only                                        = false,
  Boolean $confd_purge                                       = false,
  Stdlib::Unixpath $conf_dir                                 = $nginx::params::conf_dir,
  Optional[Nginx::Switch] $daemon                            = undef, # 'on'
  String $daemon_user                                        = $nginx::params::daemon_user,
  Optional[String] $daemon_group                             = undef,
  Array[String] $dynamic_modules                             = [],
  $global_owner                                              = $nginx::params::global_owner,
  $global_group                                              = $nginx::params::global_group,
  $global_mode                                               = $nginx::params::global_mode,
  $log_dir                                                   = $nginx::params::log_dir,
  $log_group                                                 = $nginx::params::log_group,
  $log_mode                                                  = '0750',
  Optional[Variant[String, Array[String]]] $http_access_log  = "${log_dir}/${nginx::params::http_access_log_file}",
  Optional[String] $http_format_log                          = undef, # 'combined'
  Variant[String, Array[String]] $nginx_error_log            = "${log_dir}/${nginx::params::nginx_error_log_file}",
  Nginx::ErrorLogSeverity $nginx_error_log_severity          = 'error',
  $pid                                                       = $nginx::params::pid,
  Optional[String] $proxy_temp_path                          = undef, # 'proxy_temp'
  $root_group                                                = $nginx::params::root_group,
  $run_dir                                                   = $nginx::params::run_dir,
  $sites_available_owner                                     = $nginx::params::sites_available_owner,
  $sites_available_group                                     = $nginx::params::sites_available_group,
  $sites_available_mode                                      = $nginx::params::sites_available_mode,
  Boolean $super_user                                        = $nginx::params::super_user,
  $temp_dir                                                  = $nginx::params::temp_dir,
  Boolean $server_purge                                      = false,

  # Primary Templates
  String $conf_template                                      = 'nginx/conf.d/nginx.conf.erb',

  ### START Nginx Configuration ###                                    # default:
  Optional[Nginx::Switch] $accept_mutex                      = undef,  # 'on' (nginx < 1.11.3), 'off' (nginx >= 1.11.3)
  Optional[Nginx::Time] $accept_mutex_delay                  = undef,  # 500ms
  Optional[Nginx::Size] $client_body_buffer_size             = undef,  # 8k|16k
  Optional[Nginx::Size] $client_max_body_size                = undef,  # 1m
  Optional[Nginx::Time] $client_body_timeout                 = undef,  # 60s
  Optional[Nginx::Time] $send_timeout                        = undef,  # 60s
  Optional[Nginx::Time] $lingering_timeout                   = undef,  # 5s
  Optional[Nginx::Switch] $etag                              = undef,  # 'on'
  Optional[Nginx::ConnectionProcessing] $events_use          = undef,  # 'epoll'
  Optional[String] $fastcgi_cache_key                        = undef,  # undef
  Optional[Hash[String, Nginx::CachePath, 1]]
                    $fastcgi_cache_path                      = undef,  # undef
  Optional[Variant[Nginx::CacheUseStale, Array[Nginx::CacheUseStale]]]
                    $fastcgi_cache_use_stale                 = undef,  # 'off'
  Boolean $gzip                                              = true,   # 'on'
  Optional[String] $gzip_buffers                             = undef,  # '32 4k|16 8k'
  Optional[Integer] $gzip_comp_level                         = undef,  # 1
  Optional[Variant[String, Array[String, 1]]] $gzip_disable  = undef,  # undef
  Optional[Integer] $gzip_min_length                         = undef,  # 20
  Optional[Enum['1.0', '1.1']] $gzip_http_version            = undef,  # '1.1'
  Optional[
      Variant[
        Nginx::GzipProxied,
        Array[Nginx::GzipProxied]
      ]
  ] $gzip_proxied                                            = undef,  # 'off'
  Optional[Variant[String, Array[String, 1]]] $gzip_types    = undef,  # 'text/html'
  Optional[Boolean] $gzip_vary                               = undef,  # 'off'
  Optional[Nginx::ConfigSet] $http_cfg_prepend               = undef,
  Optional[Nginx::ConfigSet] $http_cfg_append                = undef,
  Optional[Variant[Array[String], String]] $http_raw_prepend = undef,
  Optional[Variant[Array[String], String]] $http_raw_append  = undef,
  Optional[Nginx::Switch] $http_tcp_nodelay                  = undef,  # 'on'
  Optional[Nginx::Switch] $http_tcp_nopush                   = undef,  # 'off'
  Optional[Nginx::Time] $keepalive_timeout                   = undef,  # 75
  Optional[Integer] $keepalive_requests                      = undef,  # 100
  Optional[Hash[String, String]] $log_format                 = undef,
  Boolean $mail                                              = false,
  Boolean $stream                                            = false,
  Optional[Nginx::Switch] $multi_accept                      = undef,  # 'off'
  Optional[Integer] $names_hash_bucket_size                  = undef,  # 32|64|128
  Optional[Integer] $names_hash_max_size                     = undef,  # 512
  Optional[Nginx::ConfigSet] $nginx_cfg_prepend              = undef,
  Optional[String] $proxy_buffers                            = undef,  # '8 4k|8 8k'
  Optional[Nginx::Size] $proxy_buffer_size                   = undef,  # '4k|8k'
  Optional[String] $proxy_cache                              = undef,  # off
  Optional[Hash[String, Nginx::CachePath, 1]]
                    $proxy_cache_path                        = undef,  # undef
  Optional[Nginx::Time] $proxy_connect_timeout               = undef,  # 60s
  Optional[Nginx::Size] $proxy_headers_hash_bucket_size      = undef,  # 64
  Optional[Enum['1.0', '1.1']] $proxy_http_version           = undef,  # '1.0'
  Optional[Nginx::Time] $proxy_read_timeout                  = undef,  # 60
  Optional[String] $proxy_redirect                           = undef,  # 'default'
  Optional[Nginx::Time] $proxy_send_timeout                  = undef,  # 60
  Array[String] $proxy_set_header                            = [],     # ['Host $proxy_host', 'Connection close']
  Array[String] $proxy_hide_header                           = [],
  Array[String] $proxy_pass_header                           = [],
  Array[String] $proxy_ignore_header                         = [],
  Optional[Nginx::Switch] $sendfile                          = undef,  # 'off'
  Optional[Nginx::Switch] $server_tokens                     = undef,  # 'on',
  $spdy                                                      = 'off',
  $http2                                                     = 'off',
  $ssl_stapling                                              = 'off',

  Optional[Nginx::Size] $types_hash_bucket_size              = undef,  # 64
  Optional[Nginx::Size] $types_hash_max_size                 = undef,  # 1024
  Integer $worker_connections                                = 1024,   # 512
  Optional[Nginx::Switch] $ssl_prefer_server_ciphers         = true,
  Variant[Enum['auto'], Integer] $worker_processes           = 'auto', # 1
  Optional[Integer] $worker_rlimit_nofile                    = undef,  # undef
  String $ssl_protocols                                      = 'TLSv1 TLSv1.1 TLSv1.2',
  String $ssl_ciphers                                        = 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS', # lint:ignore:140chars
  Optional[Stdlib::Unixpath] $ssl_dhparam                    = undef,
  Optional[Nginx::FileCache] $open_file_cache                = undef,  # 'off'
  Nginx::Time $open_file_cache_valid                         = 60,
  Integer $open_file_cache_min_uses                          = 1,
  Optional[
    Hash[
      String,
      Struct[{
        size  => Nginx::Size,
        key   => String,
        rate  => Nginx::Rate
      }]
    ]
  ]                 $limit_req_zone                          = undef,
  Optional[Boolean] $proxy_connection_upgrade                = true,   # see http://nginx.org/en/docs/http/websocket.html
  Optional[Boolean] $proxy_cache_lock                        = undef,  # 'off'
  Optional[String] $default_type                             = undef,  # 'text/plain'
  Optional[String] $charset_types                            = undef,  # 'text/html text/xml text/plain text/vnd.wap.wml application/javascript application/rss+xml'
  Optional[String] $charset                                  = undef,  # 'off'
  Optional[String] $index                                    = undef,  # 'index.html'
  Optional[Boolean] $msie_padding                            = undef,  # 'on'
  Optional[Boolean] $port_in_redirect                        = undef,  # 'on'
  Optional[Nginx::Time] $client_header_timeout               = undef,  # 60s

  ### START Package Configuration ###
  $package_ensure                                            = present,
  $package_name                                              = $nginx::params::package_name,
  $package_source                                            = 'nginx',
  $package_flavor                                            = undef,
  $manage_repo                                               = $nginx::params::manage_repo,
  Optional[String] $repo_release                             = undef,
  $passenger_package_ensure                                  = 'present',
  ### END Package Configuration ###

  ### START Service Configuation ###
  $service_ensure                                            = running,
  $service_flags                                             = undef,
  $service_restart                                           = undef,
  String $service_name                                       = 'nginx',
  $service_manage                                            = true,
  ### END Service Configuration ###

  ### START Hiera Lookups ###
  $geo_mappings                                              = {},
  $string_mappings                                           = {},
  $nginx_locations                                           = {},
  $nginx_locations_defaults                                  = {},
  $nginx_mailhosts                                           = {},
  $nginx_mailhosts_defaults                                  = {},
  $nginx_streamhosts                                         = {},
  $nginx_upstreams                                           = {},
  $nginx_servers                                             = {},
  $nginx_servers_defaults                                    = {},
  Boolean $purge_passenger_repo                              = true,
  ### END Hiera Lookups ###
) inherits nginx::params {

  contain 'nginx::package'
  contain 'nginx::config'
  contain 'nginx::service'

  create_resources('nginx::resource::upstream', $nginx_upstreams)
  create_resources('nginx::resource::server', $nginx_servers, $nginx_servers_defaults)
  create_resources('nginx::resource::location', $nginx_locations, $nginx_locations_defaults)
  create_resources('nginx::resource::mailhost', $nginx_mailhosts, $nginx_mailhosts_defaults)
  create_resources('nginx::resource::streamhost', $nginx_streamhosts)
  create_resources('nginx::resource::map', $string_mappings)
  create_resources('nginx::resource::geo', $geo_mappings)

  # Allow the end user to establish relationships to the "main" class
  # and preserve the relationship to the implementation classes through
  # a transitive relationship to the composite class.
  Class['nginx::package'] -> Class['nginx::config'] ~> Class['nginx::service']
  Class['nginx::package'] ~> Class['nginx::service']
}
