# Provide a simple gemspec so you can easily use your
# project in your rails apps through git.
Gem::Specification.new do |s|
  s.name        = "jasmine-stories"
  s.summary     = "Pain free coffeescript acceptance testing for Rails 3.1 using jasmine-species"
  s.description = "Full support for the Rails 3.1 asset pipeline when acceptance testing your coffeescript or javascript using jasmine"
  s.files       = `git ls-files`.split "\n"
  s.authors     = ["Dominik Guzei"]
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.add_dependency( 'haml' )
end
