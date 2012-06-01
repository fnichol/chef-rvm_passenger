## 0.8.3 (unreleased)


## 0.8.2 (May 31, 2012)

### Bug fixes

* Fix nginx/passenger module compilation. ([@brodock][], [@sutto][])

### New features

* By default, cookbook now finds most current version of passenger gem. ([@fnichol][])
* By default, rvm\_ruby is now "#{node['rvm']['default_ruby']}/@passenger". ([@fnichol][])
* Add support for CentOS 5/6. ([@daveespo][])

### Improvements

* Various recipe code refactorings. ([@fnichol][])
* Add Travis CI support for foodcritic. ([@fnichol][])
* Makes recipe compatible with apache2 cookbook's new pattern. ([@daveespo][])
* Update README formatting. ([@fnichol][])
* Add installation instructions to README. ([@fnichol][])
* README typo fix (thank you spelling bot). ([@holdensmagicalunicorn][])


## 0.8.0 (August 16, 2011)

The initial release.

[@brodock]: https://github.com/brodock
[@daveespo]: https://github.com/daveespo
[@holdensmagicalunicorn]: https://github.com/holdensmagicalunicorn
[@fnichol]: https://github.com/fnichol
[@sutto]: https://github.com/sutto
