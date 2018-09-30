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
    Started session at 2018-09-24 09:30:00 +0200
    > stopped last monday at 18:00
    Stopped session at 2018-09-24 18:00:00 +0200
    > started yesterday at 10:00
    Started session at 2018-09-29 10:00:00 +0200
    > stopped yesterday at 19:30
    Stopped session at 2018-09-29 19:30:00 +0200
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

Or run chronolog one command at a time:

    $ chronolog work.log started 30 minutes ago
    Started session at 2018-09-28 10:00:00 +0200

    $ chronolog work.log print
    Time logged for 2018-09-28
    Year:          18.30 hours
    Month:         18.30 hours
    Day:            0.30 hours
    Session:        0.30 hours

    $ chronolog work.log stop
    Stopped session at 2018-09-28 10:30:00 +0200

Everything is saved in plain text so you can also edit the file directly:

    $ date +'started at %s # plain text <3' >> work.log

    $ cat work.log
    started at 1537774200
    stopped at 1537804800
    started at 1538035200
    stopped at 1538069400
    started at 1538121600
    stopped at 1538123400
    started at 1538123410 # plain text <3


License
-------

Copyright (c) 2018 Vincent Ollivier. Released under MIT.
