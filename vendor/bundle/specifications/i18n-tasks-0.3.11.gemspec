# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "i18n-tasks"
  s.version = "0.3.11"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "issue_tracker" => "https://github.com/glebm/i18n-tasks" } if s.respond_to? :metadata=
  s.authors = ["glebm"]
  s.date = "2014-04-20"
  s.description = "\ni18n-tasks finds and manages missing and unused translations in your application.\n\nIt scans calls such as `I18n.t('some.key')` and provides reports on key usage, missing, and unused keys.\nIt can also can pre-fill missing keys, including from Google Translate, and it can remove unused keys as well.\n"
  s.email = ["glex.spb@gmail.com"]
  s.executables = ["i18n-tasks"]
  s.files = ["bin/i18n-tasks"]
  s.homepage = "https://github.com/glebm/i18n-tasks"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Manage translations in ruby applications with the awesome power of static analysis \u{2014} Edit"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<erubis>, [">= 0"])
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<easy_translate>, [">= 0.4.0"])
      s.add_runtime_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_runtime_dependency(%q<terminal-table>, [">= 0"])
      s.add_runtime_dependency(%q<highline>, [">= 0"])
      s.add_runtime_dependency(%q<slop>, [">= 3.4.7"])
      s.add_development_dependency(%q<axlsx>, ["~> 2.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
    else
      s.add_dependency(%q<erubis>, [">= 0"])
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<easy_translate>, [">= 0.4.0"])
      s.add_dependency(%q<term-ansicolor>, [">= 0"])
      s.add_dependency(%q<terminal-table>, [">= 0"])
      s.add_dependency(%q<highline>, [">= 0"])
      s.add_dependency(%q<slop>, [">= 3.4.7"])
      s.add_dependency(%q<axlsx>, ["~> 2.0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
    end
  else
    s.add_dependency(%q<erubis>, [">= 0"])
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<easy_translate>, [">= 0.4.0"])
    s.add_dependency(%q<term-ansicolor>, [">= 0"])
    s.add_dependency(%q<terminal-table>, [">= 0"])
    s.add_dependency(%q<highline>, [">= 0"])
    s.add_dependency(%q<slop>, [">= 3.4.7"])
    s.add_dependency(%q<axlsx>, ["~> 2.0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
  end
end
