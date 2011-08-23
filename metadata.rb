maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Installs and configures Passenger under RVM with Apache or nginx"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.8.1"

recipe "rvm_passenger",           "Installs Passenger gem with RVM"
recipe "rvm_passenger::apache2",  "Enables Apache module configuration for passenger under RVM"
recipe "rvm_passenger::nginx",    "Installs Passenger gem w/ RVM, and recompiles support into Nginx"

depends "rvm"
depends "nginx"
depends "apache2"

%w{ ubuntu debian suse }.each do |os|
  supports os
end
