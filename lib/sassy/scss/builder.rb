module Sassy
  module SCSS
    class Builder

      def initialize(&block)
        instance_eval(&block)
      end

      delegate :to_scss, :to => :rule_set

      def r(selector, &block)
        rule_set.add(selector, &block)
      end

      private

      def rule_set
        @rule_set ||= RuleSet.new
      end

      def method_missing(method, *args, &block)
        if block_given?
          rule_set.add(Rule.new(method, &block))
        else
          super
        end
      end

    end
  end
end