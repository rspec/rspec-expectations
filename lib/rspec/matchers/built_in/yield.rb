module RSpec
  module Matchers
    module BuiltIn
      # @private
      # Object that is yielded to `expect` when one of the
      # yield matchers is used. Provides information about
      # the yield behavior of the object-under-test.
      class YieldProbe
        def self.probe(block)
          probe = new(block)
          return probe unless probe.has_block?
          probe.assert_valid_expect_block!
          block.call(probe)
          probe.assert_used!
          probe
        end

        attr_accessor :num_yields, :yielded_args

        def initialize(block)
          @block = block
          @used = false
          self.num_yields, self.yielded_args = 0, []
        end

        def has_block?
          Proc === @block
        end

        def to_proc
          @used = true

          probe = self
          Proc.new do |*args|
            probe.num_yields += 1
            probe.yielded_args << args
            nil # to indicate the block does not return a meaningful value
          end
        end

        def single_yield_args
          yielded_args.first
        end

        def yielded_once?(matcher_name)
          case num_yields
          when 1 then true
          when 0 then false
          else
            raise "The #{matcher_name} matcher is not designed to be used with a " +
                  "method that yields multiple times. Use the yield_successive_args " +
                  "matcher for that case."
          end
        end

        def successive_yield_args
          yielded_args.map do |arg_array|
            arg_array.size == 1 ? arg_array.first : arg_array
          end
        end

        def assert_used!
          return if @used
          raise "You must pass the argument yielded to your expect block on " +
                "to the method-under-test as a block. It acts as a probe that " +
                "allows the matcher to detect whether or not the method-under-test " +
                "yields, and, if so, how many times, and what the yielded arguments " +
                "are."
        end

        def assert_valid_expect_block!
          return if @block.arity == 1
          raise "Your expect block must accept an argument to be used with this " +
                "matcher. Pass the argument as a block on to the method you are testing."
        end
      end

      # @api private
      # Provides the implementation for `yield_control`.
      # Not intended to be instantiated directly.
      class YieldControl < BaseMatcher
        def initialize
          @expectation_type = nil
          @expected_yields_count = nil
        end

        # @api public
        # Specifies that the method is expected to yield once.
        def once
          exactly(1)
          self
        end

        # @api public
        # Specifies that the method is expected to yield once.
        def twice
          exactly(2)
          self
        end

        # @api public
        # Specifies that the method is expected to yield the given number of times.
        def exactly(number)
          set_expected_yields_count(:==, number)
          self
        end

        # @api public
        # Specifies the maximum number of times the method is expected to yield
        def at_most(number)
          set_expected_yields_count(:<=, number)
          self
        end

        # @api public
        # Specifies the minimum number of times the method is expected to yield
        def at_least(number)
          set_expected_yields_count(:>=, number)
          self
        end

        # @api public
        # No-op. Provides syntactic sugar.
        def times
          self
        end

        # @private
        def matches?(block)
          @probe = YieldProbe.probe(block)
          return false unless @probe.has_block?

          if @expectation_type
            @probe.num_yields.__send__(@expectation_type, @expected_yields_count)
          else
            @probe.yielded_once?(:yield_control)
          end
        end

        # @private
        def does_not_match?(block)
          !matches?(block) && @probe.has_block?
        end

        # @api private
        # @return [String]
        def failure_message
          'expected given block to yield control' + failure_reason
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          'expected given block not to yield control' + failure_reason
        end

        # @private
        def supports_block_expectations?
          true
        end

      private

        def set_expected_yields_count(relativity, n)
          @expectation_type = relativity
          @expected_yields_count = case n
                                   when Numeric then n
                                   when :once then 1
                                   when :twice then 2
                                   end
        end

        def failure_reason
          return " but was not a block" unless @probe.has_block?
          return '' unless @expected_yields_count
          " #{human_readable_expecation_type}#{human_readable_count}"
        end

        def human_readable_expecation_type
          case @expectation_type
          when :<= then 'at most '
          when :>= then 'at least '
          else ''
          end
        end

        def human_readable_count
          case @expected_yields_count
          when 1 then "once"
          when 2 then "twice"
          else "#{@expected_yields_count} times"
          end
        end
      end

      # @api private
      # Provides the implementation for `yield_with_no_args`.
      # Not intended to be instantiated directly.
      class YieldWithNoArgs < BaseMatcher
        # @private
        def matches?(block)
          @probe = YieldProbe.probe(block)
          return false unless @probe.has_block?
          @probe.yielded_once?(:yield_with_no_args) && @probe.single_yield_args.empty?
        end

        # @private
        def does_not_match?(block)
          !matches?(block) && @probe.has_block?
        end

        # @private
        def failure_message
          "expected given block to yield with no arguments, but #{positive_failure_reason}"
        end

        # @private
        def failure_message_when_negated
          "expected given block not to yield with no arguments, but #{negative_failure_reason}"
        end

        # @private
        def supports_block_expectations?
          true
        end

      private

        def positive_failure_reason
          return "was not a block" unless @probe.has_block?
          return "did not yield" if @probe.num_yields.zero?
          "yielded with arguments: #{@probe.single_yield_args.inspect}"
        end

        def negative_failure_reason
          return "was not a block" unless @probe.has_block?
          "did"
        end
      end

      # @api private
      # Provides the implementation for `yield_with_args`.
      # Not intended to be instantiated directly.
      class YieldWithArgs
        include Composable

        def initialize(*args)
          @expected = args
        end

        # @private
        def matches?(block)
          @probe = YieldProbe.probe(block)
          return false unless @probe.has_block?
          @actual = @probe.single_yield_args
          @probe.yielded_once?(:yield_with_args) && args_match?
        end

        # @private
        def does_not_match?(block)
          !matches?(block) && @probe.has_block?
        end

        # @private
        def failure_message
          "expected given block to yield with arguments, but #{positive_failure_reason}"
        end

        # @private
        def failure_message_when_negated
          "expected given block not to yield with arguments, but #{negative_failure_reason}"
        end

        # @private
        def description
          desc = "yield with args"
          desc << "(#{expected_arg_description})" unless @expected.empty?
          desc
        end

        # @private
        def supports_block_expectations?
          true
        end

      private

        def positive_failure_reason
          return "was not a block" unless @probe.has_block?
          return "did not yield" if @probe.num_yields.zero?
          @positive_args_failure
        end

        def expected_arg_description
          @expected.map { |e| description_of e }.join(", ")
        end

        def negative_failure_reason
          if !@probe.has_block?
            "was not a block"
          elsif all_args_match?
            "yielded with expected arguments" +
              "\nexpected not: #{surface_descriptions_in(@expected).inspect}" +
              "\n         got: #{@actual.inspect}"
          else
            "did"
          end
        end

        def args_match?
          if @expected.empty? # expect {...}.to yield_with_args
            @positive_args_failure = "yielded with no arguments" if @actual.empty?
            return !@actual.empty?
          end

          unless match = all_args_match?
            @positive_args_failure = "yielded with unexpected arguments" +
              "\nexpected: #{surface_descriptions_in(@expected).inspect}" +
              "\n     got: #{@actual.inspect}"
          end

          match
        end

        def all_args_match?
          values_match?(@expected, @actual)
        end
      end

      # @api private
      # Provides the implementation for `yield_successive_args`.
      # Not intended to be instantiated directly.
      class YieldSuccessiveArgs
        include Composable

        def initialize(*args)
          @expected = args
        end

        # @private
        def matches?(block)
          @probe = YieldProbe.probe(block)
          return false unless @probe.has_block?
          @actual = @probe.successive_yield_args
          args_match?
        end

        def does_not_match?(block)
          !matches?(block) && @probe.has_block?
        end

        # @private
        def failure_message
          "expected given block to yield successively with arguments, but #{positive_failure_reason}"
        end

        # @private
        def failure_message_when_negated
          "expected given block not to yield successively with arguments, but #{negative_failure_reason}"
        end

        # @private
        def description
          desc = "yield successive args"
          desc << "(#{expected_arg_description})"
          desc
        end

        # @private
        def supports_block_expectations?
          true
        end

      private

        def args_match?
          values_match?(@expected, @actual)
        end

        def expected_arg_description
          @expected.map { |e| description_of e }.join(", ")
        end

        def positive_failure_reason
          return "was not a block" unless @probe.has_block?

          "yielded with unexpected arguments" +
          "\nexpected: #{surface_descriptions_in(@expected).inspect}" +
          "\n     got: #{@actual.inspect}"
        end

        def negative_failure_reason
          return "was not a block" unless @probe.has_block?

          "yielded with expected arguments" +
          "\nexpected not: #{surface_descriptions_in(@expected).inspect}" +
          "\n         got: #{@actual.inspect}"
        end
      end
    end
  end
end

