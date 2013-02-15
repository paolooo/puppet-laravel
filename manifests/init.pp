class laravel {
  exec { 'download-laravel':
    cwd     => '/tmp',
    command => '/usr/bin/wget http://github.com/laravel/laravel/archive/develop.zip',
    creates => '/tmp/develop.zip'
  }
  
  exec { 'unzip-laravel':
    cwd     => '/tmp',
    command => "/usr/bin/unzip develop.zip && /bin/mv laravel-develop/* ${docroot}",
    require => [ Package['unzip'], Exec['download-laravel'] ]
  }

  file { "${docroot}":
    ensure  => 'directory'
  }

  $writeable_dirs = ["${docroot}/app/storage"]
  file { "${writeable_dirs}":
    ensure  => 'directory',
    recurse => true,
    mode    => '0777',
    require => File["${docroot}"]
  }

  # add .htaccess
  file { 'add-htaccess':
    path    => "${docroot}/public/.htaccess",
    content => template('laravel/.htaccess'),
    ensure  => file,
    require => [ Exec['unzip-laravel'] ]
  }
}
