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
#   /etc/nginx/modules-enabled directory. This is also enabled if mail is
#   being configured (to allow the module to be loaded).
#
# @param passenger_package_name
#   The name of the package to install in order for the passenger module of
#   nginx to be usable.
#
# @param mail_package_name
#   The name of the package to install in order for the mail module of
#   nginx to be usable.
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
# @param nginx_snippets
#   Specifies a hash from which to generate `nginx::resource::snippet` resources.
#
# @param nginx_snippets_defaults
#   Can be used to define default values for the parameter `nginx_snippets`.
#
# @param client_body_temp_path
#   Defines a directory for storing temporary files holding client request bodies, with optional subdirectory levels.
# @param recursive_error_pages
#   Enables or disables doing several redirects using the error_page directive.
# @param confd_only
#   If true, only use configuration from conf.d directory.
# @param confd_purge
#   Whether to purge unmanaged files from conf.d.
# @param conf_dir
#   Directory for Nginx configuration files.
# @param daemon
#   Specifies if the service should run as a daemon.
# @param daemon_user
#   User under which the nginx daemon runs.
# @param daemon_group
#   Group under which the nginx daemon runs.
# @param dynamic_modules
#   Whether to enable dynamic modules.
# @param global_owner
#   Owner of the nginx global configuration files.
# @param global_group
#   Group associated with the nginx global configuration files.
# @param global_mode
#   File mode for the nginx global configuration files.
# @param limit_req_zone
#   Configuration settings for limiting request zones.
# @param log_dir
#   Directory for Nginx logs.
# @param manage_log_dir
#   Whether to manage log directory creation.
# @param log_user
#   User under whose authority log files are managed.
# @param log_group
#   Group under whose authority log files are managed.
# @param log_mode
#   Permissions setting for log files.
# @param http_access_log
#   Path for HTTP access logs.
# @param http_format_log
#   Log format for HTTP services.
# @param stream_access_log
#   Path for stream access logs.
# @param stream_custom_format_log
#   Custom log format for stream services.
# @param nginx_error_log
#   Path for Nginx error logs.
# @param nginx_error_log_severity
#   Severity level for error logs.
# @param pid
#   Path to the PID file for Nginx processes.
# @param proxy_temp_path
#   Temporary path for proxy server files.
# @param proxy_cache_key
#   Key settings for proxy cache.
# @param root_group
#   Group setting for Nginx root processes.
# @param sites_available_owner
#   Owner of the sites-available directory.
# @param sites_available_group
#   Group associated with the sites-available directory.
# @param sites_available_mode
#   File permissions for sites-available directory.
# @param super_user
#   User with enhanced permissions in the Nginx context.
# @param temp_dir
#   Temporary directory for storing operational data.
# @param server_purge
#   Whether to purge server configurations not managed by Puppet.
# @param conf_template
#   Template used for the main Nginx configuration file.
# @param fastcgi_conf_template
#   Template for FastCGI configuration.
# @param uwsgi_params_template
#   Template for uWSGI parameter configuration.
# @param absolute_redirect
#   Whether to use absolute redirection.
# @param accept_mutex
#   Enable or disable the accept mutex.
# @param accept_mutex_delay
#   Delay before retrying a locked accept mutex.
# @param client_body_buffer_size
#   Buffer size for reading the client request body. In case the request body is larger than the buffer, the whole body or only its part is written to a temporary file.
# @param client_max_body_size
#   Sets the maximum allowed size of the client request body. If the size in a request exceeds the configured value, the 413 (Request Entity Too Large) error is returned to the client.
# @param client_body_timeout
#   Defines a timeout for reading client request body. The timeout is set only for a period between two successive read operations, not for the transmission of the whole request body.
# @param send_timeout
#   Sets a timeout for sending a response to the client.
# @param lingering_timeout
#   Sets the maximum time a server will wait for lingering data sent by a client after the client has finished sending data.
# @param lingering_close
#   Controls how nginx closes client connections that are in a lingering state.
# @param lingering_time
#   Specifies the maximum time during which nginx will process (read and ignore) additional data coming from a client when lingering_close is active.
# @param etag
#   Enables or disables automatic generation of the `ETag` response header field for static resources.
# @param events_use
#   Event model used by Nginx for handling connections.
# @param fastcgi_cache_key
#   Key settings for FastCGI caching
# @param fastcgi_cache_path
#   Path settings for FastCGI cache
# @param fastcgi_cache_use_stale
#   Behavior settings when using stale FastCGI cache
# @param gzip
#   Enable or disable gzip compression
# @param gzip_buffers
#   Number and size of buffers used for gzip compression
# @param gzip_comp_level
#   Compression level for gzip
# @param gzip_disable
#   Conditions under which gzip compression is disabled
# @param gzip_min_length
#   Minimum length required to perform gzip compression
# @param gzip_http_version
#   HTTP version that influences gzip behavior
# @param gzip_proxied
#   Setting for gzip compression on proxied requests
# @param gzip_types
#   Types of content that should be gzip compressed
# @param gzip_vary
#   Whether to send the Vary header for gzip compressed responses
# @param http_cfg_prepend
#   Directives to prepend to the HTTP configuration block
# @param http_cfg_append
#   Directives to append to the HTTP configuration block
# @param gzip_static
#   Enable or disable gzip static file compression
# @param http_raw_prepend
#   Raw configuration directives to prepend in the HTTP context
# @param http_raw_append
#   Raw configuration directives to append in the HTTP context
# @param http_tcp_nodelay
#   Whether to use the TCP_NODELAY option on HTTP connections
# @param http_tcp_nopush
#   Whether to use the TCP_NOPUSH option on HTTP connections
# @param keepalive_timeout
#   Timeout for keep-alive connections
# @param keepalive_requests
#   Maximum number of requests per keep-alive connection
# @param log_format
#   The format used for logging HTTP requests
# @param stream_log_format
#   The format used for logging stream connections
# @param mail
#   Enable or disable the mail module
# @param map_hash_bucket_size
#   Size of the hash buckets for the map directive
# @param map_hash_max_size
#   Maximum size of the hash tables for the map directive
# @param mime_types_path
#   Path to the mime.types configuration file
# @param stream
#   Enable or disable the stream module
# @param multi_accept
#   Whether to accept multiple connections per worker process
# @param names_hash_bucket_size
#   Size of the hash buckets for storing server names
# @param names_hash_max_size
#   Maximum size of the hash tables for storing server names
# @param nginx_cfg_prepend
#   Directives to prepend to the nginx configuration file
# @param proxy_buffering
#   Enable or disable buffering of responses from the proxy
# @param proxy_buffers
#   Number and size of buffers used for proxy responses
# @param proxy_buffer_size
#   Size of each buffer used for proxy responses
# @param proxy_cache
#   Enable or disable proxy caching
# @param proxy_cache_path
#   Path settings for proxy cache storage
# @param proxy_connect_timeout
#   Timeout for making a connection to a proxy server
# @param proxy_headers_hash_bucket_size
#   Size of the hash buckets for proxy headers
# @param proxy_headers_hash_max_size
#   Maximum size of the hash table holding proxied-response header names
# @param proxy_http_version
#   HTTP version used for communications with the proxy server
# @param proxy_read_timeout
#   Timeout for reading a response from the proxy server
# @param proxy_redirect
#   Behavior for handling redirects from the proxy server
# @param proxy_send_timeout
#   Timeout for sending a request to the proxy server
# @param proxy_set_header
#   Headers to set for requests sent to the proxy
# @param proxy_hide_header
#   Headers to hide from responses received from the proxy
# @param proxy_pass_header
#   Headers to pass along from responses received from the proxy
# @param proxy_ignore_header
#   Headers to ignore from responses received from the proxy
# @param proxy_max_temp_file_size
#   Maximum size for temporary files used by the proxy
# @param proxy_busy_buffers_size
#   Size of the buffers used when the proxy is busy
# @param grpc
#   Sets the gRPC server address (`grpc_pass`)
# @param real_ip_header
#   Defines the request header field whose value will be used to replace the
#   client address. See http://nginx.org/en/docs/http/ngx_http_realip_module.html
# @param real_ip_recursive
#   If disabled, the original client address that matches one of the trusted
#   addresses is replaced by the last address sent in the request header field.
#   If enabled, the original client address that matches one of the trusted
#   addresses is replaced by the last non-trusted address sent in the request
#   header field.
# @param set_real_ip_from
#   Defines trusted addresses that are known to send correct replacement
#   addresses.
# @param sendfile
#   Whether to use the sendfile mechanism for file transmission
# @param server_tokens
#   Whether to reveal server version tokens to clients
# @param spdy
#   Enable or disable the SPDY protocol (deprecated in favor of HTTP/2)
# @param http2
#   Enable or disable HTTP/2
# @param ssl_stapling
#   Enable or disable OCSP stapling for SSL
# @param ssl_stapling_verify
#   Whether to verify OCSP responses
# @param snippets_dir
#   Directory for storing configuration snippets
# @param manage_snippets_dir
#   Whether to manage the creation and permissions of the snippets directory
# @param types_hash_bucket_size
#   Size of the hash buckets for MIME type mappings
# @param types_hash_max_size
#   Maximum size of the hash tables for MIME type mappings
# @param worker_connections
#   Number of connections each worker process can handle
# @param ssl_prefer_server_ciphers
#   Whether to prefer server ciphers over client ciphers in SSL negotiations
# @param worker_processes
#   Number of worker processes to spawn
# @param worker_rlimit_nofile
#   Maximum number of file descriptors that can be opened by each worker process
# @param pcre_jit
#   Whether to use Just-in-time compilation for PCRE
# @param ssl_protocols
#   SSL protocols to use
# @param ssl_ciphers
#   SSL ciphers to use
# @param ssl_dhparam
#   Path to the Diffie-Hellman parameter file for SSL
# @param open_file_cache
#   Settings for the open file cache
# @param open_file_cache_valid
#   Duration an item remains in the open file cache without being accessed
# @param open_file_cache_min_uses
#   Minimum number of uses an item must have to remain in the open file cache
# @param proxy_connection_upgrade
#   Whether to upgrade a connection to the next protocol
# @param proxy_cache_lock
#   Whether to use a lock on a cache item to prevent multiple populates
# @param default_type
#   Default MIME type to use if one cannot be determined from the provided file extension
# @param charset_types
#   MIME types for which character set specifications are applied
# @param charset
#   Default character set to apply
# @param index
#   Default file to serve when a directory is requested
# @param msie_padding
#   Whether to pad responses for MS Internet Explorer
# @param port_in_redirect
#   Whether to include the port number in redirects
# @param client_header_timeout
#   Timeout for reading client headers
# @param fastcgi_buffers
#   Number and size of buffers for FastCGI
# @param fastcgi_buffer_size
#   Size of each buffer for FastCGI
# @param ssl_ecdh_curve
#   The Elliptic Curve Diffie-Hellman parameters to use for SSL
# @param ssl_session_cache
#   Type of session cache to use for SSL
# @param ssl_session_timeout
#   Timeout for SSL session cache
# @param ssl_session_tickets
#   Whether to use SSL session tickets
# @param ssl_session_ticket_key
#   Key for SSL session tickets
# @param ssl_buffer_size
#   Size of the buffer used for SSL data
# @param ssl_crl
#   Path to the Certificate Revocation List file for SSL
# @param ssl_stapling_file
#   File containing the OCSP stapling data
# @param ssl_stapling_responder
#   URL of the OCSP responder
# @param ssl_trusted_certificate
#   Path to the trusted SSL certificate
# @param ssl_verify_depth
#   Maximum depth for chain verification in SSL
# @param ssl_password_file
#   Path to the file containing the SSL password
# @param ssl_reject_handshake
#   Reject TLS handshakes for server names this vhost does not serve, rather
#   than answering with the default certificate
# @param ssl_early_data
#   Enables TLS 1.3 early data. Note that a request sent in early data is
#   subject to replay attacks
# @param package_ensure
#   State of the package (installed, latest, etc.)
# @param package_name
#   Name of the Nginx package to be managed
# @param package_source
#   Source repository for the Nginx package
# @param package_flavor
#   Flavor of the package if applicable
# @param manage_repo
#   Whether to manage the repository where the Nginx package is stored
# @param yum_repo_sslverify
#   Whether to verify SSL certificates when accessing the YUM repository
# @param mime_types
#   Configuration for MIME types within Nginx
# @param mime_types_preserve_defaults
#   Whether to preserve default MIME types when overriding
# @param repo_release
#   The release version of the repository to use for package management
# @param passenger_package_ensure
#   State of the Passenger package (installed, latest, etc.)
# @param repo_source
#   Source of the repository for package management
# @param service_ensure
#   Desired state of the Nginx service (running, stopped, etc.)
# @param service_enable
#   Whether to enable the Nginx service to start at boot
# @param service_flags
#   Additional flags to pass to the service command
# @param service_restart
#   Whether to restart the service when necessary
# @param service_name
#   Name of the service to manage
# @param service_manage
#   Whether to manage the service itself
# @param geo_mappings
#   Settings for geographical IP-based mappings
# @param geo_mappings_defaults
#   Default settings for geo mappings
# @param string_mappings
#   Settings for string-based mappings
# @param string_mappings_defaults
#   Default settings for string mappings
# @param nginx_locations
#   Configuration settings for specific Nginx locations
# @param nginx_locations_defaults
#   Default settings for Nginx locations
# @param nginx_mailhosts
#   Configuration settings for mail hosts in Nginx
# @param nginx_mailhosts_defaults
#   Default settings for mail hosts
# @param nginx_servers
#   Configuration settings for Nginx servers
# @param nginx_servers_defaults
#   Default settings for servers
# @param nginx_streamhosts
#   Configuration settings for stream hosts in Nginx
# @param nginx_streamhosts_defaults
#   Default settings for stream hosts
# @param nginx_upstreams
#   Configuration settings for upstream server blocks in Nginx
# @param nginx_upstreams_defaults
#   Default settings for upstream configurations
# @param purge_passenger_repo
#   Whether to purge the Passenger repository configuration
#
# @param variables_hash_bucket_size
#   Size of the hash buckets holding the names of nginx variables
# @param variables_hash_max_size
#   Maximum size of the hash table holding the names of nginx variables
class nginx (
  ### START Nginx Configuration ###
  Optional[Variant[Stdlib::Absolutepath, Tuple[Stdlib::Absolutepath, Integer, 1, 4]]]
  $client_body_temp_path                                     = undef, # 'client_body_temp'
  Optional[Boolean] $recursive_error_pages                   = undef, # off
  Boolean $confd_only                                        = false,
  Boolean $confd_purge                                       = false,
  Stdlib::Absolutepath $conf_dir                             = $nginx::params::conf_dir,
  Optional[Nginx::Switch] $daemon                            = undef, # 'on'
  String[1] $daemon_user                                     = $nginx::params::daemon_user,
  Optional[String[1]] $daemon_group                          = undef,
  Array[String] $dynamic_modules                             = [],
  String[1] $global_owner                                    = 'root',
  String[1] $global_group                                    = $nginx::params::global_group,
  Stdlib::Filemode $global_mode                              = '0644',
  Optional[Hash[String, Nginx::LimitReqZone]] $limit_req_zone = undef,
  Stdlib::Absolutepath $log_dir                              = $nginx::params::log_dir,
  Boolean $manage_log_dir                                    = true,
  String[1] $log_user                                        = $nginx::params::log_user,
  String[1] $log_group                                       = $nginx::params::log_group,
  Stdlib::Filemode $log_mode                                 = $nginx::params::log_mode,
  Variant[
    String,
    Array[String],
    Hash[String, String]
  ] $http_access_log                                         = "${log_dir}/access.log",
  Optional[String] $http_format_log                          = undef, # 'combined'
  Variant[String, Array[String]] $stream_access_log          = "${log_dir}/stream-access.log",
  Optional[String] $stream_custom_format_log                 = undef,
  Variant[String, Array[String]] $nginx_error_log            = "${log_dir}/error.log",
  Nginx::ErrorLogSeverity $nginx_error_log_severity          = 'error',
  Variant[Stdlib::Absolutepath, Boolean] $pid                = $nginx::params::pid,
  Optional[Variant[Stdlib::Absolutepath, Tuple[Stdlib::Absolutepath, Integer, 1, 4]]]
  $proxy_temp_path                                           = undef,  # 'proxy_temp'
  Optional[String] $proxy_cache_key                          = undef,  # $scheme$proxy_host$request_uri
  String[1] $root_group                                      = $nginx::params::root_group,
  String[1] $sites_available_owner                           = 'root',
  String[1] $sites_available_group                           = $nginx::params::sites_available_group,
  Stdlib::Filemode $sites_available_mode                     = '0644',
  Boolean $super_user                                        = true,
  Stdlib::Absolutepath $temp_dir                             = '/tmp',
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
  Optional[Variant[Nginx::Switch, Enum['always']]]
  $lingering_close                                           = undef,
  Optional[String[1]] $lingering_time                        = undef,
  Optional[Nginx::Switch] $etag                              = undef,  # 'on'
  Optional[Nginx::ConnectionProcessing] $events_use          = undef,  # 'epoll'
  Array[Nginx::DebugConnection] $debug_connections           = [],
  Optional[String] $fastcgi_cache_key                        = undef,  # undef
  Optional[Hash[Stdlib::Unixpath, Nginx::CachePath, 1]] $fastcgi_cache_path = undef,  # undef
  Optional[Variant[Nginx::CacheUseStale, Array[Nginx::CacheUseStale]]]
  $fastcgi_cache_use_stale                                   = undef,  # 'off'
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
  Hash[String[1], Nginx::LogFormat] $log_format              = {},
  Hash[String[1], Nginx::LogFormat] $stream_log_format       = {},
  Boolean $mail                                              = false,
  Optional[Integer] $map_hash_bucket_size                    = undef,
  Optional[Integer] $map_hash_max_size                       = undef,
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
  Optional[Hash[Stdlib::Unixpath, Nginx::CachePath, 1]]
  $proxy_cache_path                                          = undef,  # undef
  Optional[Nginx::Time] $proxy_connect_timeout               = undef,  # 60s
  Optional[Nginx::Size] $proxy_headers_hash_bucket_size      = undef,  # 64
  Optional[Nginx::Size] $proxy_headers_hash_max_size         = undef,  # 512
  Optional[Enum['1.0', '1.1']] $proxy_http_version           = undef,  # '1.0'
  Optional[Nginx::Time] $proxy_read_timeout                  = undef,  # 60
  Optional[Variant[Array[String], String]] $proxy_redirect   = undef,  # 'default'
  Optional[Nginx::Time] $proxy_send_timeout                  = undef,  # 60
  Optional[String] $grpc                                     = undef,
  Array[String] $proxy_set_header                            = [],     # ['Host $proxy_host', 'Connection close']
  Array[String] $proxy_hide_header                           = [],
  Array[String] $proxy_pass_header                           = [],
  Array[String] $proxy_ignore_header                         = [],
  Optional[Nginx::Size] $proxy_max_temp_file_size            = undef,
  Optional[Nginx::Size] $proxy_busy_buffers_size             = undef,
  Optional[Nginx::Switch] $sendfile                          = undef,  # 'off'
  Optional[String[1]] $real_ip_header                        = undef,
  Optional[Nginx::Switch] $real_ip_recursive                 = undef,  # 'off'
  Optional[Variant[String[1], Array[String[1]]]] $set_real_ip_from = undef,
  Optional[Nginx::Switch] $server_tokens                     = undef,  # 'on',
  Optional[Nginx::Switch] $spdy                              = undef,  # 'off'
  Optional[Nginx::Switch] $http2                             = undef,  # 'off'
  Optional[Nginx::Switch] $ssl_stapling                      = undef,  # 'off'
  Optional[Nginx::Switch] $ssl_stapling_verify               = undef, # 'off',
  Stdlib::Absolutepath $snippets_dir                         = $nginx::params::snippets_dir,
  Boolean $manage_snippets_dir                               = false,
  Optional[Nginx::Size] $types_hash_bucket_size              = undef,  # 64
  Optional[Nginx::Size] $types_hash_max_size                 = undef,  # 1024
  Optional[Integer] $worker_connections                      = undef,  # 512
  Nginx::Switch $ssl_prefer_server_ciphers                   = false,
  Variant[Enum['auto'], Integer] $worker_processes           = 'auto', # 1
  Optional[Integer] $worker_rlimit_nofile                    = undef,  # undef
  Optional[Nginx::Switch] $pcre_jit                          = undef,
  # Mozilla SSL Configuration Generator - intermediate configuration
  String $ssl_protocols                                      = 'TLSv1.2 TLSv1.3',
  String $ssl_ciphers                                        = 'ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305', # lint:ignore:140chars
  Optional[Stdlib::Unixpath] $ssl_dhparam                    = undef,
  Optional[Nginx::FileCache] $open_file_cache                = undef,  # 'off'
  Nginx::Time $open_file_cache_valid                         = 60,
  Integer $open_file_cache_min_uses                          = 1,
  Boolean $proxy_connection_upgrade                          = true,  # see http://nginx.org/en/docs/http/websocket.html
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
  Optional[String] $ssl_ecdh_curve                           = 'X25519:prime256v1:secp384r1',
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
  Optional[Nginx::Switch] $ssl_reject_handshake              = undef,  # 'off'
  Optional[Nginx::Switch] $ssl_early_data                    = undef,  # 'off'
  Optional[Nginx::Switch] $reset_timedout_connection         = undef,
  Optional[Integer] $variables_hash_bucket_size              = undef,  # 64
  Optional[Integer] $variables_hash_max_size                 = undef,  # 1024

  ### START Package Configuration ###
  String $package_ensure                                     = installed,
  String $package_name                                       = $nginx::params::package_name,
  Nginx::Package_source $package_source                      = 'nginx',
  Optional[String] $package_flavor                           = undef,
  Boolean $manage_repo                                       = $nginx::params::manage_repo,
  Variant[Boolean, Enum['absent']] $yum_repo_sslverify       = 'absent',
  Hash[String[1], String[1]] $mime_types                     = $nginx::params::mime_types,
  Boolean $mime_types_preserve_defaults                      = false,
  Optional[String] $repo_release                             = undef,
  String $passenger_package_ensure                           = installed,
  String[1] $passenger_package_name                          = $nginx::params::passenger_package_name,
  # This is optional, to allow it to be set to undef for systems that install it with nginx always
  Optional[String[1]] $mail_package_name                     = $nginx::params::mail_package_name,
  Optional[Stdlib::HTTPUrl] $repo_source                     = undef,
  ### END Package Configuration ###

  ### START Service Configuation ###
  Stdlib::Ensure::Service $service_ensure                    = 'running',
  Boolean $service_enable                                    = true,
  Optional[String] $service_flags                            = undef,
  Optional[String] $service_restart                          = undef,
  String $service_name                                       = 'nginx',
  Boolean $service_manage                                    = true,
  Boolean $service_config_check                              = false,
  String $service_config_check_command                       = 'nginx -t',
  ### END Service Configuration ###

  ### START Hiera Lookups ###
  Hash $geo_mappings                                      = {},
  Hash $geo_mappings_defaults                             = {},
  Hash $string_mappings                                   = {},
  Hash $string_mappings_defaults                          = {},
  Hash $nginx_snippets                                    = {},
  Hash $nginx_snippets_defaults                           = {},
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
  String[1] $nginx_version                                = pick($facts['nginx_version'], '1.16.0'),

  ### END Hiera Lookups ###
) inherits nginx::params {
  contain 'nginx::package'
  contain 'nginx::config'
  contain 'nginx::service'

  create_resources( 'nginx::resource::geo', $geo_mappings, $geo_mappings_defaults )
  create_resources( 'nginx::resource::snippet', $nginx_snippets, $nginx_snippets_defaults )
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
