require 'rubygems'
require 'active_support/core_ext/object'

module Sassy
  module SCSS
    class Declaration

      def initialize(property, value)
        raise ArgumentError if [property, value].any?(&:blank?)
        @property = property
        @value = value
      end

      def to_scss
        "#{@property}: #{@value};"
      end

    end
  end
end