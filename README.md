Jasmine Stories: Story driven development with Jasmine
===========

Utilizing [Jasmine](http://pivotal.github.com/jasmine/) with the addition 
of [Jasmine-species](http://rudylattae.github.com/jasmine-species/) and taking 
full advantage of the Rails 3.1 asset pipeline. jasmine-stories removes any 
excuse YOU have for not testing your out of control application.

This project rocks, is a shameless "fork" of 
[jasminerice](https://github.com/bradphelan/jasminerice) and uses the MIT-LICENSE.

Headless Testing
----------------

See [guard-jasmine](https://github.com/netzpirat/guard-jasmine) for details.

guard-jasmine is configured for jasminerice by default. You have to provide the
special url of jasmine-stories on the command line: 
`guard-jasmine -u http://127.0.0.1:8888/jasmine-stories`

Installation
------------

This is a gem specifically for Rails 3.1. Just include it in
your `Gemfile`:

```ruby
group :development, :test do
  gem "jasmine-stories"
end
```

The engine is automatically mounted into your application in the development
and test environments. If you'd like to change that behavior, you can
override the array `JasmineStories.environments` in an initializer.

Usage
-----

### CoffeeScripts

Create a file `spec/javascripts/stories.js.coffee` with the following content:

	#=require_tree ./stories

This pulls in all your specs from the `javascripts/stories` directory into Jasmine:

```bash
spec/javascripts/stories/*_story.js.coffee
spec/javascripts/stories/*_story.js
spec/javascripts/stories/*_story.js.erb
```

The Rails 3.1 asset pipeline using [Sprockets](https://github.com/sstephenson/sprockets)
and [Tilt](https://github.com/rtomayko/tilt) ensure conversion.

As well you can use the `#require` dependency mechanisms in your specs to
pull dependencies. Here's an example `spec/javascripts/foo.js.coffee`:

```coffeescript
#= require foo
#= require bar

feature "Requiring classes with sprockets", ->

  summary(
    'In order to use classes in my specs',
    'As a user',
    'I want to require them with sprockets'
  )

  scenario "Require foo and bar", ->
    
    foo = bar = null
    
    Given "I have required foo and bar", ->
      foo = new Foo()
      bar = new Bar()

    When "I tell foo to jump", ->
      foo.jump()

    Then "bar should have jumped too", ->
      (expect bar.jumped).toBe true
```

### Stylesheets

For including stylesheets in your specs, Jasminerice uses `spec/javascripts/spec.css`.
Use Sprockets directives to include the right css files:

```css
/*
 *= require application
 */
```

### Start server

Now start your server

```bash
rails s
```

Goto 

```bash
http://localhost:3000/jasmine-stories
```

and there are your acceptance tests.

Author
------

* Dominik Guzei (http://wizzart.at | http://nerdkitchen.org)
