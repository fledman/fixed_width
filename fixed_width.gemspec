# -*- encoding: utf-8 -*-
require_relative 'lib/fixed_width/version'

Gem::Specification.new do |s|
  s.name      = "fixed_width"
  s.version   = FixedWidth::VERSION
  s.platform  = Gem::Platform::RUBY
  s.date      = Date.today.to_s

  s.authors   = ["Ryan Wood", "Timon Karnezos", "David Feldman"]
  s.email     = "dbfeldman@gmail.com"

  s.summary     = "A gem that provides a DSL for parsing and writing files of fixed-width records."
  s.description = %(#{s.summary} Forked from timonk/fixed_width [https://github.com/timonk/fixed_width],
                    which in turn was forked from ryanwood/slither [https://github.com/ryanwood/slither].
                    Combines features from divergent forks. Adds large file support.).gsub(/\s+/,' ')
  s.homepage    = "https://github.com/fledman/fixed_width"

  s.require_paths = ["lib"]
  s.required_ruby_version = '>= 1.9'
  s.add_dependency 'activesupport', '>= 3'

  s.extra_rdoc_files = %w{README.markdown TODO}
  s.files = Dir[
    'COPYING', 'HISTORY', 'README*', 'Rakefile', 'TODO', '{examples,lib,spec}/**/*'
  ] & `git ls-files -z`.split("\x0")
end

