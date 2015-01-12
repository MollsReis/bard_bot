require File.join(File.dirname(__FILE__), 'lib', 'bard_bot')

Gem::Specification.new do |gem|
  gem.name = 'bard_bot'
  gem.version = BardBot::VERSION
  gem.date = Date.today.to_s
  gem.author = 'R. Scott Reis'
  gem.email = 'reis.robert.s@gmail.com'
  gem.license = 'MIT'
  gem.homepage = 'https://github.com/EvilScott/bard_bot'
  gem.summary = 'Shakespearean markov sentence generation'
  gem.description = 'BardBot can generate markov sentences for your from a number of Shakespearean character corpora'
  gem.files = Dir['{data,lib,spec}/**/*', 'Rakefile', 'README*', 'LICENSE*']
  gem.require_path = 'lib'
  gem.add_development_dependency 'rspec', '~> 3.1'
end
