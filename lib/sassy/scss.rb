require 'rubygems'
require 'active_support/core_ext/object'
require Sassy.root.join('scss', 'builder')

module Sassy
  module SCSS
    class << self
      def build(&block)
        Builder.new(&block).to_scss
      end
    end
  end
end

%w(rule declaration declaration_set rule_set).each do |f|
  require Sassy.root.join('scss', f)
end