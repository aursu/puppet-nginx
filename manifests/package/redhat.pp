# Class: nginx::package::redhat
#
# This module manages NGINX package installation on RedHat based systems
#
# Parameters:
#
# There are no default parameters for this class.
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# This class file is not called directly
#
class nginx::package::redhat (
  Variant[Boolean, Enum['absent']] $sslverify = $nginx::yum_repo_sslverify,
) {
  $package_name             = $nginx::package_name
  $package_source           = $nginx::package_source
  $package_ensure           = $nginx::package_ensure
  $package_flavor           = $nginx::package_flavor
  $passenger_package_ensure = $nginx::passenger_package_ensure
  $passenger_package_name   = $nginx::passenger_package_name
  $manage_repo              = $nginx::manage_repo
  $purge_passenger_repo     = $nginx::purge_passenger_repo

  #Install the CentOS-specific packages on that OS, otherwise assume it's a RHEL
  #clone and provide the Red Hat-specific package. This comes into play when not
  #on RHEL or CentOS and $manage_repo is set manually to 'true'.
  $_os = $facts['os']['name'] ? {
    'centos'         => 'centos',
    'VirtuozzoLinux' => 'centos',
    default          => 'rhel'
  }

  if $manage_repo {
    exec { 'yum-clean-b114182':
      command     => 'yum clean all',
      path        => '/bin:/usr/bin',
      refreshonly => true,
    }

    case $package_source {
      'nginx', 'nginx-stable': {
        yumrepo { 'nginx-release':
          baseurl   => "https://nginx.org/packages/${_os}/${facts['os']['release']['major']}/\$basearch/",
          descr     => 'nginx repo',
          enabled   => '1',
          gpgcheck  => '1',
          priority  => '1',
          gpgkey    => 'https://nginx.org/keys/nginx_signing.key',
          sslverify => $sslverify,
          before    => Package['nginx'],
          notify    => Exec['yum-clean-b114182'],
        }

        if $purge_passenger_repo {
          yumrepo { 'passenger':
            ensure => absent,
            before => Package['nginx'],
            notify => Exec['yum-clean-b114182'],
          }
        }
      }
      'nginx-mainline': {
        yumrepo { 'nginx-release':
          baseurl   => "https://nginx.org/packages/mainline/${_os}/${facts['os']['release']['major']}/\$basearch/",
          descr     => 'nginx repo',
          enabled   => '1',
          gpgcheck  => '1',
          priority  => '1',
          gpgkey    => 'https://nginx.org/keys/nginx_signing.key',
          sslverify => $sslverify,
          before    => Package['nginx'],
          notify    => Exec['yum-clean-b114182'],
        }

        if $purge_passenger_repo {
          yumrepo { 'passenger':
            ensure => absent,
            before => Package['nginx'],
            notify => Exec['yum-clean-b114182'],
          }
        }
      }
      'passenger': {
        if ($facts['os']['name'] in ['RedHat', 'CentOS', 'VirtuozzoLinux']) and ($facts['os']['release']['major'] in ['6', '7']) {
          # 2019-11: Passenger changed their gpg key from: `https://packagecloud.io/phusion/passenger/gpgkey`
          # to: `https://oss-binaries.phusionpassenger.com/auto-software-signing-gpg-key.txt`
          # Find the latest key by opening: https://oss-binaries.phusionpassenger.com/yum/definitions/el-passenger.repo

          # Also note: Since 6.0.5 there are no nginx packages in the phusion EL7 repository, and nginx packages are expected to come from epel instead
          yumrepo { 'passenger':
            baseurl       => "https://oss-binaries.phusionpassenger.com/yum/passenger/el/${facts['os']['release']['major']}/\$basearch",
            descr         => 'passenger repo',
            enabled       => '1',
            gpgcheck      => '0',
            repo_gpgcheck => '0',
            priority      => '1',
            gpgkey        => 'https://oss-binaries.phusionpassenger.com/auto-software-signing-gpg-key.txt',
            before        => Package['nginx'],
            notify        => Exec['yum-clean-b114182'],
          }

          yumrepo { 'nginx-release':
            ensure => absent,
            before => Package['nginx'],
            notify => Exec['yum-clean-b114182'],
          }

          package { $passenger_package_name:
            ensure  => $passenger_package_ensure,
            require => Yumrepo['passenger'],
          }
        } else {
          fail("${facts['os']['name']} version ${facts['os']['release']['major']} is unsupported with \$package_source 'passenger'")
        }
      }
      'openresty': {
        # https://openresty.org/en/linux-packages.html
        yumrepo { 'openresty':
          baseurl             => "https://openresty.org/package/${_os}/\$releasever/\$basearch",
          descr               => "Official OpenResty Open Source Repository for ${facts['os']['name']}",
          skip_if_unavailable => '0',
          enabled             => '1',
          gpgcheck            => '1',
          repo_gpgcheck       => '0',
          gpgkey              => 'https://openresty.org/package/pubkey.gpg',
          sslverify           => $sslverify,
          before              => Package['nginx'],
          notify              => Exec['yum-clean-b114182'],
        }

        if $purge_passenger_repo {
          yumrepo { 'passenger':
            ensure => absent,
            before => Package['nginx'],
            notify => Exec['yum-clean-b114182'],
          }
        }
      }
      default: {
        fail("\$package_source must be 'nginx-stable', 'nginx-mainline', 'openresty' or 'passenger'. It was set to '${package_source}'")
      }
    }
  }

  package { 'nginx':
    ensure => $package_ensure,
    name   => $package_name,
  }
}
