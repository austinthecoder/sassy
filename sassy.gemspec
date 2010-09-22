Gem::Specification.new do |s|
  s.name = 'sassy'
  s.version = '0.0.1'
  s.summary = 'Sassy; copyright 2010 Austin Schneider'
  s.files = Dir[
    '[a-zA-Z]*',
    'config/**/*',
    'lib/**/*',
    'tasks/**/*',
    'spec/**/*'
  ].to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end
