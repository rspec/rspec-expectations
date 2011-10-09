This is the source for http://rspec.info

## Prereqs

We're currently using webby, which runs fine on 1.8.7, so:

    rvm install 1.8.7
    rvm 1.8.7
    rvm gemset create @rspec-website

## Getting started

Once you have the prereqs:

    git clone git://github.com/rspec/rspec-website.git
    cd rspec-website
    gem install bundler
    bundle install
    webby autobuild

The last command will build the site in an output directory, fire up a server
and launch output/index.html in a browser.

## Editing

Edit pages in the `content` directory and then run `webby build`. If you have
`webby autobuild` running, it _should_ rebuild the page you just edited for you,
but it doesn't work 100% of the time.
