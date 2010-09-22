require 'rspec'
# optionally add autorun support
# require 'rspec/autorun'
require 'sassy'

Rspec.configure do |c|
  c.mock_with :rspec
end
