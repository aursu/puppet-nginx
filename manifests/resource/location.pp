# @summary Create a new location entry within a virtual host
#
# @param ensure
#   Enables or disables the specified location
#   (present|absent)
# @param internal
#   Indicates whether or not this location can be
#   used for internal requests only. Default: false
# @param server
#   Defines a server or list of servers that include this location
# @param location
#   Specifies the URI associated with this location
#   entry
# @param default_type
#   Defines the default MIME type of a response
# @param location_satisfy
#   Allows access if all (all) or at least one (any) of the auth modules allow access.
# @param location_allow
#   Locations to allow connections from.
# @param location_deny
#   Locations to deny connections from.
# @param www_root
#   Specifies the location on disk for files to be read from. Cannot be set in
#   conjunction with $proxy
# @param autoindex
#   Set it on 'on' to activate autoindex directory listing.
# @param autoindex_exact_size
#   Set it on 'on' or 'off' to activate/deactivate autoindex displaying exact
#   filesize, or rounded to kilobytes, megabytes and gigabytes.
# @param autoindex_format
#   Sets the format of a directory listing.
# @param autoindex_localtime
#   Specifies whether times in the directory listing should be output in the
#   local time zone or UTC.
# @param index_files
#   Default index files for NGINX to read when traversing a directory
# @param proxy
#   Proxy server(s) for a location to connect to.  Accepts a single value, can
#   be used in conjunction with nginx::resource::upstream
# @param proxy_redirect
#   sets the text, which must be changed in response-header "Location" and
#   "Refresh" in the response of the proxied server.
# @param proxy_read_timeout
#   Override the default the proxy read timeout value of 90 seconds
# @param proxy_connect_timeout
#   Override the default the proxy connect timeout value of 90 seconds
# @param proxy_send_timeout
#   Override the default the proxy send timeout
#   value of 90 seconds
# @param proxy_set_header
#   Array of server headers to set
# @param proxy_hide_header
#   Array of server headers to hide
# @param proxy_pass_header
#   Array of server headers to pass
# @param proxy_ignore_header
#   Array of server headers to ignore
# @param proxy_next_upstream
#   Specify cases a request should be passed to the next server in the upstream.
# @param fastcgi
#   location of fastcgi (host:port)
# @param fastcgi_param
#   Set additional custom fastcgi_params
# @param fastcgi_params
#   optional alternative fastcgi_params file to use
# @param fastcgi_script
#   optional SCRIPT_FILE parameter
# @param fastcgi_split_path
#   Allows settings of fastcgi_split_path_info so that you can split the
#   script_name and path_info via regex
# @param fastcgi_pass_header
#   Permits passing otherwise disabled header fields from a FastCGI server to a client.
# @param fastcgi_read_timeout
#   Defines a timeout for reading a response from the FastCGI server.
# @param fastcgi_connect_timeout
#   Defines a timeout for establishing a connection with a FastCGI server.
# @param fastcgi_send_timeout
#   Sets a timeout for transmitting a request to the FastCGI server# @param fastcgi_buffering*]    - Enables or disables buffering of responses from the FastCGI server.
# @param fastcgi_request_buffering
#   Enables or disables buffering of a client request body.
# @param uwsgi
#   location of uwsgi (host:port)
# @param uwsgi_param
#   Set additional custom uwsgi_params
# @param uwsgi_params
#   optional alternative uwsgi_params file to use
# @param uwsgi_read_timeout
#   optional value for uwsgi_read_timeout
# @param ssl
#   Indicates whether to setup SSL bindings for this location.
# @param ssl_only
#   Required if the SSL and normal server have the same port.
# @param location_alias
#   Path to be used as basis for serving requests for this location
# @param stub_status
#   If true it will point configure module stub_status to provide nginx stats
#   on location
# @param raw_prepend
#   A single string, or an array of strings to prepend to the location
#   directive (after custom_cfg directives). NOTE: YOU are responsible for a
#   semicolon on each line that requires one.
# @param raw_append
#   A single string, or an array of strings to append to the location directive
#   (after custom_cfg directives). NOTE: YOU are responsible for a semicolon on
#   each line that requires one.
# @param limit_zone
#   Apply a limit_req_zone to the location. Expects a string indicating a
#   previously defined limit_req_zone in the main nginx configuration
# @param location_custom_cfg
#   Expects a hash with custom directives, cannot be used with other location
#   types (proxy, fastcgi, root, or stub_status)
# @param location_cfg_prepend
#   Expects a hash with extra directives to put before anything else inside
#   location (used with all other types except custom_cfg)
# @param location_custom_cfg_prepend
#   Expects a array with extra directives to put before anything else inside
#   location (used with all other types except custom_cfg). Used for logical
#   structures such as if.
# @param location_custom_cfg_append
#   Expects a array with extra directives to put after anything else inside
#   location (used with all other types except custom_cfg). Used for logical
#   structures such as if.
# @param location_cfg_append
#   Expects a hash with extra directives to put
#   after everything else inside location (used with all other types except
#   custom_cfg)
# @param include
#   An array of files to include for this location
# @param try_files
#   An array of file locations to try
# @param proxy_cache
#   This directive sets name of zone for caching.  The same zone can be used in
#   multiple places.
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
#   If defined, overrides the HTTP method of the request to be passed to the
#   backend.
# @param proxy_http_version
#   Sets the proxy http version
# @param proxy_set_body
#   If defined, sets the body passed to the backend.
# @param proxy_buffering
#   If defined, sets the proxy_buffering to the passed value.
# @param proxy_request_buffering
#   If defined, sets the proxy_request_buffering to the passed value.
# @param proxy_max_temp_file_size
#   Sets the maximum size of the temporary buffer file.
# @param proxy_busy_buffers_size
#   Sets the total size of buffers that can be busy sending a response to the
#   client while the response is not yet fully read.
# @param absolute_redirect
#   Enables or disables the absolute redirect functionality of nginx
# @param auth_basic
#   This directive includes testing name and password with HTTP Basic
#   Authentication.
# @param auth_basic_user_file
#   This directive sets the htpasswd filename for the authentication realm.
# @param auth_request
#   This allows you to specify a custom auth endpoint
# @param priority
#   Location priority. User priority 401-499, 501-599. If the priority is
#   higher than the default priority (500), the location will be defined after
#   root, or before root.
# @param mp4
#   Indicates whether or not this loation can be
#   used for mp4 streaming. Default: false
# @param flv
#   Indicates whether or not this loation can be
#   used for flv streaming. Default: false
# @param expires
#   Setup expires time for locations content
# @param add_header
#   Adds headers to the location block.  If any are specified, locations will
#   no longer inherit headers from the parent server context
# @param error_pages
#   Hash: setup errors pages, hash key is the http code and hash value the page
# @param recursive_error_pages
#   Enables or disables doing several redirects using the error_page directive.
# @param gzip_static
#   Defines gzip_static, nginx default is off
# @param reset_timedout_connection
#   Enables or disables resetting timed out connections and connections closed
#   with the non-standard code 444.
#
# @example Simple example
#   nginx::resource::location { 'test2.local-bob':
#     ensure   => present,
#     www_root => '/var/www/bob',
#     location => '/bob',
#     server   => 'test2.local',
#   }
#
# @example Use one location in multiple servers
#   nginx::resource::location { 'test2.local-bob':
#     ensure   => present,
#     www_root => '/var/www/bob',
#     location => '/bob',
#     server   => ['test1.local','test2.local'],
#   }
#
# @example Custom config example to limit location on localhost, create a hash with any extra custom config you want.
#   $my_config = {
#     'access_log' => 'off',
#     'allow'      => '127.0.0.1',
#     'deny'       => 'all'
#   }
#   nginx::resource::location { 'test2.local-bob':
#     ensure              => present,
#     www_root            => '/var/www/bob',
#     location            => '/bob',
#     server              => 'test2.local',
#     location_cfg_append => $my_config,
#   }
#
# @example Add Custom fastcgi_params
#   nginx::resource::location { 'test2.local-bob':
#     ensure        => present,
#     www_root      => '/var/www/bob',
#     location      => '/bob',
#     server        => 'test2.local',
#     fastcgi_param => {
#        'APP_ENV'  => 'local',
#     }
#   }
#
# @example Add Custom uwsgi_params
#   nginx::resource::location { 'test2.local-bob':
#     ensure       => present,
#     www_root     => '/var/www/bob',
#     location     => '/bob',
#     server       => 'test2.local',
#     uwsgi_param  => {
#        'APP_ENV' => 'local',
#     }
#   }
#
define nginx::resource::location (
  Enum['present', 'absent'] $ensure                                = 'present',
  Boolean $internal                                                = false,
  String $location                                                 = $name,
  Variant[String[1],Array[String[1],1]] $server                    = undef,
  Optional[String] $www_root                                       = undef,
  Optional[String] $default_type                                   = undef, # 'text/plain'
  Optional[Nginx::Switch] $autoindex                               = undef,
  Optional[Array[String]] $index_files                             = [],
  Optional[Enum['on', 'off']] $autoindex_exact_size                = undef,
  Optional[Enum['html', 'xml', 'json', 'jsonp']] $autoindex_format = undef,
  Optional[Enum['on', 'off']] $autoindex_localtime                 = undef,
  Optional[String] $proxy                                          = undef,
  Optional[String] $proxy_redirect                                 = $nginx::proxy_redirect,
  Optional[Nginx::Time] $proxy_read_timeout                        = $nginx::proxy_read_timeout,
  Optional[Nginx::Time] $proxy_connect_timeout                     = $nginx::proxy_connect_timeout,
  Optional[Nginx::Time] $proxy_send_timeout                        = $nginx::proxy_send_timeout,
  Array $proxy_set_header                                          = $nginx::proxy_set_header,
  Array $proxy_hide_header                                         = $nginx::proxy_hide_header,
  Array $proxy_pass_header                                         = $nginx::proxy_pass_header,
  Array $proxy_ignore_header                                       = $nginx::proxy_ignore_header,
  Optional[String] $proxy_next_upstream                            = undef,
  Optional[String] $fastcgi                                        = undef,
  Optional[String] $fastcgi_index                                  = undef,
  Optional[Hash] $fastcgi_param                                    = undef,
  String $fastcgi_params                                           = "${nginx::conf_dir}/fastcgi.conf",
  Optional[String] $fastcgi_script                                 = undef,
  Optional[String] $fastcgi_split_path                             = undef,
  Optional[Array[String]] $fastcgi_pass_header                     = undef,
  Optional[Nginx::Time] $fastcgi_read_timeout                      = undef,
  Optional[Nginx::Time] $fastcgi_connect_timeout                   = undef,
  Optional[Nginx::Time] $fastcgi_send_timeout                      = undef,
  Optional[Nginx::Switch] $fastcgi_buffering                       = undef,
  Optional[Nginx::Switch] $fastcgi_request_buffering               = undef,
  Optional[String] $uwsgi                                          = undef,
  Optional[Hash] $uwsgi_param                                      = undef,
  String $uwsgi_params                                             = "${nginx::config::conf_dir}/uwsgi_params",
  Optional[Nginx::Time] $uwsgi_read_timeout                        = undef,
  Optional[Nginx::Time] $uwsgi_connect_timeout                     = undef,
  Optional[Nginx::Time] $uwsgi_send_timeout                        = undef,
  Optional[Nginx::Switch] $uwsgi_buffering                         = undef,
  Optional[Nginx::Switch] $uwsgi_request_buffering                 = undef,
  Boolean $ssl                                                     = false,
  Boolean $ssl_only                                                = false,
  Optional[String] $location_alias                                 = undef,
  Optional[String[1]] $limit_zone                                  = undef,
  Optional[Enum['any', 'all']] $location_satisfy                   = undef,
  Optional[Array] $location_allow                                  = undef,
  Optional[Array] $location_deny                                   = undef,
  Optional[Boolean] $stub_status                                   = undef,
  Optional[Variant[String, Array]] $raw_prepend                    = undef,
  Optional[Variant[String, Array]] $raw_append                     = undef,
  Optional[Hash] $location_custom_cfg                              = undef,
  Optional[Hash] $location_cfg_prepend                             = undef,
  Optional[Hash] $location_cfg_append                              = undef,
  Optional[Hash] $location_custom_cfg_prepend                      = undef,
  Optional[Hash] $location_custom_cfg_append                       = undef,
  Optional[Array] $include                                         = undef,
  Optional[Array] $try_files                                       = undef,
  Optional[String] $proxy_cache                                    = undef,
  Optional[String] $proxy_cache_key                                = undef,
  Optional[String] $proxy_cache_use_stale                          = undef,
  Optional[Enum['on', 'off']] $proxy_cache_lock                    = undef,
  Optional[Variant[Array, String]] $proxy_cache_valid              = undef,
  Optional[Variant[Array, String]] $proxy_cache_bypass             = undef,
  Optional[Variant[Array, String]] $proxy_no_cache                 = undef,
  Optional[String] $proxy_method                                   = undef,
  Optional[String] $proxy_http_version                             = undef,
  Optional[String] $proxy_set_body                                 = undef,
  Optional[Nginx::Switch] $proxy_buffering                         = undef,
  Optional[Enum['on', 'off']] $proxy_request_buffering             = undef,
  Optional[Nginx::Size] $proxy_max_temp_file_size                  = undef,
  Optional[Nginx::Size] $proxy_busy_buffers_size                   = undef,
  Optional[Enum['on', 'off']] $absolute_redirect                   = undef,
  Optional[String] $auth_basic                                     = undef,
  Optional[String] $auth_basic_user_file                           = undef,
  Optional[String] $auth_request                                   = undef,
  Optional[Nginx::Switch] $chunked_transfer_encoding               = undef, # 'on'
  Array $rewrite_rules                                             = [],
  Integer[401,599] $priority                                       = 500,
  Boolean $mp4                                                     = false,
  Boolean $flv                                                     = false,
  Optional[String] $expires                                        = undef,
  Optional[String] $return                                         = undef,
  Hash $add_header                                                 = {},
  Optional[Variant[
    String,
    Array[String],
    Hash[String, String]
  ]] $access_log                                                   = undef,
  Optional[String] $format_log                                     = undef, # 'combined'
  Optional[Variant[String, Array[String]]] $error_log              = undef,
  Nginx::ErrorLogSeverity $error_log_level                         = 'error',
  Optional[Hash] $error_pages                                      = undef,
  Optional[Nginx::Switch] $recursive_error_pages                   = undef, # 'off'
  Optional[
      Variant[
        Enum['always'],
        Nginx::Switch
      ]
  ] $gzip_static                                                   = undef,
  Optional[Nginx::Switch] $reset_timedout_connection               = undef,
) {
  if ! defined(Class['nginx']) {
    fail('You must include the nginx base class before using any defined resources')
  }

  $root_group = $nginx::root_group

  File {
    owner  => 'root',
    group  => $root_group,
    mode   => $nginx::global_mode,
    notify => Class['nginx::service'],
  }

  # # Shared Variables
  $ensure_real = $ensure ? {
    'absent' => absent,
    default  => file,
  }

  # Use proxy, fastcgi or uwsgi template if $proxy is defined, otherwise use directory template.
  # fastcgi_script is deprecated
  if ($fastcgi_script != undef) {
    warning('The $fastcgi_script parameter is deprecated; please use $fastcgi_param instead to define custom fastcgi_params!')
  }

  # Only try to manage these files if they're the default one (as you presumably
  # usually don't want the default template if you're using a custom file.

  if (
    $ensure == 'present'            and
    $fastcgi != undef               and
    !defined(File[$fastcgi_params]) and
    $fastcgi_params == "${nginx::conf_dir}/fastcgi.conf"
  ) {
    file { $fastcgi_params:
      ensure  => 'file',
      mode    => $nginx::global_mode,
      content => template($nginx::fastcgi_conf_template),
      tag     => 'nginx_config_file',
    }
  }

  if $ensure == 'present' and $uwsgi != undef and !defined(File[$uwsgi_params]) and $uwsgi_params == "${nginx::conf_dir}/uwsgi_params" {
    file { $uwsgi_params:
      ensure  => 'file',
      mode    => $nginx::global_mode,
      content => template($nginx::uwsgi_params_template),
      tag     => 'nginx_config_file',
    }
  }

  any2array($server).each |$s| {
    $server_sanitized = regsubst($s, ' ', '_', 'G')
    if $nginx::confd_only {
      $server_dir = "${nginx::conf_dir}/conf.d"
    } else {
      $server_dir = "${nginx::conf_dir}/sites-available"
    }

    $config_file = "${server_dir}/${server_sanitized}.conf"
    if $ensure == 'present' {
      ## Create stubs for server File Fragment Pattern
      $location_md5 = md5($location)
      if ($ssl_only != true) {
        concat::fragment { "${server_sanitized}-${priority}-${location_md5}":
          target  => $config_file,
          content => template('nginx/server/location.erb'),
          order   => $priority,
        }
      }

      ## Only create SSL Specific locations if $ssl is true.
      if ($ssl == true or $ssl_only == true) {
        $ssl_priority = $priority + 300

        concat::fragment { "${server_sanitized}-${ssl_priority}-${location_md5}-ssl":
          target  => $config_file,
          content => template('nginx/server/location.erb'),
          order   => $ssl_priority,
        }
      }
    }
  }
}
