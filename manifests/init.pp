class laravel_framework {
  exec { 'download-laravel':
    cwd     => '/tmp',
    command => '/usr/bin/wget http://www.github.com/laravel/laravel/archive/develop.zip',
    creates => '/tmp/download'
  }
  
  exec { 'unzip-laravel':
    cwd     => '/tmp',
    command => "/usr/bin/unzip laravel-develop && /bin/mv laravel-develop/* ${docroot}/public",
    require => [ Exec['download-laravel'] ]
  }

  file { ${docroot}:
    ensure  => 'directory'
  }

  $writeable_dirs = ["${docroot}/app/storage"]
  file { ${writeable_dirs}:
    ensure  => 'directory',
    recurse => true,
    mode    => '0777',
    require => File[${docroot}]
  }

  # add .htaccess
  file { 'add-htaccess':
    path    => "${docroot}/public/.htaccess",
    content => template('laravel/.htaccess'),
    ensure  => file,
    require => [ Exec['unzip-laravel'] ]
  }
}
