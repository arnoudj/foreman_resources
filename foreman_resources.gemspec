# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "foreman_resources"
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arnoud de Jonge"]
  s.date = "2013-02-12"
  s.description = "API extension for Foreman to manage class resources"
  s.email = "arnoud.dejonge@nxs.nl"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.md"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README.md",
    "Rakefile",
    "lib/foreman_resources/engine.rb",
    "lib/foreman_resources.rb",
    "app/controllers/api/resources_base_controller.rb",
    "app/controllers/api/types_controller.rb",
    "app/controllers/api/resources_schema.rb",
    "app/controllers/api/resources_controller.rb",
    "config/routes.rb",
    "examples/resources.json",
  ]
  s.homepage = "http://github.com/arnoudj/foreman_resources"
  s.licenses = ["Apache License, Version 2.0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Nxs API extension for Foreman"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
    else
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
  end
end

