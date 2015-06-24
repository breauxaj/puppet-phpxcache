class phpxcache {
  $required = $::operatingsystem ? {
    /(?i-mx:centos|fedora|redhat|scientific)/ => [ 'php-xcache' ],
  }

  package { $required:
    ensure  => latest,
  }

}
