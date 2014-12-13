Wordpress-Development
=====================

A starting point for public-facing web site projects.  A basic project with a
Vagrant VM configuration and Chef recipes for provisioning a Wordpress
development environment.

## Development

This project uses Vagrant for running the code in a virtual machine during development. It uses Chef
to automatically configure virtual machine instances, so that both development and production
virtual machine instances will be the product of source code, not manual labor. This keeps the
technology stack consistent and predictable, and it keeps all developers on the exact same
technology stack.

To set up a development environment:

* Install [Git](http://git-scm.com/)
* Install [VirtualBox](https://www.virtualbox.org)
* Install [Vagrant](http://downloads.vagrantup.com/)
* Install the Vagrant-Omnibus plugin for Vagrant: ```vagrant plugin install vagrant-omnibus```
* Clone the project to your development system by opening a terminal and switching to the
folder on your machine where you want the code (suggestion: ```cd ~/projects```) and enter
this command: ```git clone git@github.com:VenueDriver/Wordpress-Development.git```.  If you can
```cd Wordpress-Development``` then it worked.
* Spin up your Vagrant virtual machine with ```vagrant up```.  Vagrant will automatically
download a virtual machine .iso file, create a new Virtual Box instance from it, and then
provision (configure) the virtual machine using Chef.  The end result will be a virtual
machine with the full prinsto.com technology stack, with this project's source code mapped
to a shared folder that can be accessed from your native tools in your host OS, and also
from the technology stack inside of the Vagrant virtual machine.
* SSH to the Vagrant VM with ```vagrant ssh```.
* Switch into this project's shared code folder with ```cd /vagrant```.  From your terminal,
you are now operating in a simulated production environment.  If you run a Rake task or start
a Rails server then you will be using the technology stack that Chef created for you.

To start a development environment for future development sessions:

* From a terminal in your host OS: ```cd ~/projects/Wordpress-Development``` (or your project
  folder of choice)
* ```vagrant up``` Vagrant will use the existing VM instance and will not reconfigure it, so this
will take much less time than it did when you initially spun up the development VM.
* ```vagrant ssh```
* ```cd /vagrant```
