maintainer       "Opscode, Inc."
maintainer_email "ops@opscode.com"
license          "Apache 2.0"
description      "Installs and configures Passenger under RVM with Apache or nginx"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.5.0"

recipe "rvm_passenger", "Installs Passenger gem with RVM"
recipe "rvm_passenger::apache2", "Enables Apache module configuration for passenger under RVM"
recipe "rvm_passenger::nginx", "Installs Passenger gem w/ RVM, and recompiles support into Nginx"

%w{ rvm nginx apache2 }.each do |cb|
  depends cb
end

%w{ ubuntu }.each do |os|
  supports os
end

attribute "rvm_passenger/version",
  :display_name => "Version of passenger",
  :description => "The version of passenger to deploy. This will be in a format used by the gem command.",
  :default => "3.0.0"

attribute "rvm_passenger/rvm_ruby",
  :display_name => "RVM ruby to use",
  :description => "The RVM ruby (and optional gemset) under which to install the passenger gem. This will be in a format used by the rvm command.",
  :default => "ree-1.8.7-2010.02"

attribute "rvm_passenger/root_path",
  :display_name => "Root path to passenger gem",
  :description => "The full path to the root of the installed passenger gem.",
  :default => "/usr/local/rvm/gems/ree-1.8.7-2010.02/gems/passenger-3.0.0"

attribute "rvm_passenger/module_path",
  :display_name => "Path to mod_passenger.so",
  :description => "The full path to the Apache2 module.",
  :default => "/usr/local/rvm/gems/ree-1.8.7-2010.02/gems/passenger-3.0.0/ext/apache2/mod_passenger.so"

