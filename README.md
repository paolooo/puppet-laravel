Puppet Module Laravel
=====================
by Nino Paolo Amarillento

Puppet Module for the latest version of Laravel - PHP Framework.

As of Feb 15, 2013 - this will download <strong>Laravel 4</strong>


Installation
------------

I assumed that you have Vagrant environment already, or if you don't have one yet, you can download and run [vagrant-lamp](https://github.com/paolooo/vagrant-lamp).
    
    
<b>On git root or toplevel directory</b> run the following.  

If you are using my [vagrant-lamp](http://github.com/paolooo/vagrant-lamp)    

* `cd puppet`   
* `git submodule add https://github.com/paolooo/puppet-laravel.git modules/laravel`

Or, using `-f`

* `git submodule add -f https://github.com/paolooo/puppet-laravel.git puppet/modules/laravel`
    
Or, if you're not using [vagrant-lamp](http://github.com/paolooo/vagrant-lamp) and just your git repo you can do the ff command.    

* `git submodule add https://github.com/paolooo/puppet-laravel.git puppet/modules/laravel`
