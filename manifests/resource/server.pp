# @summary Create a virtual host
#
# @param ensure
#   Enables or disables the specified server
# @param listen_ip
#   Default IP Address for NGINX to listen with this server on. Defaults to all
#   interfaces (*)
# @param listen_port
#   Default TCP Port for NGINX to listen with this server on.
# @param listen_options
#   Extra options for listen directive like 'default_server' to catchall.
# @param listen_unix_socket_enable
#   value to enable/disable UNIX socket listening support.
# @param listen_unix_socket
#   Default unix socket for NGINX to listen with this server on.
# @param listen_unix_socket_options
#   Extra options for listen directive like 'default' to catchall.
# @param location_satisfy
#   Allows access if all (all) or at least one (any) of the auth modules allow
#   access.
# @param location_allow
#   Locations to allow connections from.
# @param location_deny
#   Locations to deny connections from.
# @param ipv6_enable
#   value to enable/disable IPv6 support (false|true). Module will check to see
#   if IPv6 support exists on your system before enabling.
# @param ipv6_listen_ip
#   Default IPv6 Address for NGINX to listen with this server on. Defaults to all interfaces (::)
# @param ipv6_listen_port
#   Default IPv6 Port for NGINX to listen with this server on. Defaults to TCP 80
# @param ipv6_listen_options
#   Extra options for listen directive like 'default' to catchall. Template
#   will allways add ipv6only=on.  While issue jfryman/puppet-nginx#30 is
#   discussed, default value is 'default'.
# @param add_header
#   Adds headers to the HTTP response when response code is equal to 200, 204,
#   301, 302 or 304.
# @param index_files
#   Default index files for NGINX to read when traversing a directory
# @param autoindex
#   Set it on 'on' or 'off 'to activate/deactivate autoindex directory listing.
# @param autoindex_exact_size
#   Set it on 'on' or 'off' to activate/deactivate autoindex displaying exact
#   filesize, or rounded to kilobytes, megabytes and gigabytes.
# @param autoindex_format
#   Sets the format of a directory listing.
# @param autoindex_localtime
#   Specifies whether times in the directory listing should be output in the
#   local time zone or UTC.
# @param proxy
#   Proxy server(s) for the root location to connect to. Accepts a single
#   value, can be used in conjunction with nginx::resource::upstream
# @param proxy_read_timeout
#   Override the default proxy read timeout value of 90 seconds
# @param proxy_send_timeout
#   Override the default proxy send timeout value of 90 seconds
# @param proxy_redirect
#   Override the default proxy_redirect value of off.
# @param proxy_buffering
#   If defined, sets the proxy_buffering to the passed value.
# @param proxy_request_buffering
#   If defined, sets the proxy_request_buffering to the passed value.
# @param proxy_max_temp_file_size
#   Sets the maximum size of the temporary buffer file.
# @param proxy_busy_buffers_size
#   Sets the total size of buffers that can be busy sending a response to the
#   client while the response is not yet fully read.
# @param resolver
#   Configures name servers used to resolve names of upstream servers into addresses.
# @param fastcgi
#   location of fastcgi (host:port)
# @param fastcgi_param
#   Set additional custom fastcgi_params
# @param fastcgi_params
#   optional alternative fastcgi_params file to use
# @param fastcgi_index
#   optional FastCGI index page
# @param fastcgi_script
#   optional SCRIPT_FILE parameter
# @param uwsgi_read_timeout
#   optional value for uwsgi_read_timeout
# @param ssl
#   Indicates whether to setup SSL bindings for this server.
# @param ssl_cert
#   Pre-generated SSL Certificate file to reference for SSL Support. This is
#   not generated by this module.  Set to `false` to inherit from the http
#   section, which improves performance by conserving memory.
#   Use an array to add multiple SSL Certificates.
# @param ssl_client_cert
#   Pre-generated SSL Certificate file to reference for client verify SSL
#   Support. This is not generated by this module.
# @param ssl_verify_client
#   Enables verification of client certificates.
# @param ssl_crl
#   Specifies CRL path in file system
# @param ssl_dhparam
#   This directive specifies a file containing Diffie-Hellman key agreement
#   protocol cryptographic parameters, in PEM format, utilized for exchanging
#   session keys between server and client.
# @param ssl_ecdh_curve
#   This directive specifies a curve for ECDHE ciphers.
# @param ssl_prefer_server_ciphers
#   String: Specifies that server ciphers should be preferred over client
#   ciphers when using the SSLv3 and TLS protocols.
# @param ssl_redirect
#   Adds a server directive and return statement to force ssl redirect. Will
#   honor ssl_port if it's set.
# @param ssl_redirect_port
#   Overrides $ssl_port in the SSL redirect set by ssl_redirect
# @param ssl_key
#   Pre-generated SSL Key file to reference for SSL Support. This is not
#   generated by this module. Set to `false` to inherit from the http section,
#   which improves performance by conserving memory.
#   Use an array to add multiple SSL Keys.
# @param ssl_port
#   Default IP Port for NGINX to listen with this SSL server on.
# @param ssl_protocols
#   SSL protocols enabled. Defaults to 'TLSv1 TLSv1.1 TLSv1.2'.
# @param ssl_buffer_size
#   Sets the size of the buffer used for sending data.
# @param ssl_ciphers
#   SSL ciphers enabled.
# @param ssl_stapling
#   Enables or disables stapling of OCSP responses by the server.
# @param ssl_stapling_file
#   When set, the stapled OCSP response will be taken from the specified file
#   instead of querying the OCSP responder specified in the server certificate.
# @param ssl_stapling_responder
#   Overrides the URL of the OCSP responder specified in the Authority
#   Information Access certificate extension.
# @param ssl_stapling_verify
#   Enables or disables verification of OCSP responses by the server. Defaults to false.
# @param ssl_session_timeout
#   Specifies a time during which a client may reuse the session parameters stored in a cache.
#     Defaults to 5m.
# @param ssl_session_tickets
#   Enables or disables session resumption through TLS session tickets.
# @param ssl_session_ticket_key
#   Sets a file with the secret key used to encrypt and decrypt TLS session tickets.
# @param ssl_trusted_cert
#   Specifies a file with trusted CA certificates in the PEM format used to verify client
#     certificates and OCSP responses if ssl_stapling is enabled.
# @param ssl_verify_depth
#   Sets the verification depth in the client certificates chain.
# @param ssl_add_header
#   Hash: Adds headers to the HTTP response when response code is equal to 200, 204, 301, 302 or 304.
#     for only SSL enabled server block
# @param ssl_password_file
#   File containing the password for the SSL Key file.
# @param spdy
#   Toggles SPDY protocol.
# @param http2
#   Toggles HTTP/2 protocol.
# @param catch_all_server_name
#   Bool: Sets server name to be invalid (most common is: server_name _;). false by default.
# @param empty_host_header
#   Bool: Sets server name to empty string to handle empty host headers, false by default
# @param server_name
#   List of servernames for which this server will respond. Default [$name].
# @param www_root
#   Specifies the location on disk for files to be read from. Cannot be set in conjunction with $proxy
# @param rewrite_www_to_non_www
#   Adds a server directive and rewrite rule to rewrite www.domain.com to domain.com in order to avoid
#     duplicate content (SEO);
# @param rewrite_non_www_to_www
#   Adds a server directive and rewrite rule to rewrite domain.com to www.domain.com in order to avoid
#     duplicate content (SEO);
# @param try_files
#   Specifies the locations for files to be checked as an array. Cannot be used in conjuction with $proxy.
# @param proxy_cache
#   This directive sets name of zone for caching. The same zone can be used in multiple places.
# @param proxy_cache_key
#   Override the default proxy_cache_key of $scheme$proxy_host$request_uri
# @param proxy_cache_use_stale
#   Override the default proxy_cache_use_stale value of off.
# @param proxy_cache_valid
#   This directive sets the time for caching different replies.
# @param proxy_cache_lock
#   This directive sets the locking mechanism for pouplating cache.
# @param proxy_cache_bypass
#   Defines conditions which the response will not be cached
# @param proxy_no_cache
#   Defines conditions under which the response will not be saved to a cache
# @param proxy_method
#   If defined, overrides the HTTP method of the request to be passed to the backend.
# @param proxy_http_version
#   Sets the proxy http version
# @param proxy_set_body
#   If defined, sets the body passed to the backend.
# @param proxy_cookie_domain
#   Sets a text that should be changed in the domain attribute of the "Set-Cookie" header
#   fields of a proxied server response.
#   Possible values:
#   1) off
#   2) Hash of pairs "domain => replacement"
# @param absolute_redirect
#   Enables or disables the absolute redirect functionality of nginx
# @param auth_basic
#   This directive includes testing name and password with HTTP Basic Authentication.
# @param auth_basic_user_file
#   This directive sets the htpasswd filename for the authentication realm.
# @param auth_request
#   This allows you to specify a custom auth endpoint
# @param client_max_body_size
#   This directive sets client_max_body_size.
# @param client_body_timeout
#   Sets how long the server will wait for a client body. Default is 60s
# @param client_header_timeout
#   Sets how long the server will wait for a client header. Default is 60s
# @param ignore_invalid_headers
#   Controls whether header fields with invalid names should be ignored.
# @param raw_prepend
#   A single string, or an array of strings to prepend to the server directive
#   (after cfg prepend directives). NOTE: YOU are responsible for a semicolon
#   on each line that requires one.
# @param raw_append
#   A single string, or an array of strings to append to the server directive
#   (after cfg append directives). NOTE: YOU are responsible for a semicolon on
#   each line that requires one.
# @param location_raw_prepend
#   A single string, or an array of strings to prepend to the location
#   directive (after custom_cfg directives). NOTE: YOU are responsible for a
#   semicolon on each line that requires one.
# @param location_raw_append
#   A single string, or an array of strings to append to the location directive
#   (after custom_cfg directives). NOTE: YOU are responsible for a semicolon on
#   each line that requires one.
# @param server_cfg_append
#   It expects a hash with custom directives to put after everything else inside server
# @param server_cfg_prepend
#   It expects a hash with custom directives to put before everything else inside server
# @param server_cfg_ssl_append
#   It expects a hash with custom directives to put after everything else inside server ssl
# @param server_cfg_ssl_prepend
#   It expects a hash with custom directives to put before everything else inside server ssl
# @param include_files
#   Adds include files to server
# @param access_log
#   Where to write access log (log format can be set with $format_log). This
#   can be either a string or an array; in the latter case, multiple lines will
#   be created. Additionally, unlike the earlier behavior, setting it to
#   'absent' in the server context will remove this directive entirely from the
#   server stanza, rather than setting a default. Can also be disabled for this
#   server with the string 'off'.
# @param error_log
#   Where to write error log. May add additional options like error level to
#   the end. May set to 'absent', in which case it will be omitted in this
#   server stanza (and default to nginx.conf setting)
# @param passenger_cgi_param
#   Allows one to define additional CGI environment variables to pass to the backend application
# @param passenger_set_header
#   Allows one to set headers to pass to the backend application (Passenger 5.0+)
# @param passenger_env_var
#   Allows one to set environment variables to pass to the backend application (Passenger 5.0+)
# @param passenger_pre_start
#   Allows setting a URL to pre-warm the host. Per Passenger docs, the "domain
#   part of the URL" must match a value of server_name. If this is an array,
#   multiple URLs can be specified.
# @param log_by_lua
#   Run the Lua source code inlined as the <lua-script-str> at the log request
#   processing phase. This does not replace the current access logs, but runs
#   after.
# @param log_by_lua_file
#   Equivalent to log_by_lua, except that the file specified by
#   <path-to-lua-script-file> contains the Lua code, or, as from the v0.5.0rc32
#   release, the Lua/LuaJIT bytecode to be executed.
# @param gzip_types
#   Defines gzip_types, nginx default is text/html
# @param gzip_static
#   Defines gzip_static, nginx default is off
# @param owner
#   Defines owner of the .conf file
# @param group
#   Defines group of the .conf file
# @param mode
#   Defines mode of the .conf file
# @param maintenance
#   A boolean value to set a server in maintenance
# @param maintenance_value
#   Value to return when maintenance is on.
# @param error_pages
#   Setup errors pages, hash key is the http code and hash value the page
# @param locations
#   Hash of location resources used by this server
# @param locations_defaults
#   Hash of location default settings
#
# @example
#   nginx::resource::server { 'test2.local':
#     ensure   => present,
#     www_root => '/var/www/nginx-default',
#     ssl      => true,
#     ssl_cert => '/tmp/server.crt',
#     ssl_key  => '/tmp/server.pem',
#   }
#
define nginx::resource::server (
  Enum['absent', 'present'] $ensure                                              = 'present',
  Optional[Variant[Array, String]] $listen_ip                                    = undef,
  Integer $listen_port                                                           = 80,
  Optional[String] $listen_options                                               = undef,
  Boolean $listen_unix_socket_enable                                             = false,
  Variant[Array[Stdlib::Absolutepath], Stdlib::Absolutepath] $listen_unix_socket = '/var/run/nginx.sock',
  Optional[String] $listen_unix_socket_options                                   = undef,
  Optional[Enum['any', 'all']] $location_satisfy                                 = undef,
  Array $location_allow                                                          = [],
  Array $location_deny                                                           = [],
  Boolean $ipv6_enable                                                           = false,
  Variant[Array, String] $ipv6_listen_ip                                         = '::',
  Integer $ipv6_listen_port                                                      = 80,
  Optional[String] $ipv6_listen_options                                          = undef,
  Hash $add_header                                                               = {},
  Hash $ssl_add_header                                                           = {},
  Boolean $ssl                                                                   = false,
  Boolean $ssl_listen_option                                                     = true,
  Optional[Variant[String, Boolean, Array[String]]] $ssl_cert                    = undef,
  Optional[String] $ssl_client_cert                                              = undef,
  String $ssl_verify_client                                                      = 'on',
  Optional[String] $ssl_dhparam                                                  = undef,
  Optional[String] $ssl_ecdh_curve                                               = undef,
  Boolean $ssl_redirect                                                          = false,
  Boolean $ssl_redirect_only                                                     = false,
  Optional[Integer] $ssl_redirect_port                                           = undef,
  Optional[Stdlib::Fqdn] $ssl_redirect_host                                      = undef,
  Optional[String] $ssl_redirect_url                                             = undef,
  Optional[Variant[String, Boolean, Array[String]]] $ssl_key                     = undef,
  Integer $ssl_port                                                              = 443,
  Optional[Nginx::Switch] $ssl_prefer_server_ciphers                             = undef,
  Optional[String] $ssl_protocols                                                = undef,
  Optional[Nginx::Size] $ssl_buffer_size                                         = undef,
  Optional[String] $ssl_ciphers                                                  = undef,
  Optional[String] $ssl_cache                                                    = undef, # none
  Optional[String] $ssl_crl                                                      = undef,
  Optional[Nginx::Switch] $ssl_stapling                                          = undef, # off
  Optional[String] $ssl_stapling_file                                            = undef,
  Optional[String] $ssl_stapling_responder                                       = undef,
  Optional[Nginx::Switch] $ssl_stapling_verify                                   = undef, # off
  Optional[Nginx::Time] $ssl_session_timeout                                     = undef, # 5m
  Optional[Nginx::Switch] $ssl_session_tickets                                   = undef, # on
  Optional[String] $ssl_session_ticket_key                                       = undef,
  Optional[String] $ssl_trusted_cert                                             = undef,
  Optional[Integer] $ssl_verify_depth                                            = undef,
  Nginx::Switch $spdy                                                            = $nginx::spdy,
  Nginx::Switch $http2                                                           = $nginx::http2,
  Optional[Stdlib::Absolutepath] $ssl_password_file                              = undef,
  Optional[String] $proxy                                                        = undef,
  Optional[String] $proxy_redirect                                               = undef,
  Optional[Nginx::Time] $proxy_read_timeout                                      = $nginx::proxy_read_timeout,
  Optional[Nginx::Time] $proxy_send_timeout                                      = $nginx::proxy_send_timeout,
  Optional[Nginx::Time] $proxy_connect_timeout                                   = $nginx::proxy_connect_timeout,
  Array[String] $proxy_set_header                                                = $nginx::proxy_set_header,
  Array[String] $proxy_hide_header                                               = $nginx::proxy_hide_header,
  Array[String] $proxy_pass_header                                               = $nginx::proxy_pass_header,
  Array[String] $proxy_ignore_header                                             = $nginx::proxy_ignore_header,
  Optional[String] $proxy_cache                                                  = undef,
  Optional[String] $proxy_cache_key                                              = undef,
  Optional[String] $proxy_cache_use_stale                                        = undef,
  Optional[Variant[Array[String], String]] $proxy_cache_valid                    = undef,
  Optional[Enum['on', 'off']] $proxy_cache_lock                                  = undef,
  Optional[Variant[Array[String], String]] $proxy_cache_bypass                   = undef,
  Optional[Variant[Array[String], String]] $proxy_no_cache                       = undef,
  Optional[String] $proxy_method                                                 = undef,
  Optional[String] $proxy_http_version                                           = undef,
  Optional[String] $proxy_set_body                                               = undef,
  Optional[Nginx::Switch] $proxy_buffering                                       = undef,
  Optional[Nginx::Switch] $proxy_request_buffering                               = undef,
  Optional[Nginx::Size] $proxy_max_temp_file_size                                = undef,
  Optional[Nginx::Size] $proxy_busy_buffers_size                                 = undef,
  Optional[Boolean] $proxy_cache_revalidate                                      = undef,
  Optional[
    Variant[
      Boolean,
      Enum['off'],
      Hash[String, String, 1]
    ]
  ] $proxy_cookie_domain                                                         = undef,
  Array $resolver                                                                = [],
  Optional[String] $fastcgi                                                      = undef,
  Optional[String] $fastcgi_index                                                = undef,
  $fastcgi_param                                                                 = undef,
  String $fastcgi_params                                                         = "${nginx::conf_dir}/fastcgi.conf",
  Optional[String] $fastcgi_script                                               = undef,
  Optional[String] $uwsgi                                                        = undef,
  String $uwsgi_params                                                           = "${nginx::config::conf_dir}/uwsgi_params",
  Optional[String] $uwsgi_read_timeout                                           = undef,
  Optional[Array[String]] $index_files                                           = [],
  Optional[String] $autoindex                                                    = undef,
  Optional[String] $charset                                                      = undef, # 'off'
  Boolean $catch_all_server_name                                                 = false,
  Boolean $empty_host_header                                                     = false,
  Optional[Enum['on', 'off']] $autoindex_exact_size                              = undef,
  Optional[Enum['html', 'xml', 'json', 'jsonp']] $autoindex_format               = undef,
  Optional[Enum['on', 'off']] $autoindex_localtime                               = undef,
  Array[String] $server_name                                                     = [$name],
  Optional[String] $www_root                                                     = undef,
  Boolean $rewrite_www_to_non_www                                                = false,
  Boolean $rewrite_non_www_to_www                                                = false,
  Optional[Nginx::Time] $send_timeout                                            = undef,  # 60s
  Optional[Hash] $location_custom_cfg                                            = undef,
  Optional[Hash] $location_cfg_prepend                                           = undef,
  Optional[Hash] $location_cfg_append                                            = undef,
  Optional[Hash] $location_custom_cfg_prepend                                    = undef,
  Optional[Hash] $location_custom_cfg_append                                     = undef,
  Optional[Array[String]] $try_files                                             = undef,
  Optional[Enum['on', 'off']] $absolute_redirect                                 = undef,
  Optional[String] $auth_basic                                                   = undef,
  Optional[String] $auth_basic_user_file                                         = undef,
  Optional[String] $auth_request                                                 = undef,
  Optional[String] $client_body_timeout                                          = undef,
  Optional[String] $client_header_timeout                                        = undef,
  Optional[Nginx::Switch] $ignore_invalid_headers                                = undef, # 'on'
  Optional[Nginx::Size] $client_max_body_size                                    = undef,
  Optional[Nginx::Switch] $chunked_transfer_encoding                             = undef, # 'on'
  Optional[Variant[Array[String], String]] $raw_prepend                          = undef,
  Optional[Variant[Array[String], String]] $raw_append                           = undef,
  Optional[Variant[Array[String], String]] $location_raw_prepend                 = undef,
  Optional[Variant[Array[String], String]] $location_raw_append                  = undef,
  Optional[Hash] $server_cfg_prepend                                             = undef,
  Optional[Hash] $server_cfg_append                                              = undef,
  Optional[Hash] $server_cfg_ssl_prepend                                         = undef,
  Optional[Hash] $server_cfg_ssl_append                                          = undef,
  Optional[Array[String]] $include_files                                         = undef,
  Optional[Variant[
    Boolean,
    String,
    Array[String],
    Hash[String, String]
  ]] $access_log                                                                 = 'absent',
  Optional[Variant[Boolean, String, Array]] $error_log                           = false,
  $format_log                                                                    = 'combined',
  Optional[Hash] $passenger_cgi_param                                            = undef,
  Optional[Hash] $passenger_set_header                                           = undef,
  Optional[Hash] $passenger_env_var                                              = undef,
  Optional[Variant[Array[String], String]] $passenger_pre_start                  = undef,
  Optional[String] $log_by_lua                                                   = undef,
  Optional[String] $log_by_lua_file                                              = undef,
  Boolean $use_default_location                                                  = false,
  $rewrite_rules                                                                 = [],
  $string_mappings                                                               = {},
  $geo_mappings                                                                  = {},
  Optional[String] $gzip_types                                                   = undef,
  Optional[
      Variant[
        Enum['always'],
        Nginx::Switch
      ]
  ] $gzip_static                                                                 = undef,
  String $owner                                                                  = $nginx::global_owner,
  String $group                                                                  = $nginx::global_group,
  String $mode                                                                   = $nginx::global_mode,
  Boolean $maintenance                                                           = false,
  String $maintenance_value                                                      = 'return 503',
  $error_pages                                                                   = undef,
  Optional[Nginx::Switch] $recursive_error_pages                                 = undef, # 'off'
  Hash $locations                                                                = {},
  Hash $locations_defaults                                                       = {},
  Optional[Array[String]] $set_real_ip_from                                      = undef,
  Optional[Nginx::ReturnFormat] $return                                          = undef,
  Boolean $server_proxy_settings                                                 = false,
) {
  if ! defined(Class['nginx']) {
    fail('You must include the nginx base class before using any defined resources')
  }

  if $rewrite_www_to_non_www == true and $rewrite_non_www_to_www == true {
    fail('You must not set both $rewrite_www_to_non_www and $rewrite_non_www_to_www to true')
  }

  # Variables
  if $nginx::confd_only {
    $server_dir = "${nginx::conf_dir}/conf.d"
  } else {
    $server_dir = "${nginx::conf_dir}/sites-available"
    $server_enable_dir = "${nginx::conf_dir}/sites-enabled"
    $server_symlink_ensure = $ensure ? {
      'absent' => absent,
      default  => 'link',
    }
  }

  $name_sanitized = regsubst($name, ' ', '_', 'G')
  $config_file = "${server_dir}/${name_sanitized}.conf"

  File {
    ensure => $ensure ? {
      'absent' => absent,
      default  => 'file',
    },
    notify => Class['nginx::service'],
    owner  => $owner,
    group  => $group,
    mode   => $mode,
  }

  # Add IPv6 Logic Check - Nginx service will not start if ipv6 is enabled
  # and support does not exist for it in the kernel.
  if $ipv6_enable and !$ipv6_listen_ip {
    warning('nginx: IPv6 support is not enabled or configured properly')
  }

  # Check to see if SSL Certificates are properly defined.
  if $ssl {
    if $ssl_cert == undef {
      fail('nginx: ssl_cert must be set to false or to a fully qualified path')
    }
    if $ssl_key == undef {
      fail('nginx: ssl_key must be set to false or to a fully qualified path')
    }
  }

  # Try to error in the case where the user sets ssl_port == listen_port but
  # doesn't set ssl = true
  if !$ssl and $ssl_port == $listen_port {
    warning('nginx: ssl must be true if listen_port is the same as ssl_port')
  }

  concat { $config_file:
    ensure  => $ensure,
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    notify  => Class['nginx::service'],
    require => File[$server_dir],
    tag     => 'nginx_config_file',
  }

  # This deals with a situation where the listen directive for SSL doesn't match
  # the port we want to force the SSL redirect to.
  if $ssl_redirect_port {
    $_ssl_redirect_port = $ssl_redirect_port
  } elsif $ssl_port {
    $_ssl_redirect_port = $ssl_port
  }

  $_ssl_redirect = $ssl_redirect or $ssl_redirect_only

  # Suppress unneeded stuff in non-SSL location block when certain conditions are
  # met.
  $ssl_only = ($ssl and $ssl_port == $listen_port) or $_ssl_redirect

  # If we're redirecting to SSL, the default location block is useless, *unless*
  # SSL is enabled for this server
  # either       and    ssl -> true
  # ssl redirect and no ssl -> false
  if (!$_ssl_redirect or $ssl) and $use_default_location {
    # Create the default location reference for the server
    nginx::resource::location { "${name_sanitized}-default":
      ensure                      => $ensure,
      server                      => $name_sanitized,
      ssl                         => $ssl,
      ssl_only                    => $ssl_only,
      location                    => '/',
      location_satisfy            => $location_satisfy,
      location_allow              => $location_allow,
      location_deny               => $location_deny,
      proxy                       => $proxy,
      proxy_redirect              => $proxy_redirect,
      proxy_read_timeout          => $proxy_read_timeout,
      proxy_send_timeout          => $proxy_send_timeout,
      proxy_connect_timeout       => $proxy_connect_timeout,
      proxy_cache                 => $proxy_cache,
      proxy_cache_key             => $proxy_cache_key,
      proxy_cache_use_stale       => $proxy_cache_use_stale,
      proxy_cache_valid           => $proxy_cache_valid,
      proxy_method                => $proxy_method,
      proxy_http_version          => $proxy_http_version,
      proxy_set_header            => $proxy_set_header,
      proxy_hide_header           => $proxy_hide_header,
      proxy_pass_header           => $proxy_pass_header,
      proxy_ignore_header         => $proxy_ignore_header,
      proxy_cache_lock            => $proxy_cache_lock,
      proxy_set_body              => $proxy_set_body,
      proxy_cache_bypass          => $proxy_cache_bypass,
      proxy_no_cache              => $proxy_no_cache,
      proxy_buffering             => $proxy_buffering,
      proxy_request_buffering     => $proxy_request_buffering,
      proxy_busy_buffers_size     => $proxy_busy_buffers_size,
      proxy_max_temp_file_size    => $proxy_max_temp_file_size,
      fastcgi                     => $fastcgi,
      fastcgi_index               => $fastcgi_index,
      fastcgi_param               => $fastcgi_param,
      fastcgi_params              => $fastcgi_params,
      fastcgi_script              => $fastcgi_script,
      uwsgi                       => $uwsgi,
      uwsgi_params                => $uwsgi_params,
      uwsgi_read_timeout          => $uwsgi_read_timeout,
      try_files                   => $try_files,
      www_root                    => $www_root,
      autoindex                   => $autoindex,
      autoindex_exact_size        => $autoindex_exact_size,
      autoindex_format            => $autoindex_format,
      autoindex_localtime         => $autoindex_localtime,
      index_files                 => $index_files,
      location_custom_cfg         => $location_custom_cfg,
      location_cfg_prepend        => $location_cfg_prepend,
      location_cfg_append         => $location_cfg_append,
      location_custom_cfg_prepend => $location_custom_cfg_prepend,
      location_custom_cfg_append  => $location_custom_cfg_append,
      rewrite_rules               => $rewrite_rules,
      raw_prepend                 => $location_raw_prepend,
      raw_append                  => $location_raw_append,
      notify                      => Class['nginx::service'],
    }
    $root = undef
  } else {
    $root = $www_root
  }

  # Only try to manage these files if they're the default one (as you presumably
  # usually don't want the default template if you're using a custom file.

  if $fastcgi != undef and !defined(File[$fastcgi_params]) and $fastcgi_params == "${nginx::conf_dir}/fastcgi.conf" {
    file { $fastcgi_params:
      ensure  => file,
      mode    => $nginx::global_mode,
      content => template('nginx/server/fastcgi.conf.erb'),
    }
  }

  if $uwsgi != undef and !defined(File[$uwsgi_params]) and $uwsgi_params == "${nginx::conf_dir}/uwsgi_params" {
    file { $uwsgi_params:
      ensure  => file,
      mode    => $nginx::global_mode,
      content => template('nginx/server/uwsgi_params.erb'),
    }
  }

  if $ssl_redirect_only {
    concat::fragment { "${name_sanitized}-header":
      target  => $config_file,
      content => template('nginx/server/server_ssl_redirect.erb'),
      order   => '001',
    }
  }
  elsif $listen_port != $ssl_port {
    concat::fragment { "${name_sanitized}-header":
      target  => $config_file,
      content => template('nginx/server/server_header.erb'),
      order   => '001',
    }

    # Create a proper file close stub.
    concat::fragment { "${name_sanitized}-footer":
      target  => $config_file,
      content => template('nginx/server/server_footer.erb'),
      order   => '699',
    }
  }

  # Create SSL File Stubs if SSL is enabled
  if $ssl {
    # Access and error logs are named differently in ssl template

    if $ssl_key {
      $ssl_key_real = $ssl_key.flatten
      $ssl_key_real.each | $key | {
        File <| title == $key or path == $key |> {
          before => Concat::Fragment["${name_sanitized}-ssl-header"],
        }
      }
    }
    if $ssl_cert {
      $ssl_cert_real = $ssl_cert.flatten
      $ssl_cert_real.each | $cert | {
        File <| title == $cert or path == $cert |> {
          before => Concat::Fragment["${name_sanitized}-ssl-header"],
        }
      }
    }
    concat::fragment { "${name_sanitized}-ssl-header":
      target  => $config_file,
      content => template('nginx/server/server_ssl_header.erb'),
      order   => '700',
    }
    concat::fragment { "${name_sanitized}-ssl-footer":
      target  => $config_file,
      content => template('nginx/server/server_ssl_footer.erb'),
      order   => '999',
    }
  }

  unless $nginx::confd_only {
    file { "${name_sanitized}.conf symlink":
      ensure  => $server_symlink_ensure,
      path    => "${server_enable_dir}/${name_sanitized}.conf",
      target  => $config_file,
      require => [File[$server_dir], Concat[$config_file]],
      notify  => Class['nginx::service'],
    }
  }

  create_resources('::nginx::resource::map', $string_mappings)
  create_resources('::nginx::resource::geo', $geo_mappings)
  create_resources('::nginx::resource::location', $locations, {
      ensure   => $ensure,
      server   => $name_sanitized,
      ssl      => $ssl,
      ssl_only => $ssl_only,
  } + $locations_defaults)
}
