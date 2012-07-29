# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cre-stats/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nicholas E. Rabenau"]
  gem.email         = ["nerab@gmx.net"]
  gem.description   = %q{Provides a number of tools to do simple statistical analysis of CRE}
  gem.summary       = %q{Statistical analysis of CRE}
  gem.homepage      = "http://github.com/nerab/cre-stats"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cre-stats"
  gem.require_paths = ["lib"]
  gem.version       = CRE::Stats::VERSION

  gem.add_runtime_dependency('nokogiri', '~> 1.4')
  gem.add_runtime_dependency('activesupport', '~> 3.2')
  gem.add_runtime_dependency('activemodel', '~> 3.2')
  gem.add_runtime_dependency('jbuilder', '~> 0.4')

  gem.add_development_dependency 'guard-minitest', '~> 0.5'
  gem.add_development_dependency 'guard-bundler', '~> 1.0'
  gem.add_development_dependency 'coolline', '~> 0.3'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'pry'

  gem.add_development_dependency('vcr')
  gem.add_development_dependency('webmock')
end
