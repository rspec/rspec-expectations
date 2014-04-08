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
      # Instructs rspec-expectations to warn on first usage of `should` or `should_not`.
      # Enabled by default. This is largely here to facilitate testing.
      def warn_about_should!
        @warn_about_should = true
      end

      # @api private
      # Generates a deprecation warning for the given method if no warning
      # has already been issued.
      def warn_about_should_unless_configured(method_name)
        if @warn_about_should
          RSpec.deprecate(
            "Using `#{method_name}` from rspec-expectations' old `:should` syntax without explicitly enabling the syntax",
            :replacement => "the new `:expect` syntax or explicitly enable `:should`"
          )

          @warn_about_should = false
        end
      end

      # @api private
      # Enables the `should` syntax.
      def enable_should(syntax_host = default_should_host)
        @warn_about_should = false if syntax_host == default_should_host
        return if should_enabled?(syntax_host)

        syntax_host.module_exec do
          def should(matcher=nil, message=nil, &block)
            ::RSpec::Expectations::Syntax.warn_about_should_unless_configured(__method__)
            ::RSpec::Expectations::PositiveExpectationHandler.handle_matcher(self, matcher, message, &block)
          end

          def should_not(matcher=nil, message=nil, &block)
            ::RSpec::Expectations::Syntax.warn_about_should_unless_configured(__method__)
            ::RSpec::Expectations::NegativeExpectationHandler.handle_matcher(self, matcher, message, &block)
          end
        end
      end

      # @api private
      # Disables the `should` syntax.
      def disable_should(syntax_host = default_should_host)
        return unless should_enabled?(syntax_host)

        syntax_host.module_exec do
          undef should
          undef should_not
        end
      end

      # @api private
      # Enables the `expect` syntax.
      def enable_expect(syntax_host = ::RSpec::Matchers)
        return if expect_enabled?(syntax_host)

        syntax_host.module_exec do
          def expect(*target, &target_block)
            target << target_block if block_given?
            raise ArgumentError.new("You must pass an argument or a block to #expect but not both.") unless target.size == 1
            ::RSpec::Expectations::ExpectationTarget.new(target.first)
          end
        end
      end

      # @api private
      # Disables the `expect` syntax.
      def disable_expect(syntax_host = ::RSpec::Matchers)
        return unless expect_enabled?(syntax_host)

        syntax_host.module_exec do
          undef expect
        end
      end

      # @api private
      # Indicates whether or not the `should` syntax is enabled.
      def should_enabled?(syntax_host = default_should_host)
        syntax_host.method_defined?(:should)
      end

      # @api private
      # Indicates whether or not the `expect` syntax is enabled.
      def expect_enabled?(syntax_host = ::RSpec::Matchers)
        syntax_host.method_defined?(:expect)
      end

      # @api private
      # Enables the matcher boolean negation operator `!` syntax.
      def enable_matcher_boolean_negation_operator(syntax_host = ::RSpec::Matchers::Composable)
        return if matcher_boolean_negation_operator_enabled?(syntax_host)

        syntax_host.module_exec do
          # BuiltIn::Negation defines `~`, to handle double negated matchers.
          # We define `!` and not alias it, since an alias would be bound directly to this implementation of `~`
          # and not call Negation's implementation
          def !
            self.~
          end
        end
      end

      # @api private
      # Disables the matcher boolean negation operator `!` syntax.
      def disable_matcher_boolean_negation_operator(syntax_host = ::RSpec::Matchers::Composable)
        return unless matcher_boolean_negation_operator_enabled?(syntax_host)

        syntax_host.module_exec do
          remove_method('!')
        end
      end

      # @api private
      # Indicates whether or not the matcher boolean negation operator `!` syntax is enabled.
      def matcher_boolean_negation_operator_enabled?(syntax_host = ::RSpec::Matchers::Composable)
        syntax_host.method_defined?('!')
      end

    end
  end
end

# The legacy `:should` syntax adds the following methods directly to
# `BasicObject` so that they are available off of any object. Note, however,
# that this syntax does not always play nice with delegate/proxy objects.
# We recommend you use the non-monkeypatching `:expect` syntax instead.
class BasicObject
  # @method should
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

  # @method should_not
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
