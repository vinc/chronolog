Chronolog
=========

[![Gem](https://img.shields.io/gem/v/chronolog.svg)](https://rubygems.org/gems/chronolog)


Install
-------

Get it from RubyGems:

    $ gem install chronolog

Or build it from GitHub:

    $ git clone git://github.com/vinc/chronolog.git
    $ cd chronolog
    $ gem build chronolog.gemspec
    $ gem install chronolog-*.gem


Usage
-----

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

    $ chronolog work.log start

    $ chronolog work.log print
    Time logged for 2018-09-28
    Year:          18.30 hours
    Month:         18.30 hours
    Day:            0.30 hours
    Session:        0.30 hours


License
-------

Copyright (c) 2018 Vincent Ollivier. Released under MIT.
