# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "foreman_nxs"
  gem.homepage = "http://github.com/arnoudj/foreman_nxs"
  gem.license = "Apache License, Version 2.0"
  gem.summary = %Q{Nxs API extension for Foreman}
  gem.description = %Q{Nxs API extension for Foreman}
  gem.email = "arnoud.dejonge@nxs.nl"
  gem.authors = ["Arnoud de Jonge"]
  gem.version = "0.0.1"
  # dependencies defined in Gemfile
end

task :default => :test
