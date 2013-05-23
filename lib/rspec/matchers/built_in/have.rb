module RSpec
  module Matchers
    module BuiltIn
      class Have
        QUERY_METHODS = [:size, :length, :count].freeze

        def initialize(expected, relativity=:exactly)
          @expected = case expected
                      when :no then 0
                      when String then expected.to_i
                      else expected
                      end
          @relativity = relativity
          @actual = @collection_name = @plural_collection_name = nil
        end

        def relativities
          @relativities ||= {
            :exactly => "",
            :at_least => "at least ",
            :at_most => "at most ",
            :more_than => "more than ",
            :less_than => "less than "
          }
        end

        def matches?(collection_or_owner)
          collection = determine_collection(collection_or_owner)
          case collection
          when enumerator_class
            for query_method in QUERY_METHODS
              next unless collection.respond_to?(query_method)
              @actual = collection.__send__(query_method)
              break unless @actual.nil?
            end
            raise not_a_collection if @actual.nil?
          else
            query_method = determine_query_method(collection)
            raise not_a_collection unless query_method
            @actual = collection.__send__(query_method)
          end
          case @relativity
          when :at_least  then @actual >= @expected
          when :at_most   then @actual <= @expected
          when :more_than then @actual >  @expected
          when :less_than then @actual <  @expected
          else                 @actual == @expected
          end
        end
        alias == matches?

        def determine_collection(collection_or_owner)
          if collection_or_owner.respond_to?(@collection_name)
            collection_or_owner.__send__(@collection_name, *@args, &@block)
          elsif (@plural_collection_name && collection_or_owner.respond_to?(@plural_collection_name))
            collection_or_owner.__send__(@plural_collection_name, *@args, &@block)
          elsif determine_query_method(collection_or_owner)
            collection_or_owner
          else
            collection_or_owner.__send__(@collection_name, *@args, &@block)
          end
        end

        def determine_query_method(collection)
          QUERY_METHODS.detect {|m| collection.respond_to?(m)}
        end

        def not_a_collection
          "expected #{@collection_name} to be a collection but it does not respond to #length, #size or #count"
        end

        def failure_message_for_should
          "expected #{relative_expectation} #{@collection_name}, got #{@actual}"
        end

        def failure_message_for_should_not
          collective_expectation = "(#{@expected}).#{@collection_name}"
          case @relativity
          when :exactly
            "expected target not to have #{@expected} #{@collection_name}, got #{@actual}"
          when :at_most
            contrapositive_message("have_at_most", "have_less_than", collective_expectation)
          when :at_least
            contrapositive_message("have_at_least", "have_more_than", collective_expectation)
          when :more_than
            contrapositive_message("have_more_than", "have_at_least", collective_expectation)
          when :less_than
            contrapositive_message("have_less_than", "have_at_most", collective_expectation)
          end
        end

        def contrapositive_message(negation, contrapositive, expectation)
          <<-EOF
Isn't life confusing enough?
Instead of having to figure out the meaning of this:
  #{Expectations::Syntax.negative_expression("actual", negation + expectation)}
We recommend that you use this instead:
  #{Expectations::Syntax.positive_expression("actual", contrapositive + expectation)}
EOF
        end

        def description
          "have #{relative_expectation} #{@collection_name}"
        end

        def respond_to?(m)
          @expected.respond_to?(m) || super
        end

        private

        def method_missing(method, *args, &block)
          @collection_name = method
          if inflector = (defined?(ActiveSupport::Inflector) && ActiveSupport::Inflector.respond_to?(:pluralize) ? ActiveSupport::Inflector : (defined?(Inflector) ? Inflector : nil))
            @plural_collection_name = inflector.pluralize(method.to_s)
          end
          @args = args
          @block = block
          self
        end

        def relative_expectation
          "#{relativities[@relativity]}#{@expected}"
        end

        def enumerator_class
          RUBY_VERSION < '1.9' ? Enumerable::Enumerator : Enumerator
        end
      end
    end
  end
end
