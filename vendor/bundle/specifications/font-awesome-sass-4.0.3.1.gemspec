# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "font-awesome-sass"
  s.version = "4.0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Travis Chase"]
  s.date = "2014-03-03"
  s.description = "Font-Awesome SASS gem for use in Ruby projects"
  s.email = ["travis@travischase.me"]
  s.homepage = "https://github.com/FortAwesome/font-awesome-sass"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Font-Awesome SASS"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<sass-rails>, [">= 0"])
      s.add_development_dependency(%q<compass>, [">= 0"])
      s.add_runtime_dependency(%q<sass>, ["~> 3.2"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<sass-rails>, [">= 0"])
      s.add_dependency(%q<compass>, [">= 0"])
      s.add_dependency(%q<sass>, ["~> 3.2"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<sass-rails>, [">= 0"])
    s.add_dependency(%q<compass>, [">= 0"])
    s.add_dependency(%q<sass>, ["~> 3.2"])
  end
end
