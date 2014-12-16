Vagrant-Chef-LEMP
=================

A pluggable PHP technology stack for developing web site projects.  A basic project with a Vagrant
configuration with Chef provisioning for setting up a LEMP stack (Linux, nginx, MySQL, PHP).

## Purpose

This project uses Vagrant to encapsulate the technology stack for a PHP web application in a virtual
machine, for development. It uses Chef to automatically configure virtual machine instances, so that
both development and production virtual machine instances will be the product of source code, not
manual labor. This keeps the technology stack consistent and predictable, and it keeps all
developers on the exact same technology stack.  The beauty of Vagrant is that you run your code
using a stable technology stack running on a VM that is the product of source code, but you can edit
your code using your favorite native tools in your host OS.  You get the best of both worlds.

## Usage

Embed this project as a folder in your PHP project.  You might want to consider embedding it as a
Git submodule.  This project will share the ```..``` folder with the Vagrant VM as its
```/vagrant``` folder.  That's the document root for the nginx server, so the root of your PHP
project will be the root of the web server in the Vagrant VM.  You'll be able to access it at
```http://localhost:7777```.

## Provisioning

This project uses Chef to provision the Vagrant VM.  Specifically,
[chef-solo](https://docs.chef.io/chef_solo.html).  It would be simple to swap out this technology
stack configuration for another one that uses Docker or something else to configure the Vagrant VM.

## Development

To set up a development environment:

* Install [Git](http://git-scm.com/)
* Install [VirtualBox](https://www.virtualbox.org)
* Install [Vagrant](http://downloads.vagrantup.com/)
* Install the Vagrant-Omnibus plugin for Vagrant: ```vagrant plugin install vagrant-omnibus```
* Clone the project to your development system by opening a terminal and switching to the
folder on your machine where you want the code (suggestion: ```cd ~/projects```) and enter
this command: ```git clone git@github.com:VenueDriver/Vagrant-Chef-LEMP.git```.  If you can
```cd Vagrant-Chef-LEMP``` then it worked.
* Spin up your Vagrant virtual machine with ```vagrant up```.  Vagrant will automatically
download a virtual machine .iso file, create a new Virtual Box instance from it, and then
provision (configure) the virtual machine using Chef.  The end result will be a virtual
machine with the full LEMP technology stack, with this project's source code mapped
to a shared folder that can be accessed from your native tools in your host OS, and also
from the technology stack inside of the Vagrant virtual machine.
* You should now be able to access [http://localhost:7777/info.php](http://localhost:7777/info.php)
from your host OS to see PHP info.  The root of the web site is in ```/vagrant``` in the VM.
* SSH to the Vagrant VM with ```vagrant ssh```.
* Switch into this project's shared code folder with ```cd /vagrant```.  From your terminal,
you are now operating in a simulated production environment.

To start a development environment for future development sessions:

* From a terminal in your host OS: ```cd ~/projects/Vagrant-Chef-LEMP``` (or your project
  folder of choice)
* ```vagrant up``` Vagrant will use the existing VM instance and will not reconfigure it, so this
will take much less time than it did when you initially spun up the development VM.
* ```vagrant ssh```
* ```cd /vagrant```

## Structure

This project is designed to be embedded as a subfolder in a PHP project.  Possibly as a Git 
submodule.  In this example, the entire LEMP stack is stored in the ```vagrant/``` folder in the
PHP web app project.

    web app - The root folder for the PHP web app project.
     |-- info.php
     |-- index.html
     |-- robots.txt
     |-- wordpress/
     |-- etc...
     |-- vagrant - The root folder of this project, embedded as a subfolder in the web app project.
          |-- Vagrantfile - The configuration file for Vagrant
          |-- chef_cookbooks/ - Chef recipes for provisioning the Vagrant VM
          |-- .vagrant - Your actual Vagrant VM is stored here.  Ignored by Git.
          |-- .gitignore - Tells Git what to ignore.
