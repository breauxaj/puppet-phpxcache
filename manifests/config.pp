define phpxcache::config (
  $value
) {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-xcache' ],
  }

  $key = $title

  $context = '/files/etc/php.d/xcache.ini'

  augeas { "xcache_ini/${key}":
    context => $context,
    onlyif  => "get ${key} != '${value}'",
    changes => "set ${key} '${value}'",
    require => Package[$required],
  }

}
