# davidVagrant

davidVagrant is a practical workshop for building LAMP stacks using Vagrant VM Machines. The `Vagrantfile` contains all the instructions for building a Ubuntu Xenial machine (16.04) for configuring a Laravel 5.x fresh instance.

Also uses Chef for automating portable environments making it easier to scale and configure in a long term.

## Why VMs?

The software is moving fast. VM's are the most effective choice for cutting the hardware cost, along with easier setup, configuring and more when you don't have any than traditional physical hardware

  - It takes time to setup
  - More time is needed to download, install and deploy the necessary packages
  - Team working with different OS flavors and environments

## LAMP Stack

  LAMP stands for Linux, Apache2, MySql and PHP. Please refer to the `LAMP-SETUP.md` for this project.

## Difference with Docker

  - Docker is a container-based solution for delivering apps bundled with their infrastructure. Vagrant provides it
  - Docker big plus: requires less overhead on the system resources that virtualization based solutions
  - Docker uses the host system's kernel to do it's work -> Docker needs a similar Kernel configuration

  Both tools are very great, it's about preference, but you can also consider software requirements in order to make decisions

## Chef

Chef is a configuration Management System for automating Infrastructure operations. (building servers, configuring pre-requisites, installing and more)


## Chef - Vagrant Setup

By default, Chef uses a path for recipes (configuration scripts) `cookbooks`

   1. Edit the Vagrant file and make sure that the following line is present

   2. Now you need to inform Chef about the code that needs to be run, In the LAMP directory create a file called `default.rb` (instructions)

   3. In case of making changes, you will need to: `vagrant destroy` and `vagrant up` cycle

## Installation

Considering a full Vagrant installation, just `vagrant up` on the root directory

## SSHing on each Instance

  `vagrant ssh app` for the App

  `vagrant ssh db` for the DB server

## SH Script

In case you don't have to use Chef, you will have a `lamp.sh` file on the `scripts/` directory. Also, you'll need to comment or delete all the chef configuration along the `Vagrantfile`.

## Splitting (Multi-machine layers)

In Laravel (and other many projects) the web server and the DB server are present on the same Server. In a larger approach the more components, the more complexity will be naturally added in terms of performance

In production environments those services should not be on the same machine, they should be scattered on different nodes
for more scalability and enhanced performance

## Credits

 - [David E Lares](https://twitter.com/davidlares3)

## License

 - [MIT](https://opensource.org/licenses/MIT)
