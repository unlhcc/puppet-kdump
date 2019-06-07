#
# Class: kdump
#
# Manages /etc/kdump.conf but does not alter grub.conf (do that elsewhere)
#

class kdump (
    $path           = $kdump::params::path,
    $core_collector = $kdump::params::core_collector,
    $service_ensure = $kdump::params::service_ensure,
    $service_enable = $kdump::params::service_enable,
  ) inherits kdump::params {

    package { 'kexec-tools': ensure => present }

    file { '/etc/kdump.conf':
        require => Package['kexec-tools'],
        notify  => Service['kdump'],
        content => [ template('kdump/kdump.conf.erb'), ],
    }

    file { '/var/crash':
        ensure => 'directory',
        name   => $path,
    }

    service { 'kdump':
        ensure  => $service_ensure,
        enable  => $service_enable,
        require => [ Package['kexec-tools'], File['/var/crash'] ],
    }

}
