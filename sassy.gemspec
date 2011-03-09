$:.push File.expand_path("../lib", __FILE__)
require "sassy/version"

Gem::Specification.new do |s|
  s.name = "sassy"
  s.version = Sassy::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Austin Schneider"]
  s.email = ["soccer022483@gmail.com"]
  s.homepage = "http://github.com/soccer022483/sassy"
  s.summary = %q{Generate SCSS with Ruby.}
  s.description = %q{Generate SCSS with Ruby.}

  s.rubyforge_project = "sassy"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.post_install_message = "Thanks for installing Sassy!"

  s.add_dependency 'i18n', '~> 0.5.0'
  s.add_dependency 'activesupport', '~> 3.0.5'

  s.add_development_dependency 'rspec', '~> 2.5.0'
end
