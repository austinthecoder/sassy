module Sassy
  module SCSS
    module IsSCSS

      def self.included(base)
        base.send(:include, Comparable)
        base.send(:include, InstanceMethods)
      end

      module InstanceMethods
        def <=>(other)
          to_scss <=> other.to_scss
        end

        def eql?(other)
          to_scss.eql?(other.to_scss)
        end

        def hash
          to_scss.hash
        end
      end

    end
  end
end