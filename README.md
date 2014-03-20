Undo
==========
[![Build Status](https://travis-ci.org/AlexParamonov/undo-storage-rails_cache.png?branch=master)](https://travis-ci.org/AlexParamonov/undo-storage-rails_cache)
[![Coverage Status](https://coveralls.io/repos/AlexParamonov/undo-storage-rails_cache/badge.png?branch=master)](https://coveralls.io/r/AlexParamonov/undo-storage-rails_cache?branch=master)
[![Code Climate](https://codeclimate.com/github/AlexParamonov/undo-storage-rails_cache.png)](https://codeclimate.com/github/AlexParamonov/undo-storage-rails_cache)
[![Gemnasium Build Status](https://gemnasium.com/AlexParamonov/undo-storage-rails_cache.png)](http://gemnasium.com/AlexParamonov/undo-storage-rails_cache)
[![Gem Version](https://badge.fury.io/rb/undo-storage-rails_cache.png)](http://badge.fury.io/rb/undo-storage-rails_cache)

Rails.cache adapter for [Undo gem](https://github.com/AlexParamonov/undo).
Designed to be used with Rails cache, but it can be used with any
similarly quaking cache store. Rails constant may not even be defined.

Contents
---------
1. Installation
1. Usage
1. Requirements
1. Contacts
1. Compatibility
1. Contributing
1. Copyright

Installation
------------

Add this line to your application's Gemfile:

    gem 'undo-storage-rails_cache'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install undo-storage-rails_cache


Usage
-----

    Undo.configure do |config|
      config.storage = Undo::Storage::RailsCache.new
    end

Default options will applied on each call to cache storage:

    Undo.configure do |config|
      config.storage = Undo::Storage::RailsCache.new(expires_in: 1.hour)
    end

As any Undo storage it gets argument bypassed from #store, #restore and #wrap:

    Undo.store object, expires_in: 1.minute


Requirements
------------
1. Ruby 1.9 or above

Contacts
--------
Have questions or recommendations? Contact me via `alexander.n.paramonov@gmail.com`  
Found a bug or have enhancement request? You are welcome at [Github bugtracker](https://github.com/AlexParamonov/undo-storage-rails_cache/issues)


Compatibility
-------------
tested with Ruby

* 2.1
* 2.0
* 1.9.3
* ruby-head
* rbx
* jruby-19mode
* jruby-head

See [build history](http://travis-ci.org/#!/AlexParamonov/undo-storage-rails_cache/builds)


## Contributing

1. [Fork repository](http://github.com/AlexParamonov/undo-storage-rails_cache/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Copyright
---------
Copyright © 2014 Alexander Paramonov.
Released under the MIT License. See the LICENSE file for further details.
