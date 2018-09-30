Chronolog
=========

[![Gem](https://img.shields.io/gem/v/chronolog.svg)](https://rubygems.org/gems/chronolog)

Chronolog is a CLI for logging time in plain text files.

Installation
------------

Get it from RubyGems:

    $ gem install chronolog

Or build it from GitHub:

    $ git clone git://github.com/vinc/chronolog.git
    $ cd chronolog
    $ gem build chronolog.gemspec
    $ gem install chronolog-*.gem


Usage
-----

Run Chronolog in interactive mode:

    $ chronolog work.log
    > started last monday at 09:30
    > stopped last monday at 18:00
    > started yesterday at 10:00
    > stopped yesterday at 19:30
    > print last monday
    Time logged for 2018-09-24
    Year:          18.00 hours
    Month:         18.00 hours
    Day:            8.50 hours
    > print yesterday
    Time logged for 2018-09-27
    Year:          18.00 hours
    Month:         18.00 hours
    Day:            9.50 hours
    > quit

Run chronolog one command at a time:

    $ chronolog work.log start

Another example (half an hour later):

    $ chronolog work.log print
    Time logged for 2018-09-28
    Year:          18.30 hours
    Month:         18.30 hours
    Day:            0.30 hours
    Session:        0.30 hours

And everything is saved in plain text:

    $ date +"stopped at %s # plain text <3" >> work.log
    $ cat work.log
    started at 1537774200
    stopped at 1537804800
    started at 1538035200
    stopped at 1538069400
    started at 1538121600
    stopped at 1538123400 # plain text <3


License
-------

Copyright (c) 2018 Vincent Ollivier. Released under MIT.
