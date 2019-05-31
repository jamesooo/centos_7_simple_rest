# description
A CentOS based vagrant box provisioned with Puppet which runs
[a simple weather api](https://github.com/jamesooo/weather-jamesooo)
## requirements:
to ease setting up virtualbox guest additions run the following
`vagrant plugin install vagrant-vbguest`
## usage:
run `vagrant up` and wait for the environment to bootstrap. 
once complete open [the application](http://localhost:8080/temperature) to get 
the current temperature in Portland.
