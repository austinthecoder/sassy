require 'set'
require Sassy.root.join('scss', 'is_scss')

module Sassy
  module SCSS
    class Rule

      include IsSCSS

      def initialize(selector, &block)
        raise ArgumentError if selector.blank?
        @selector = selector
        instance_eval(&block) if block_given?
      end

      def declarations
        @declarations ||= DeclarationSet.new
      end

      def rules
        @rules ||= RuleSet.new
      end

      def r(selector, &block)
        rules.add(selector, &block)
      end

      def d(property, value)
        declarations.add(property, value)
      end

      def to_scss
        a = ["#{@selector} {"]
        a << declarations.to_scss unless declarations.empty?
        a << rules.to_scss unless rules.empty?
        a << "}"
        a.join(" ")
      end

      private

      def method_missing(method, *args, &block)
        if block_given?
          r(method, &block)
        else
          d(method.to_s.gsub('_', '-'), args[0])
        end
      end

    end
  end
end