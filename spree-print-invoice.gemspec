version = '0.60.0'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_print_invoice'
  s.version     = version
  s.summary     = 'Print invoices from a spree order'
  s.required_ruby_version = '>= 1.8.7'

  s.files        = Dir['README.markdown', 'lib/**/*', 'app/**/*', 'config/*']
  s.require_path = 'lib'
  s.requirements << 'none'
  s.authors      = 'Spree Community & 3DRobotics'

  s.has_rdoc = true

  s.add_dependency('pdfkit', '~> 0.5.2')
  s.add_dependency('spree_core', '>= 0.30.0')

end
