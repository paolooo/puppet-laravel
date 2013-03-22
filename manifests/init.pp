class laravel (
  $root = $docroot
) {
  
  #package { "unzip" : ensure => 'installed' }

  file { "${root}":
    ensure  => 'directory'
  }

  exec { 'download-laravel':
    cwd     => '/tmp',
    command => '/usr/bin/wget http://github.com/laravel/laravel/archive/develop.zip',
    creates => '/tmp/develop.zip'
  }

  
  exec { 'unzip-laravel':
    cwd     => '/tmp',
    command => "/usr/bin/unzip develop.zip && /bin/cp -R laravel-develop/* ${root} && /bin/rm -rf develop.zip laravel-develop",
    require => [ File["${root}"], Package['unzip'], Exec['download-laravel'] ]
  }


  $writeable_dirs = ["${root}/app/storage"]
  file { "${writeable_dirs}":
    ensure  => 'directory',
    recurse => true,
    mode    => '0777',
    require => [ Exec["unzip-laravel"], File["${root}"] ]
  }

  exec { 'run-composer-installation':
    cwd     => "${root}",
    command => "composer install",
    require => [ File["/usr/local/bin/composer"], Exec["unzip-laravel"], File["${root}"] ]
  }

  # add .htaccess
  file { 'add-htaccess':
    path    => "${root}/public/.htaccess",
    content => template('laravel/.htaccess'),
    ensure  => file,
    require => [ Exec["run-composer-installation"], ]
  }
}
