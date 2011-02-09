#
# Cookbook Name:: rvm_passenger
# Based on passenger_enterprise
# Recipe:: default
#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Author:: Joshua Sierles (<joshua@37signals.com>)
# Author:: Michael Hale (<mikehale@gmail.com>)
#
# Copyright:: 2009, Opscode, Inc
# Copyright:: 2009, 37signals
# Coprighty:: 2009, Michael Hale
# Copyright:: 2010, Fletcher Nichol
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

include_recipe "rvm"

package "libcurl4-openssl-dev"

# ensure rvm ruby is installed
rvm_ruby select_ruby(node[:rvm_passenger][:rvm_ruby])

# ensure gemset exists if given
if string_include_gemset?(node[:rvm_passenger][:rvm_ruby])
  rvm_gemset select_gemset(node[:rvm_passenger][:rvm_ruby]) do
    ruby_string   select_ruby(node[:rvm_passenger][:rvm_ruby])
  end
end

# install passenger gem
rvm_gem "passenger" do
  ruby node[:rvm_passenger][:rvm_ruby]
  version node[:rvm_passenger][:version]
end

# calculate rvm_passenger/root_path if not set
ruby_block "calculate rvm_passenger/root_path" do
  block do
    rvm_env = RVM::Environment.new
    rvm_env.use node[:rvm_passenger][:rvm_ruby]
    gem_home = rvm_env.info.first[1]["homes"]["gem"]

    node.set[:rvm_passenger][:root_path] =
      "#{gem_home}/gems/passenger-#{node[:rvm_passenger][:version]}"
  end
  only_if do
    node[:rvm_passenger][:root_path].nil?
  end
end

ruby_block "calculate rvm_passenger/ruby_wrapper" do
  block do
    rvm_env = RVM::Environment.new
    rvm_env.use node[:rvm_passenger][:rvm_ruby]
    gem_home = rvm_env.info.first[1]["homes"]["gem"]
    wrapper_home = gem_home.sub(/\/gems\//, "/wrappers/")

    node.set[:rvm_passenger][:ruby_wrapper] = "#{wrapper_home}/ruby"
  end
end
