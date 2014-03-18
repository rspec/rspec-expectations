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
          @expected_args = nil
          @expected_arity = nil
        end

        # @api public
        # Specifies the number of expected arguments.
        #
        # @example
        #   expect(obj).to respond_to(:message).with(1).argument
        #   expect(obj).to respond_to(:message).with(3).arguments
        def with(n)
          @expected_args = Array.new(n)
          @expected_arity = n
          self
        end

        # @api public
        # Specifies the number of expected arguments.
        #
        # @example
        #   expect(obj).to respond_to(:message).with_keyword_argument(:x)
        #   expect(obj).to respond_to(:message).with_keyword_arguments(:x, :y)
        def with_keyword_arguments(args)
          @expected_args = [args]
          self
        end
        alias :with_keyword_argument :with_keyword_arguments

        # @api public
        # No-op. Intended to be used as syntactic sugar when using `with`.
        #
        # @example
        #   expect(obj).to respond_to(:message).with(1).argument
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

        # @private
        def failure_message
          "expected #{@actual.inspect} to respond to #{@failing_method_names.collect { |name| name.inspect }.join(', ')}#{with_signature}"
        end

        # @private
        def failure_message_when_negated
          failure_message.sub(/to respond to/, 'not to respond to')
        end

        # @private
        def description
          "respond to #{pp_names}#{with_signature}"
        end

      private

        def find_failing_method_names(actual, filter_method)
          @actual = actual
          @failing_method_names = @names.__send__(filter_method) do |name|
            @actual.respond_to?(name) && matches_signature?(actual, name)
          end
        end

        def matches_signature?(actual, name)
          return true unless @expected_args

          signature = Support::MethodSignature.new(actual.method(name))
          Support::MethodSignatureVerifier.new(signature, @expected_args).valid?
        end

        def with_signature
          return if @expected_args.nil?
          if @expected_arity.nil?
            " with argument#{@expected_args[0].size == 1 ? '' : 's'} #{@expected_args[0].map { |k,v| "#{k}: #{v.inspect}" }.join(', ')}"
          else
            " with #{@expected_arity} argument#{@expected_arity == 1 ? '' : 's'}"
          end
        end

        def pp_names
          # Ruby 1.9 returns the same thing for array.to_s as array.inspect, so just use array.inspect here
          @names.length == 1 ? "##{@names.first}" : @names.inspect
        end
      end
    end
  end
end
