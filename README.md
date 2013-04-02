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

* `git submodule add https://github.com/paolooo/puppet-laravel.git extras/modules/laravel`

Or, if you're not using [vagrant-lamp](http://github.com/paolooo/vagrant-lamp) and just your git repo you can do the ff command.    

* `git submodule add https://github.com/paolooo/puppet-laravel.git modules/laravel`


#### Adding laravel to your manifest file

`$ vim puppet/manifests/init.pp`

At line 40, add the ff line:
`include laravel`



Bash Script
-----------

You can also use my bash script to download laravel 4 - https://gist.github.com/paolooo/5292362 - Check it out!
