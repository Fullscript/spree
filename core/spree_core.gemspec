# encoding: UTF-8
version = File.read(File.expand_path("../../SPREE_VERSION", __FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_core'
  s.version     = version
  s.summary     = 'The bare bones necessary for Spree.'
  s.description = 'The bare bones necessary for Spree.'

  s.required_ruby_version = '>= 1.9.3'
  s.author      = 'Sean Schofield'
  s.email       = 'sean@spreecommerce.com'
  s.homepage    = 'http://spreecommerce.com'
  s.license     = %q{BSD-3}

  s.files        = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  s.require_path = 'lib'

  s.add_dependency 'activemerchant', '1.50.0'
  s.add_dependency 'acts_as_list', '0.9.3'
  s.add_dependency 'awesome_nested_set', '~> 3.1.2'
  s.add_dependency 'aws-sdk', '~> 2.6'
  s.add_dependency 'cancancan', '~> 1.12.0'
  s.add_dependency 'deface', '~> 1.0.0'
  s.add_dependency 'ffaker', '~> 2.3.0'
  s.add_dependency 'font-awesome-rails', '~> 4.0'
  s.add_dependency 'friendly_id', '~> 5.1.0'
  s.add_dependency 'highline', '~> 1.6.18' # Necessary for the install generator
  s.add_dependency 'httparty', '~> 0.14' # For checking alerts.
  s.add_dependency 'i18n', '~> 0.7' # required for rails 4.2
  s.add_dependency 'json', '~> 2.3'
  s.add_dependency 'kaminari', '~> 0.17.0'
  s.add_dependency 'monetize', '~> 1.6'
  s.add_dependency 'paperclip', '~> 5.1.0'
  s.add_dependency 'paranoia', '~> 2.0'
  s.add_dependency 'rails', '~> 4.2.9'
  s.add_dependency 'ransack', '~> 1.4.1'
  s.add_dependency 'responders', '~> 2.3.0'
  s.add_dependency 'state_machines-activerecord', '~> 0.5.0'

  # ??
  s.add_dependency 'stringex', '~> 1.5.1'
  s.add_dependency 'truncate_html', '0.9.2'
  s.add_development_dependency 'byebug'

end
