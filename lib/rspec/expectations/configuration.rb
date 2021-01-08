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
      # @private
      FALSE_POSITIVE_BEHAVIOURS =
        {
          :warn    => lambda { |message| RSpec.warning message },
          :raise   => lambda { |message| raise ArgumentError, message },
          :nothing => lambda { |_| true },
        }

      def initialize
        @on_potential_false_positives = :warn
        @strict_predicate_matchers = true
      end

      # Configures the maximum character length that RSpec will print while
      # formatting an object. You can set length to nil to prevent RSpec from
      # doing truncation.
      # @param [Fixnum] length the number of characters to limit the formatted output to.
      # @example
      #   RSpec.configure do |rspec|
      #     rspec.expect_with :rspec do |c|
      #       c.max_formatted_output_length = 200
      #     end
      #   end
      def max_formatted_output_length=(length)
        RSpec::Support::ObjectFormatter.default_instance.max_formatted_output_length = length
      end

      if ::RSpec.respond_to?(:configuration)
        def color?
          ::RSpec.configuration.color_enabled?
        end
      else
        # Indicates whether or not diffs should be colored.
        # Delegates to rspec-core's color option if rspec-core
        # is loaded; otherwise you can set it here.
        attr_writer :color

        # Indicates whether or not diffs should be colored.
        # Delegates to rspec-core's color option if rspec-core
        # is loaded; otherwise you can set it here.
        def color?
          defined?(@color) && @color
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

      # Sets if custom matcher descriptions and failure messages
      # should include clauses from methods defined using `chain`.
      # @param value [Boolean]
      attr_writer :include_chain_clauses_in_custom_matcher_descriptions

      # Indicates whether or not custom matcher descriptions and failure messages
      # should include clauses from methods defined using `chain`. It is
      # false by default for backwards compatibility.
      def include_chain_clauses_in_custom_matcher_descriptions?
        @include_chain_clauses_in_custom_matcher_descriptions ||= false
      end

      # @api private
      # Null implementation of a backtrace formatter used by default
      # when rspec-core is not loaded. Does no filtering.
      NullBacktraceFormatter = Module.new do
        def self.format_backtrace(backtrace)
          backtrace
        end
      end

      # Configures whether RSpec will warn about matcher use which will
      # potentially cause false positives in tests.
      #
      # @param [Boolean] boolean
      def warn_about_potential_false_positives=(boolean)
        if boolean
          self.on_potential_false_positives = :warn
        elsif warn_about_potential_false_positives?
          self.on_potential_false_positives = :nothing
        else
          # no-op, handler is something else
        end
      end
      #
      # Configures what RSpec will do about matcher use which will
      # potentially cause false positives in tests.
      #
      # @param [Symbol] behavior can be set to :warn, :raise or :nothing
      def on_potential_false_positives=(behavior)
        unless FALSE_POSITIVE_BEHAVIOURS.key?(behavior)
          raise ArgumentError, "Supported values are: #{FALSE_POSITIVE_BEHAVIOURS.keys}"
        end
        @on_potential_false_positives = behavior
      end

      # Configures RSpec to check the values returned by predicate matchers
      # to be exactly true/false (strict), or truthy/falsey (not strict).
      # Before RSpec 4, the default was `false`.
      def strict_predicate_matchers=(flag)
        raise ArgumentError, "Pass `true` or `false`" unless flag == true || flag == false
        @strict_predicate_matchers = flag
      end

      attr_reader :strict_predicate_matchers

      def strict_predicate_matchers?
        @strict_predicate_matchers
      end

      # Indicates what RSpec will do about matcher use which will
      # potentially cause false positives in tests, generally you want to
      # avoid such scenarios so this defaults to `true`.
      attr_reader :on_potential_false_positives

      # Indicates whether RSpec will warn about matcher use which will
      # potentially cause false positives in tests, generally you want to
      # avoid such scenarios so this defaults to `true`.
      def warn_about_potential_false_positives?
        on_potential_false_positives == :warn
      end

      # @private
      def false_positives_handler
        FALSE_POSITIVE_BEHAVIOURS.fetch(@on_potential_false_positives)
      end
    end

    # The configuration object.
    # @return [RSpec::Expectations::Configuration] the configuration object
    def self.configuration
      @configuration ||= Configuration.new
    end
  end
end
