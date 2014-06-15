# demo-mcollective cookbook

Demo of an MCollective setup with Chef Server.

## Overview

To bring up a cluster with an MCollective Server, Chef Server and a node :

    rake

To run the tests:

    rake test

To start from scratch and try again:

    rake destroy

Access Chef web management UI via:

    https://172.18.1.6

with the username `vagrant` and password `vagrant`

To display the list of instance names:

    rake list

To login to an instance, use `kitchen login <instance_name`, such as:

    kitchen login mcollective-admin-centos65

## Prerequisites

2GB free memory for the instances:

* MCollective Admin Instance - 512MB
* Chef Server - 1.5GB
* Node managed by Chef - 512MB

Clone this repository:

    git clone https://github.com/misheska-cookbooks/demo-mcollective

Install the [Chef Development Kit](http://www.getchef.com/downloads/chef-dk) for your platform.

Install the following virtualization software:

    [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
    [Vagrant](https://www.vagrantup.com/downloads.html)

Rake Tasks
----------

List all the tasks with `rake -T`

- `rake converge`    # run cookbooks against instances
- `rake create`      # create instances
- `rake default`     # create cluster
- `rake destroy`     # destroy instances
- `rake list`        # list instances
- `rake spec`        # Run ChefSpec examples
- `rake style`       # Run all style checks
- `rake style:chef`  # Lint Chef cookbooks
- `rake style:ruby`  # Run Ruby style checks
- `rake test`        # serverspec tests
- `rake verify`      # verify instances

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

