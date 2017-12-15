$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sancho/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sancho"
  s.version     = Sancho::VERSION
  s.authors     = ["Iwan Buetti"]
  s.email       = ["iwan.buetti@gmail.com"]
  s.homepage    = "https://github.com/iwan/sancho"
  s.summary     = "Collection of reusables classes and modules"
  s.description = "Description of Sancho."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.10"
  s.add_dependency "jquery-rails"
  s.add_dependency "turbolinks"

  s.add_dependency 'i18n-tasks', '~> 0.9.19' # fetch missing translations https://github.com/glebm/i18n-tasks
  s.add_dependency "google-translate", "~> 1.1.3"
  s.add_dependency "haml-rails"
  s.add_dependency "font-awesome-rails"
  # s.add_dependency "jquery-turbolinks" # you have to require 'jquery-turbolinks' in target Gemfile
end
