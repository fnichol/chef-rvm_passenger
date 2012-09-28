#
# Cookbook Name:: rvm_passenger
# Attributes:: default
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
#
# Copyright:: 2010, 2011, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# version will default to most current version from RubyGems, unless overriden
default['rvm_passenger']['version']      = nil

# rvm_ruby will default to "#{node['rvm']['default_ruby']}@passenger",
# unless overriden
default['rvm_passenger']['rvm_ruby']     = nil

case platform
when "suse"
  node.set['rvm_passenger']['common_pkgs']  = %w{libcurl-devel}
  node.set['rvm_passenger']['apache2_pkgs'] =
    %w{apache2-devel libapr1-devel libapr-util1-devel}
when "centos","redhat","fedora","scientific","amazon"
  if node['platform_version'].to_f < 6
    node.set['rvm_passenger']['common_pkgs']  = %w{libcurl-devel openssl-devl zlib-devel}
  else
    node.set['rvm_passenger']['common_pkgs']  = %w{curl-devel}
  end
  node.set['rvm_passenger']['apache2_pkgs'] =  %w{httpd-devel}
else
  node.set['rvm_passenger']['common_pkgs']  = %w{libcurl4-openssl-dev}
  node.set['rvm_passenger']['apache2_pkgs'] =
    %w{apache2-threaded-dev libapr1-dev libaprutil1-dev}
end

# Attributes for configuring the nginx http context/apache server context
# directives. These appear in passenger.conf in conf.d/ for nginx and 
# mods-enabled/ for apache. All values should be strings.

# These directives are only valid in the nginx http contenxt/apache server
# contexts. passenger_root and passenger_ruby are also valid here, but are
# derived/configured above.
default['rvm_passenger']['directives']['passenger_user_switching'] = nil
default['rvm_passenger']['directives']['passenger_default_user'] = nil
default['rvm_passenger']['directives']['passenger_default_group'] = nil
default['rvm_passenger']['directives']['passenger_max_pool_size'] = nil
default['rvm_passenger']['directives']['passenger_max_instances_per_app'] = nil
default['rvm_passenger']['directives']['passenger_pool_idle_time'] = nil
default['rvm_passenger']['directives']['passenger_log_level'] = nil
default['rvm_passenger']['directives']['passenger_debug_log_file'] = nil

# These directives are valid in the nginx http/apache server context
# but may be overriden in more granular contexts.
default['rvm_passenger']['directives']['passenger_spawn_method'] = nil
default['rvm_passenger']['directives']['passenger_enabled'] = nil
default['rvm_passenger']['directives']['passenger_base_uri'] = nil
default['rvm_passenger']['directives']['passenger_use_global_queue'] = nil
default['rvm_passenger']['directives']['passenger_ignore_client_abort'] = nil
default['rvm_passenger']['directives']['passenger_set_cgi_param'] = nil
default['rvm_passenger']['directives']['passenger_pass_header'] = nil
default['rvm_passenger']['directives']['passenger_buffer_response'] = nil
default['rvm_passenger']['directives']['passenger_buffer_size'] = nil
default['rvm_passenger']['directives']['passenger_buffers'] = nil
default['rvm_passenger']['directives']['passenger_busy_buffer_size'] = nil
default['rvm_passenger']['directives']['passenger_user'] = nil
default['rvm_passenger']['directives']['passenger_group'] = nil
default['rvm_passenger']['directives']['passenger_friendly_error_pages'] = nil
default['rvm_passenger']['directives']['passenger_min_instances'] = nil
default['rvm_passenger']['directives']['passenger_max_requests'] = nil
default['rvm_passenger']['directives']['passenger_memory_limit'] = nil
default['rvm_passenger']['directives']['passenger_per_start'] = nil
default['rvm_passenger']['directives']['rails_env'] = nil
default['rvm_passenger']['directives']['rails_framework_spawner_idle_time'] = nil
default['rvm_passenger']['directives']['rails_app_spawner_idle_time'] = nil
default['rvm_passenger']['directives']['rack_env'] = nil

# These directives are only valid for Phusion Passenger Enterprise Edition.
# The following are valid in the nginx/apache server context, but may be
# overriden in more granular contexts.
default['rvm_passenger']['directives']['passenger_rolling_restarts'] = nil
default['rvm_passenger']['directives']['passenger_resist_deployment_errors'] = nil
default['rvm_passenger']['directives']['passenger_debugger'] = nil
default['rvm_passenger']['directives']['passenger_max_instances'] = nil
default['rvm_passenger']['directives']['passenger_max_request_time'] = nil
