# sprout-chruby cookbook

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-chruby.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-chruby)

Manage chruby on OS X

## Usage

### Prerequisites

- [system ruby](.ruby-version)
- [bundler](http://bundler.io/)

### Quickstart

```
bundle
bundle exec soloist
```

## Cookbook Usage

### Attributes

*NOTE:* All preferences are namespaced under `sprout => chruby` they include:

* `['default_ruby']` &mdash; the default ruby version to use
* `['rubies']` &mdash; rubies to install

### Recipes

1. `sprout-chruby`
1. `sprout-chruby::chruby_auto`
1. `sprout-chruby::default_ruby`
1. `sprout-chruby::rubies`

## Contributing

### Before committing

```
bundle
bundle exec rake
```

The default rake task includes rubocop, foodcritic, unit specs

### [Rubocop](https://github.com/bbatsov/rubocop)

```
bundle
bundle exec rake rubocop
```

### [FoodCritic](http://acrmp.github.io/foodcritic/)

```
bundle
bundle exec rake foodcritic
```

### Unit specs

Unit specs use [ServerSpec](http://serverspec.org/)

```
bundle
bundle exec rake spec:unit
```

### Integration specs

Integrations specs will run the default recipe on the host system (destructive) and make assertions on the system after
install.

*Note:* It has a precondition that chruby is _not_ already installed on the system.

```
bundle
bundle exec rake spec:integration
```
