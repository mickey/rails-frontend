# Rails Frontend

Build a static frontend app with rails.  

## Why ?

This was built after experiencing some frustrations with a 400 lines Gruntfile.
I wanted a framework to build static website with the following requirements:

- templating
- preprocessors
- minifying
- can build a static website
- dependency management
- live reload

It appears Rails has most of this, a lot of goodies and it's very mature.
A few parts were missing:

- build a static website: I added this via a simple rake task doing a `wget` (:trollface:)
- dependency management:
  - Rails comes with bundler
  - I added bower support to easily handle javascript/css dependencies (it's integrated into the rails assets pipeline)
- live reload: I added guard in the Gemfile and a basic Guardfile to handle most of my use cases.

I gave a talk about this at Paris.rb and will link to the slides ASAP.

## Requirements

`bower`: To install it please go to the bower [homepage](http://bower.io).

`wget`: To install:  

- Ubuntu: installed by default
- Archlinux: should be installed if not `pacman -S wget`
- OSX: `brew install wget`

## Overview

To generate a new rails-frontend app:

```
gem install rails-frontend
rails-frontend new webapp
```

To launch a development server with LiveReload:

```
guard start
```

To build the static website:

```
rake dist
```

Your website, including all assets will be copied in `dist/`.

## You should know

This is a prototype coded for a talk I gave at paris.rb.
If you're ~~crazy~~ adventurous enough to test this, please take the tiem to give me some feedback.

## Contributing to rails-frontend
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2014 Michael Bensoussan. See LICENSE.txt for
further details.

