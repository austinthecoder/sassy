require 'set'
require Sassy.root.join('scss', 'is_scss')

module Sassy
  module SCSS
    class RuleSet

      include IsSCSS

      def initialize(&block)
        instance_eval(&block) if block_given?
      end

      def add(rule_or_selector, &block)
        set << case rule_or_selector
        when Rule
          rule_or_selector
        else
          Rule.new(rule_or_selector, &block)
        end
      end

      # TODO: test this
      def to_scss
        set.to_a.map(&:to_scss).sort.join(" ")
      end

      # TODO: test this
      delegate :empty?, :to => :set

      private

      # TODO: test this
      def set
        @set ||= Set.new
      end

    end
  end
end