## Set up the dev environment

```shell
git clone https://github.com/rspec/rspec-expectations.git
cd rspec-expectations
gem install bundler
bundle install
```

Now you should be able to run any of:

```shell
rake
rake spec
rake cucumber
```

Or, if you prefer to use the rspec and cucumber commands directly, you can either:

```shell
bundle exec rspec
```

Or ...

```shell
bundle install --binstubs
bin/rspec
```

## Customize the dev environment

The Gemfile includes the gems you'll need to be able to run specs. If you want
to customize your dev environment with additional tools like guard or
ruby-debug, add any additional gem declarations to Gemfile-custom (see
Gemfile-custom.sample for some examples).
