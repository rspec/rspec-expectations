module RSpec
  module Matchers
    module ComposableAliases
      class MatcherWithComposedPhrasing < defined?(::BasicObject) ? ::BasicObject : ::Object
        def initialize(base_matcher, description_block)
          @base_matcher = base_matcher
          @description_block = description_block
        end

        def method_missing(name, *args, &block)
          @base_matcher.__send__(name, *args, &block).tap do |return_val|
            if return_val.respond_to?(:description)
              return MatcherWithComposedPhrasing.new(return_val, @description_block)
            end
          end
        end

        def respond_to?(name, *args)
          super || @base_matcher.respond_to?(name, *args)
        end

        def description
          @description_block.call(super)
        end

        # Needed on 1.8.7 so `===` is delegated via `method_missing`.
        undef === if method_defined?(:===)
      end

      def self.alias_matcher(new_name, old_name, &description_override)
        define_method(new_name) do |*args, &block|
          matcher = __send__(old_name, *args, &block)
          MatcherWithComposedPhrasing.new(matcher, description_override)
        end
      end

      alias_matcher :a_value_within, :be_within do |description|
        description.gsub("be within", "a value within")
      end
    end
  end
end
