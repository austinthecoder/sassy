require Sassy.root.join('scss', 'is_scss')

module Sassy
  module SCSS
    class Declaration

      include IsSCSS

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