require 'pathname'

module Sassy
  class << self
    def root
      @@root ||= Pathname(File.dirname(__FILE__)).expand_path.join('sassy')
    end
  end
end

require Sassy.root.join('scss')