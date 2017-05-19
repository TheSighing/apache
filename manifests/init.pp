class apache (
  $apachename   = $::apache::params::apachename,
) inherits ::apache::params {
  package { 'apache':
    name    => $apachename,
    ensure  => present,
  }

  file { 'configuration-file':
    path    => $conffile,
    ensure  => file,
    source  => $confsource,
  }

  service { 'apache-service':
    name          => $apachename,
    hasrestart    => true,
  }

}
