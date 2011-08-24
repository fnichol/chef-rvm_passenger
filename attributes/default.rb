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
default[:rvm_passenger][:version]     = nil

# rvm_ruby will default to "#{node['rvm']['default_ruby']}@passenger",
# unless overriden
default[:rvm_passenger][:rvm_ruby]    = nil

case platform
when "suse"
  node.set['rvm_passenger']['common_pkgs'] = %w{libcurl-devel}
else
  node.set['rvm_passenger']['common_pkgs'] = %w{libcurl4-openssl-dev}
end
