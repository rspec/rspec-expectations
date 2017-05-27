module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `all`.
      # Not intended to be instantiated directly.
      class Any < All
        # @private
        attr_reader :matcher, :failed_objects
        # @private
        attr_accessor :any_succeeded_object

        def initialize(matcher)
          @matcher = matcher
          @failed_objects = {}
          @any_succeeded_object = false
        end

        # @api private
        # @return [String]
        def description
          improve_hash_formatting "any #{description_of matcher}"
        end

      private

        def match(_expected, _actual)
          return false unless iterable?

          index_failed_objects
          any_succeeded_object == true
        end

        def index_failed_objects
          actual.each_with_index do |actual_item, index|
            cloned_matcher = matcher.clone
            begin
              matches = cloned_matcher.matches?(actual_item)
            rescue StandardError
              matches = nil
            end

            if matches
              self.any_succeeded_object = true
              break
            else
              failed_objects[index] = cloned_matcher.failure_message
            end
          end
        end
      end
    end
  end
end
