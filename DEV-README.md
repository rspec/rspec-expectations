## Set up the dev environment

    git clone git://github.com/rspec/rspec-expectations.git
    cd rspec-expectations
    gem install bundler
    export USE_GIT_REPOS=1 # optional
    bundle install

Now you should be able to run any of:

    rake
    rake spec
    rake cucumber

Or, if you prefer to use the rspec and cucumber commands directly, you can either:

    bundle exec rspec

Or ...

    bundle install --binstubs
    bin/rspec

## Customize the dev enviroment

The Gemfile includes the gems you'll need to be able to run specs. If you want
to customize your dev enviroment with additional tools like guard or
ruby-debug, add any additional gem declarations to Gemfile-custom (see
Gemfile-custom.sample for some examples).

## Use gem dependencies from filesystem

To use rspec dependencies (rspec, rspec-core, rspec-mocks, or
rspec-support) from the filesystem, instead of from git,
omit the `USE_GIT_REPOS` above.
