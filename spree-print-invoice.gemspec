# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_print_invoice'
  s.version     = '2.0.0'
  s.summary     = 'Print invoices from a spree order'
  s.required_ruby_version = '>= 2.0.0'

  s.files        = Dir['README.markdown', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.authors      = 'Spree Community & 3DRobotics'

  s.add_dependency('spree_core', '~> 2.0.0')

end
