# -*- encoding: utf-8 -*-
# stub: smarter_csv 1.2.6 ruby lib

Gem::Specification.new do |s|
  s.name = "smarter_csv".freeze
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Tilo Sloboda\n".freeze]
  s.date = "2018-11-13"
  s.description = "Ruby Gem for smarter importing of CSV Files as Array(s) of Hashes, with optional features for processing large files in parallel, embedded comments, unusual field- and record-separators, flexible mapping of CSV-headers to Hash-keys".freeze
  s.email = ["tilo.sloboda@gmail.com\n".freeze]
  s.homepage = "https://github.com/tilo/smarter_csv".freeze
  s.licenses = ["MIT".freeze, "GPL-2".freeze]
  s.requirements = ["csv".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Ruby Gem for smarter importing of CSV Files (and CSV-like files), with lots of optional features, e.g. chunked processing for huge CSV files".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
  end
end
