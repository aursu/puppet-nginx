# @summary Manage NGINX
#
# Packaged NGINX
#   - RHEL: EPEL or custom package
#   - Debian/Ubuntu: Default Install or custom package
#   - SuSE: Default Install or custom package
#
# @example Use the sensible defaults
#   include nginx
#
# @param include_modules_enabled
#   When set, nginx will include module configurations files installed in the
#   /etc/nginx/modules-enabled directory.
#
# @param passenger_package_name
#   The name of the package to install in order for the passenger module of
#   nginx being usable.
#
# @param nginx_version
#   The version of nginx installed (or being installed).
#   Unfortunately, different versions of nginx may need configuring
#   differently.  The default is derived from the version of nginx
#   already installed.  If the fact is unavailable, it defaults to '1.6.0'.
#   You may need to set this manually to get a working and idempotent
#   configuration.
#
# @param debug_connections
#   Configures nginx `debug_connection` lines in the `events` section of the nginx config.
#   See http://nginx.org/en/docs/ngx_core_module.html#debug_connection
#
# @param ignore_invalid_headers
#   Controls whether header fields with invalid names should be ignored. Valid
#   names are composed of English letters, digits, hyphens, and possibly
#   underscores (as controlled by the underscores_in_headers directive).
#
# @param service_config_check
#  whether to en- or disable the config check via nginx -t on config changes
#
# @param service_config_check_command
#  Command to execute to validate the generated configuration.
#
# @param reset_timedout_connection
#   Enables or disables resetting timed out connections and connections closed
#   with the non-standard code 444.
#
class nginx (
  ### START Nginx Configuration ###
  Optional[Variant[Stdlib::Absolutepath, Boolean]]
          $client_body_temp_path                             = undef, # 'client_body_temp'
  Optional[Boolean] $recursive_error_pages                   = undef, # off
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
  Optional[Hash[String, Nginx::LimitReqZone]]
          $limit_req_zone                                    = undef,
  Stdlib::Absolutepath $log_dir                              = $nginx::params::log_dir,
  String[1] $log_user                                        = $nginx::params::log_user,
  String[1] $log_group                                       = $nginx::params::log_group,
  Stdlib::Filemode $log_mode                                 = $nginx::params::log_mode,
  Optional[Variant[
    String,
    Array[String],
    Hash[String, String]
  ]] $http_access_log                                        = "${log_dir}/${nginx::params::http_access_log_file}",
  Optional[String] $http_format_log                          = undef, # 'combined'
  Variant[String, Array[String]] $nginx_error_log            = "${log_dir}/${nginx::params::nginx_error_log_file}",
  Nginx::ErrorLogSeverity $nginx_error_log_severity          = 'error',
  $pid                                                       = $nginx::params::pid,
  Optional[Stdlib::Absolutepath]
          $proxy_temp_path                                   = undef,  # 'proxy_temp'
  Optional[String] $proxy_cache_key                          = undef,  # $scheme$proxy_host$request_uri
  $root_group                                                = $nginx::params::root_group,
  $run_dir                                                   = $nginx::params::run_dir,
  $sites_available_owner                                     = $nginx::params::sites_available_owner,
  $sites_available_group                                     = $nginx::params::sites_available_group,
  $sites_available_mode                                      = $nginx::params::sites_available_mode,
  Boolean $super_user                                        = $nginx::params::super_user,
  $temp_dir                                                  = $nginx::params::temp_dir,
  Boolean $server_purge                                      = false,
  Boolean $include_modules_enabled                           = $nginx::params::include_modules_enabled,

  # Primary Templates
  String[1] $conf_template                                   = 'nginx/conf.d/nginx.conf.erb',
  String[1] $fastcgi_conf_template                           = 'nginx/server/fastcgi.conf.erb',
  String[1] $uwsgi_params_template                           = 'nginx/server/uwsgi_params.erb',

  ### START Nginx Configuration ###                                    # default:
  Optional[Nginx::Switch] $absolute_redirect                 = undef,  # 'on'
  Optional[Nginx::Switch] $accept_mutex                      = undef,  # 'on' (nginx < 1.11.3), 'off' (nginx >= 1.11.3)
  Optional[Nginx::Time] $accept_mutex_delay                  = undef,  # 500ms
  Optional[Nginx::Size] $client_body_buffer_size             = undef,  # 8k|16k
  Optional[Nginx::Size] $client_max_body_size                = undef,  # 1m
  Optional[Nginx::Time] $client_body_timeout                 = undef,  # 60s
  Optional[Nginx::Time] $send_timeout                        = undef,  # 60s
  Optional[Nginx::Time] $lingering_timeout                   = undef,  # 5s
  Optional[Enum['on','off','always']] $lingering_close       = undef,
  Optional[String[1]] $lingering_time                        = undef,
  Optional[Nginx::Switch] $etag                              = undef,  # 'on'
  Optional[Nginx::ConnectionProcessing] $events_use          = undef,  # 'epoll'
  Array[Nginx::DebugConnection] $debug_connections           = [],
  Optional[String] $fastcgi_cache_key                        = undef,  # undef
  Optional[Hash[String, Nginx::CachePath, 1]]
                    $fastcgi_cache_path                      = undef,  # undef
  Optional[Variant[Nginx::CacheUseStale, Array[Nginx::CacheUseStale]]]
                    $fastcgi_cache_use_stale                 = undef,  # 'off'
  Nginx::Switch $gzip                                        = false,  # 'on'
  Optional[Nginx::Buffers] $gzip_buffers                     = undef,  # '32 4k|16 8k'
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
  Optional[Nginx::Switch] $gzip_vary                         = undef,  # 'off'
  Optional[Nginx::ConfigSet] $http_cfg_prepend               = undef,
  Optional[Nginx::ConfigSet] $http_cfg_append                = undef,
  Optional[
      Variant[
        Enum['always'],
        Nginx::Switch
      ]
  ] $gzip_static                                             = undef,
  Optional[Variant[Array[String], String]] $http_raw_prepend = undef,
  Optional[Variant[Array[String], String]] $http_raw_append  = undef,
  Optional[Nginx::Switch] $http_tcp_nodelay                  = undef,  # 'on'
  Optional[Nginx::Switch] $http_tcp_nopush                   = undef,  # 'off'
  Optional[Nginx::Time] $keepalive_timeout                   = undef,  # 75
  Optional[Integer] $keepalive_requests                      = undef,  # 100
  Optional[Hash[String, String]] $log_format                 = undef,
  Boolean $mail                                              = false,
  Variant[String, Boolean] $mime_types_path                  = 'mime.types',
  Boolean $stream                                            = false,
  Optional[Nginx::Switch] $multi_accept                      = undef,  # 'off'
  Optional[Integer] $names_hash_bucket_size                  = undef,  # 32|64|128
  Optional[Integer] $names_hash_max_size                     = undef,  # 512
  Optional[Nginx::ConfigSet] $nginx_cfg_prepend              = undef,
  Optional[Nginx::Switch] $proxy_buffering                   = undef,  # on
  Optional[Nginx::Buffers] $proxy_buffers                    = undef,  # '8 4k|8 8k'
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
  Optional[Nginx::Size] $proxy_max_temp_file_size            = undef,
  Optional[Nginx::Size] $proxy_busy_buffers_size             = undef,
  Optional[Nginx::Switch] $sendfile                          = undef,  # 'off'
  Optional[Nginx::Switch] $server_tokens                     = undef,  # 'on',
  Nginx::Switch $spdy                                        = false,
  Nginx::Switch $http2                                       = false,
  Nginx::Switch $ssl_stapling                                = false,
  Optional[Nginx::Switch] $ssl_stapling_verify               = undef, # 'off',
  Stdlib::Absolutepath $snippets_dir                         = $nginx::params::snippets_dir,
  Boolean $manage_snippets_dir                               = false,
  Optional[Nginx::Size] $types_hash_bucket_size              = undef,  # 64
  Optional[Nginx::Size] $types_hash_max_size                 = undef,  # 1024
  Integer $worker_connections                                = 1024,   # 512
  Optional[Nginx::Switch] $ssl_prefer_server_ciphers         = true,
  Variant[Enum['auto'], Integer] $worker_processes           = 'auto', # 1
  Optional[Integer] $worker_rlimit_nofile                    = undef,  # undef
  Optional[Nginx::Switch] $pcre_jit                          = undef,
  String $ssl_protocols                                      = 'TLSv1.1 TLSv1.2',
  String $ssl_ciphers                                        = 'ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA:ECDHE-RSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-RSA-AES256-SHA256:DHE-RSA-AES256-SHA:ECDHE-ECDSA-DES-CBC3-SHA:ECDHE-RSA-DES-CBC3-SHA:EDH-RSA-DES-CBC3-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:DES-CBC3-SHA:!DSS', # lint:ignore:140chars
  Optional[Stdlib::Unixpath] $ssl_dhparam                    = undef,
  Optional[Nginx::FileCache] $open_file_cache                = undef,  # 'off'
  Nginx::Time $open_file_cache_valid                         = 60,
  Integer $open_file_cache_min_uses                          = 1,
  Optional[Boolean] $proxy_connection_upgrade                = true,  # see http://nginx.org/en/docs/http/websocket.html
  Optional[Boolean] $proxy_cache_lock                        = undef, # 'off'
  Optional[String] $default_type                             = undef, # 'text/plain'
  Optional[String] $charset_types                            = undef, # 'text/html text/xml text/plain text/vnd.wap.wml'
                                                                      # 'application/javascript application/rss+xml'
  Optional[String] $charset                                  = undef, # 'off'
  Optional[String] $index                                    = undef, # 'index.html'
  Optional[Boolean] $msie_padding                            = undef, # 'on'
  Optional[Boolean] $port_in_redirect                        = undef, # 'on'
  Optional[Nginx::Time] $client_header_timeout               = undef, # 60s
  Optional[Nginx::Switch] $ignore_invalid_headers            = undef, # 'on'
  Optional[Nginx::Buffers] $fastcgi_buffers                  = undef, # '8 4k|8 8k'
  Optional[Nginx::Size] $fastcgi_buffer_size                 = undef, # '4k|8k'
  Optional[String] $ssl_ecdh_curve                           = undef, # 'auto'
  Optional[String] $ssl_session_cache                        = undef, # 'none'
  Optional[Nginx::Time] $ssl_session_timeout                 = undef, # 5m
  Optional[Nginx::Switch] $ssl_session_tickets               = undef, # 'on'
  Optional[Stdlib::Absolutepath] $ssl_session_ticket_key     = undef,
  Optional[Nginx::Size] $ssl_buffer_size                     = undef, # 16k
  Optional[Stdlib::Absolutepath] $ssl_crl                    = undef,
  Optional[Stdlib::Absolutepath] $ssl_stapling_file          = undef,
  Optional[String] $ssl_stapling_responder                   = undef,
  Optional[Stdlib::Absolutepath] $ssl_trusted_certificate    = undef,
  Optional[Integer] $ssl_verify_depth                        = undef, # 1
  Optional[Stdlib::Absolutepath] $ssl_password_file          = undef,
  Optional[Nginx::Switch] $reset_timedout_connection         = undef,

  ### START Package Configuration ###
  $package_ensure                                            = present,
  $package_name                                              = $nginx::params::package_name,
  $package_source                                            = 'nginx',
  $package_flavor                                            = undef,
  Boolean $manage_repo                                       = $nginx::params::manage_repo,
  Variant[Boolean, Enum['absent']] $yum_repo_sslverify       = 'absent',
  Hash[String[1], String[1]] $mime_types                     = $nginx::params::mime_types,
  Boolean $mime_types_preserve_defaults                      = false,
  Optional[String] $repo_release                             = undef,
  $passenger_package_ensure                                  = 'present',
  String[1] $passenger_package_name                          = $nginx::params::passenger_package_name,
  Optional[Stdlib::HTTPUrl] $repo_source                     = undef,
  ### END Package Configuration ###

  ### START Service Configuation ###
  Stdlib::Ensure::Service $service_ensure                    = 'running',
  $service_enable                                            = true,
  $service_flags                                             = undef,
  $service_restart                                           = undef,
  String $service_name                                       = 'nginx',
  $service_manage                                            = true,
  Boolean $service_config_check                              = false,
  String $service_config_check_command                       = 'nginx -t',
  ### END Service Configuration ###

  ### START Hiera Lookups ###
  Hash $geo_mappings                                      = {},
  Hash $geo_mappings_defaults                             = {},
  Hash $string_mappings                                   = {},
  Hash $string_mappings_defaults                          = {},
  Hash $nginx_locations                                   = {},
  Hash $nginx_locations_defaults                          = {},
  Hash $nginx_mailhosts                                   = {},
  Hash $nginx_mailhosts_defaults                          = {},
  Hash $nginx_servers                                     = {},
  Hash $nginx_servers_defaults                            = {},
  Hash $nginx_streamhosts                                 = {},
  Hash $nginx_streamhosts_defaults                        = {},
  Hash $nginx_upstreams                                   = {},
  Nginx::UpstreamDefaults $nginx_upstreams_defaults       = {},
  Boolean $purge_passenger_repo                           = true,
  String[1] $nginx_version                                = pick(fact('nginx_version'), '1.6.0'),

  ### END Hiera Lookups ###
) inherits nginx::params {
  contain 'nginx::package'
  contain 'nginx::config'
  contain 'nginx::service'

  create_resources( 'nginx::resource::geo', $geo_mappings, $geo_mappings_defaults )
  create_resources( 'nginx::resource::location', $nginx_locations, $nginx_locations_defaults )
  create_resources( 'nginx::resource::mailhost', $nginx_mailhosts, $nginx_mailhosts_defaults )
  create_resources( 'nginx::resource::map', $string_mappings, $string_mappings_defaults )
  create_resources( 'nginx::resource::server', $nginx_servers, $nginx_servers_defaults )
  create_resources( 'nginx::resource::streamhost', $nginx_streamhosts, $nginx_streamhosts_defaults )
  create_resources( 'nginx::resource::upstream', $nginx_upstreams, $nginx_upstreams_defaults )

  # Allow the end user to establish relationships to the "main" class
  # and preserve the relationship to the implementation classes through
  # a transitive relationship to the composite class.
  Class['nginx::package'] -> Class['nginx::config'] ~> Class['nginx::service']
  Class['nginx::package'] ~> Class['nginx::service']
}
