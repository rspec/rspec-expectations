module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for `respond_to`.
      # Not intended to be instantiated directly.
      class RespondTo
        include Composable

        def initialize(*names)
          @names = names
          @expected_arity = nil
        end

        # @api public
        # Specifies the number of expected arguments.
        #
        # @example
        #   expect(obj).to respond_to(:message).with(3).arguments
        def with(n)
          @expected_arity = n
          self
        end

        # @api public
        # No-op. Intended to be used as syntactic sugar when using `with`.
        #
        # @example
        #   expect(obj).to respond_to(:message).with(3).arguments
        def argument
          self
        end
        alias :arguments :argument

        # @private
        def matches?(actual)
          find_failing_method_names(actual, :reject).empty?
        end

        # @private
        def does_not_match?(actual)
          find_failing_method_names(actual, :select).empty?
        end

        # @api private
        # @return [String]
        def failure_message
          "expected #{@actual.inspect} to respond to #{@failing_method_names.collect {|name| name.inspect }.join(', ')}#{with_arity}"
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          failure_message.sub(/to respond to/, 'not to respond to')
        end

        # @api private
        # @return [String]
        def description
          "respond to #{pp_names}#{with_arity}"
        end

        # @private
        def supports_block_expectations?
          false
        end

      private

        def find_failing_method_names(actual, filter_method)
          @actual = actual
          @failing_method_names = @names.__send__(filter_method) do |name|
            @actual.respond_to?(name) && matches_arity?(actual, name)
          end
        end

        def matches_arity?(actual, name)
          return true unless @expected_arity

          signature = Support::MethodSignature.new(actual.method(name))
          Support::MethodSignatureVerifier.new(signature, Array.new(@expected_arity)).valid?
        end

        def with_arity
          @expected_arity.nil?? "" :
            " with #{@expected_arity} argument#{@expected_arity == 1 ? '' : 's'}"
        end

        def pp_names
          # Ruby 1.9 returns the same thing for array.to_s as array.inspect, so just use array.inspect here
          @names.length == 1 ? "##{@names.first}" : @names.inspect
        end
      end
    end
  end
end
