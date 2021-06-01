module RSpec
  module Expectations
    # @api private
    # Provides methods for enabling and disabling the available
    # syntaxes provided by rspec-expectations.
    module Syntax
      module_function

      # @api private
      # Determines where we add `should` and `should_not`.
      def default_should_host
        @default_should_host ||= ::Object.ancestors.last
      end

      # @api private
      # Generates a deprecation warning everytime should expectations is used
      def warn_about_should
        RSpec.deprecate(
          "`should =`",
          :replacement => "the new `:expect` syntax",
          :message => "Using `should` from rspec-expectations' will be removed in RSpec 4"
        )
      end

      # @api private
      # Enables the `should` syntax.
      def enable_should(syntax_host=default_should_host)
        return if should_enabled?(syntax_host)

        syntax_host.module_exec do
          def should(matcher=nil, message=nil, &block)
            ::RSpec::Expectations::Syntax.warn_about_should
            ::RSpec::Expectations::PositiveExpectationHandler.handle_matcher(self, matcher, message, &block)
          end

          def should_not(matcher=nil, message=nil, &block)
            ::RSpec::Expectations::Syntax.warn_about_should
            ::RSpec::Expectations::NegativeExpectationHandler.handle_matcher(self, matcher, message, &block)
          end
        end
      end

      # @api private
      # Disables the `should` syntax.
      def disable_should(syntax_host=default_should_host)
        return unless should_enabled?(syntax_host)

        syntax_host.module_exec do
          undef should
          undef should_not
        end
      end

      # @api private
      # Enables the `expect` syntax.
      def enable_expect(syntax_host=::RSpec::Matchers)
        return if expect_enabled?(syntax_host)

        syntax_host.module_exec do
          def expect(value=::RSpec::Expectations::ExpectationTarget::UndefinedValue, &block)
            ::RSpec::Expectations::ExpectationTarget.for(value, block)
          end
        end
      end

      # @api private
      # Disables the `expect` syntax.
      def disable_expect(syntax_host=::RSpec::Matchers)
        return unless expect_enabled?(syntax_host)

        syntax_host.module_exec do
          undef expect
        end
      end

      # @api private
      # Indicates whether or not the `should` syntax is enabled.
      def should_enabled?(syntax_host=default_should_host)
        syntax_host.method_defined?(:should)
      end

      # @api private
      # Indicates whether or not the `expect` syntax is enabled.
      def expect_enabled?(syntax_host=::RSpec::Matchers)
        syntax_host.method_defined?(:expect)
      end
    end
  end
end

if defined?(BasicObject)
  # The legacy `:should` syntax adds the following methods directly to
  # `BasicObject` so that they are available off of any object. Note, however,
  # that this syntax does not always play nice with delegate/proxy objects.
  # We recommend you use the non-monkeypatching `:expect` syntax instead.
  class BasicObject
    # @method should(matcher, message)
    # Passes if `matcher` returns true.  Available on every `Object`.
    # @example
    #   actual.should eq expected
    #   actual.should match /expression/
    # @param [Matcher]
    #   matcher
    # @param [String] message optional message to display when the expectation fails
    # @return [Boolean] true if the expectation succeeds (else raises)
    # @note This is only available when you have enabled the `:should` syntax.
    # @see RSpec::Matchers

    # @method should_not(matcher, message)
    # Passes if `matcher` returns false.  Available on every `Object`.
    # @example
    #   actual.should_not eq expected
    # @param [Matcher]
    #   matcher
    # @param [String] message optional message to display when the expectation fails
    # @return [Boolean] false if the negative expectation succeeds (else raises)
    # @note This is only available when you have enabled the `:should` syntax.
    # @see RSpec::Matchers
  end
end
