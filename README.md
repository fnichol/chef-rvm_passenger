# <a name="title"></a> chef-rvm_passenger [![Build Status](https://secure.travis-ci.org/fnichol/chef-rvm_passenger.png?branch=master)](http://travis-ci.org/fnichol/chef-rvm_passenger)

## <a name="description"></a> Description

Installs passenger gem via RVM and configures Apache or Nginx.

## <a name="usage"></a> Usage

Comming soon...

## <a name="requirements"></a> Requirements

### <a name="requirements-chef"></a> Chef

Tested on 0.9.18, 0.10.2 and 0.10.4 but newer and older version should work
just fine. File an [issue][issues] if this isn't the case.

### <a name="requirements-platform"></a> Platform

The following platforms have been tested with this cookbook, meaning that
the recipes run on these platforms without error:

* ubuntu (10.04/10.10/11.04)
* debian (6.0)
* suse
* centos (5/6)
* redhat (5/6)

Please [report][issues] any additional platforms so they can be added.

### <a name="requirements-cookbooks"></a> Cookbooks

This cookbook depends on the following external cookbooks:

* [rvm][rvm_cb]
* [nginx][nginx_cb] (Opscode)
* [apache2][apache2_cb] (Opscode)

## <a name="installation"></a> Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

### <a name="installation-librarian"></a> Using Librarian

[Librarian-Chef][librarian] is a bundler for your Chef cookbooks.
Include a reference to the cookbook in a [Cheffile][cheffile] and run
`librarian-chef install`. To install Librarian-Chef:

    gem install librarian
    cd chef-repo
    librarian-chef init

To reference the Git version:

    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'rvm_passenger',
      :git => 'https://github.com/fnichol/chef-rvm_passenger', :ref => 'v0.8.2'
    END_OF_CHEFFILE
    librarian-chef install

### <a name="installation-kgc"></a> Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-rvm_passenger/v0.8.2

### <a name="installation-tarball"></a> As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-rvm_passenger/tarball/v0.8.2 | tar xfz - && \
      mv fnichol-chef-rvm_passenger-* rvm_passenger

### <a name="installation-gitsubmodule"></a> As a Git Submodule

A dated practice (which is discouraged) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-rvm_passenger.git cookbooks/rvm_passenger
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

### <a name="installation-platform"></a> From the Opscode Community Platform

This cookbook is not currently available on the site as it relies on a cookbook
([rvm][rvm_cb]) not available on the community site.

## <a name="recipes"></a> Recipes

### <a name="recipes-default"></a> default

Installs dependencies and contains helpers for other recipes.

### <a name="recipes-apache2"></a> apache2

Installs passenger as an apache2 module. Requires the `apache2` recipe.

### <a name="recipes-nginx"></a> nginx

Installs passenger as an nginx module. Requires the `nginx::source` recipe.

## <a name="attributes"></a> Attributes

### <a name="attributes-version"></a> version

The version of passenger to deploy. This will be in a format used by the gem
command. For example:

    node['rvm_passenger']['version'] = "3.0.8"

Default is the most current version which is queried dynamically from RubyGems.

### <a name="attributes-rvm-ruby"></a> rvm_ruby

The RVM ruby (and optional gemset) under which to install the passenger gem.
For example:

    node['rvm_passenger']['rvm_ruby'] = "ruby-1.8.7-p352@passenger"

Default is the default RVM Ruby in a gemset called "passenger", i.e.
`"#{node['rvm']['default_rvm']}@passenger"`.

### <a name="attributes-root-path"></a> root_path

Optionally override the full path to the root of the installed passenger gem.

### <a name="attributes-module-path"></a> module_path

Optionallly override the full path to the Apache2 module.

## <a name="lwrps"></a> Resources and Providers

There are **no** resources or providers defined.

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

## <a name="license"></a> License and Author

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Contributors:: https://github.com/fnichol/chef-rvm_passenger/contributors

Copyright:: 2010, 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[apache2_cb]:   http://community.opscode.com/cookbooks/apache2
[chef_repo]:    https://github.com/opscode/chef-repo
[kgc]:          https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:    https://github.com/applicationsonline/librarian#readme
[nginx_cb]:     http://community.opscode.com/cookbooks/nginx
[rvm_cb]:       https://github.com/fnichol/chef-rvm

[repo]:         https://github.com/fnichol/chef-rvm_passenger
[issues]:       https://github.com/fnichol/chef-rvm_passenger/issues
