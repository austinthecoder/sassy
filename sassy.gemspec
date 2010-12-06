Gem::Specification.new do |s|
  s.name = 'sassy'
  s.version = '0.0.1'
  s.authors = ["Austin Schneider"]
  s.email = "soccer022483@gmail.com"
  s.description = 'Sassy'
  s.homepage = ""
  s.summary = 'Sassy; copyright 2010 Austin Schneider'
  s.post_install_message "Thanks for installing Sassy!"
  s.files = Dir[
    '.gitignore',
    'lib/**/*',
    'LICENSE',
    'README',
    'sassy.gemspec',
    'spec/**/*'
  ].to_a
  s.test_files = []
  s.require_paths = ["lib"]
  s.extra_rdoc_files = ["README"]

  s.add_dependency 'activesupport', '>= 3.0.0'
  s.add_development_dependency 'rspec', '>= 2.0.0.beta.22'
end
