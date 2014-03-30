RSpec::Support.require_rspec_expectations "syntax"

module RSpec
  module Expectations
    # Provides configuration options for rspec-expectations.
    # If you are using rspec-core, you can access this via a
    # block passed to `RSpec::Core::Configuration#expect_with`.
    # Otherwise, you can access it via RSpec::Expectations.configuration.
    #
    # @example
    #   RSpec.configure do |rspec|
    #     rspec.expect_with :rspec do |c|
    #       # c is the config object
    #     end
    #   end
    #
    #   # or
    #
    #   RSpec::Expectations.configuration
    class Configuration
      # Configures the supported syntax.
      # @param [Array<Symbol>, Symbol] values the syntaxes to enable
      # @example
      #   RSpec.configure do |rspec|
      #     rspec.expect_with :rspec do |c|
      #       c.syntax = :should
      #       # or
      #       c.syntax = :expect
      #       # or
      #       c.syntax = [:should, :expect]
      #     end
      #   end
      def syntax=(values)
        if Array(values).include?(:expect)
          Expectations::Syntax.enable_expect
        else
          Expectations::Syntax.disable_expect
        end

        if Array(values).include?(:should)
          Expectations::Syntax.enable_should
        else
          Expectations::Syntax.disable_should
        end
      end

      # The list of configured syntaxes.
      # @return [Array<Symbol>] the list of configured syntaxes.
      # @example
      #   unless RSpec::Matchers.configuration.syntax.include?(:expect)
      #     raise "this RSpec extension gem requires the rspec-expectations `:expect` syntax"
      #   end
      def syntax
        syntaxes = []
        syntaxes << :should if Expectations::Syntax.should_enabled?
        syntaxes << :expect if Expectations::Syntax.expect_enabled?
        syntaxes
      end

      # Enables the matcher boolean operators `|`, `&`, `!` syntax.
      # @note this feature is only supported if
      def enable_matcher_boolean_operators!
        if ::RUBY_VERSION.to_f < 1.9
          raise NotImplementedError, 'matcher boolean operators is only supported from MRI > 1.9'
        else
          Expectations::Syntax.enable_matcher_boolean_operators
        end
      end

      # Disables the matcher boolean operators `|`, `&`, `!` syntax.
      def disable_matcher_boolean_operators!
        Expectations::Syntax.disable_matcher_boolean_operators
      end

      if ::RSpec.respond_to?(:configuration)
        def color?
          ::RSpec.configuration.color_enabled?
        end
      else
        # Indicates whether or not diffs should be colored.
        # Delegates to rspec-core's color option if rspec-core
        # is loaded; otherwise you can set it here.
        def color=(value)
          @color = value
        end

        # Indicates whether or not diffs should be colored.
        # Delegates to rspec-core's color option if rspec-core
        # is loaded; otherwise you can set it here.
        def color?
          @color
        end
      end

      # Adds `should` and `should_not` to the given classes
      # or modules. This can be used to ensure `should` works
      # properly on things like proxy objects (particular
      # `Delegator`-subclassed objects on 1.8).
      #
      # @param [Array<Module>] modules the list of classes or modules
      #   to add `should` and `should_not` to.
      def add_should_and_should_not_to(*modules)
        modules.each do |mod|
          Expectations::Syntax.enable_should(mod)
        end
      end

      # Sets or gets the backtrace formatter. The backtrace formatter should
      # implement `#format_backtrace(Array<String>)`. This is used
      # to format backtraces of errors handled by the `raise_error`
      # matcher.
      #
      # If you are using rspec-core, rspec-core's backtrace formatting
      # will be used (including respecting the presence or absence of
      # the `--backtrace` option).
      #
      # @!attribute [rw] backtrace_formatter
      attr_writer :backtrace_formatter
      def backtrace_formatter
        @backtrace_formatter ||= if defined?(::RSpec.configuration.backtrace_formatter)
         ::RSpec.configuration.backtrace_formatter
        else
          NullBacktraceFormatter
        end
      end

      # @private
      def reset_syntaxes_to_default
        self.syntax = [:should, :expect]
        RSpec::Expectations::Syntax.warn_about_should!
      end

      # @api private
      # Null implementation of a backtrace formatter used by default
      # when rspec-core is not loaded. Does no filtering.
      NullBacktraceFormatter = Module.new do
        def self.format_backtrace(backtrace)
          backtrace
        end
      end
    end

    # The configuration object.
    # @return [RSpec::Expectations::Configuration] the configuration object
    def self.configuration
      @configuration ||= Configuration.new
    end

    # set default syntax
    configuration.reset_syntaxes_to_default
  end
end

