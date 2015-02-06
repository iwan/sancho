# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "thread"
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["meh."]
  s.date = "2013-11-19"
  s.description = "Includes a thread pool, message passing capabilities, a recursive mutex, promise, future and delay."
  s.email = "meh@schizofreni.co"
  s.homepage = "http://github.com/meh/ruby-thread"
  s.licenses = ["WTFPL"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Various extensions to the base thread library."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
