# -*- encoding: utf-8 -*-
# stub: image_processing 1.7.1 ruby lib

Gem::Specification.new do |s|
  s.name = "image_processing".freeze
  s.version = "1.7.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Janko Marohni\u0107".freeze]
  s.date = "2018-09-26"
  s.description = "Set of higher-level helper methods for image processing.".freeze
  s.email = ["janko.marohnic@gmail.com".freeze]
  s.homepage = "https://github.com/janko-m/image_processing".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0".freeze)
  s.rubygems_version = "3.4.7".freeze
  s.summary = "Set of higher-level helper methods for image processing.".freeze

  s.installed_by_version = "3.4.7" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<mini_magick>.freeze, ["~> 4.0"])
  s.add_runtime_dependency(%q<ruby-vips>.freeze, [">= 2.0.13", "< 3"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.8"])
  s.add_development_dependency(%q<minitest-hooks>.freeze, [">= 1.4.2"])
  s.add_development_dependency(%q<minispec-metadata>.freeze, [">= 0"])
  s.add_development_dependency(%q<phashion>.freeze, [">= 0"])
end
