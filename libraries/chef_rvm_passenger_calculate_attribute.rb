#
# Cookbook Name:: rvm_passenger
# Library:: Chef::RVMPassenger::CalculateAttribute
#
# Author:: Fletcher Nichol <fnichol@nichol.ca>
#
# Copyright 2012, Fletcher Nichol
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

class Chef
  module RVMPassenger
    class CalculateAttribute
      def initialize(node)
        @node = node
      end

      def for_root_path
        gem_home = rvm_env.info.first[1]['homes']['gem']
        result = "#{gem_home}/gems/passenger-#{passenger_version}"

        node.set['rvm_passenger']['root_path'] = result
        Chef::Log.debug(%{Setting node['rvm_passenger']['root_path'] = } +
          %{"#{node['rvm_passenger']['root_path']}"})

        # NOTE: Warning, vicious hack! A not_if shell block gets interpolated
        # at compile time and there was no other found way to delay eval
        # until execution time. Here's a low level way: write a file, then
        # read it out when you need it. I feel sick to my stomach. Somwhere a
        # kitten is getting clubbed.
        ::File.open("/tmp/passenger_root_path", 'w') { |f| f.write(result) }
      end

      def for_ruby_wrapper
        gem_home = rvm_env.info.first[1]['homes']['gem']
        wrapper_home = gem_home.sub(/\/gems\//, '/wrappers/')
        result = "#{wrapper_home}/ruby"

        node.set['rvm_passenger']['ruby_wrapper'] = result
        Chef::Log.debug(%{Setting node['rvm_passenger']['ruby_wrapper'] = } +
          %{"#{node['rvm_passenger']['ruby_wrapper']}"})
      end

      private

      attr_reader :node

      def rvm_env
        @rvm_env ||= begin
          rvm_env = ::RVM::Environment.new
          rvm_env.use rvm_ruby
          rvm_env
        end
      end

      def rvm_ruby
        node['rvm_passenger']['rvm_ruby']
      end

      def passenger_version
        node['rvm_passenger']['version']
      end
    end
  end
end
