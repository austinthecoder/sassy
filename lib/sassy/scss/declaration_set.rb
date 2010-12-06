require 'set'
require Sassy.root.join('scss', 'is_scss')

module Sassy
  module SCSS
    class DeclarationSet

      include IsSCSS

      def add(*args)
        set << if args.size == 1 && args[0].is_a?(Declaration)
          args[0]
        else
          Declaration.new(*args)
        end
      end

      def to_scss
        set.to_a.map(&:to_scss).sort.join(" ")
      end

      delegate :empty?, :to => :set

      private

      def set
        @set ||= Set.new
      end

    end
  end
end