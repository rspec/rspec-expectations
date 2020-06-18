module RSpec
  module Matchers
    module BuiltIn
      # @api private
      # Provides the implementation for dynamic predicate matchers.
      # Not intended to be inherited directly.
      class DynamicPredicate < BaseMatcher
        include BeHelpers

        if RSpec::Support::RubyFeatures.kw_args_supported?
          binding.eval(<<-CODE, __FILE__, __LINE__)
          def initialize(method_name, *args, **kwargs, &block)
            @method_name, @args, @kwargs, @block = method_name, args, kwargs, block
          end
          CODE
        else
          def initialize(method_name, *args, &block)
            @method_name, @args, @block = method_name, args, block
          end
        end

        # @private
        def matches?(actual, &block)
          @actual = actual
          @block ||= block
          predicate_accessible? && predicate_matches?
        end

        # @private
        def does_not_match?(actual, &block)
          @actual = actual
          @block ||= block
          predicate_accessible? && !predicate_matches?
        end

        # @api private
        # @return [String]
        def failure_message
          failure_message_expecting(true)
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          failure_message_expecting(false)
        end

        # @api private
        # @return [String]
        def description
          "#{method_description}#{args_to_sentence}"
        end

      private

        def predicate_accessible?
          @actual.respond_to? predicate
        end

        # support 1.8.7, evaluate once at load time for performance
        if String === methods.first
          # :nocov:
          def private_predicate?
            @actual.private_methods.include? predicate.to_s
          end
          # :nocov:
        else
          def private_predicate?
            @actual.private_methods.include? predicate
          end
        end

        if RSpec::Support::RubyFeatures.kw_args_supported?
          binding.eval(<<-CODE, __FILE__, __LINE__)
          def predicate_result
            if @kwargs.empty?
              @predicate_result = actual.__send__(predicate_method_name, *@args, &@block)
            else
              @predicate_result = actual.__send__(predicate_method_name, *@args, **@kwargs, &@block)
            end
          end
          CODE
        else
          def predicate_result
            @predicate_result = actual.__send__(predicate_method_name, *@args, &@block)
          end
        end

        def predicate_method_name
          predicate
        end

        def predicate_matches?
          !!predicate_result
        end

        def root
          # On 1.9, there appears to be a bug where String#match can return `false`
          # rather than the match data object. Changing to Regex#match appears to
          # work around this bug. For an example of this bug, see:
          # https://travis-ci.org/rspec/rspec-expectations/jobs/27549635
          self.class::REGEX.match(@method_name.to_s).captures.first
        end

        def method_description
          EnglishPhrasing.split_words(@method_name)
        end

        def failure_message_expecting(value)
          validity_message ||
            "expected `#{actual_formatted}.#{predicate}#{args_to_s}` to return #{value}, got #{description_of @predicate_result}"
        end

        def validity_message
          return nil if predicate_accessible?

          "expected #{actual_formatted} to respond to `#{predicate}`#{failure_to_respond_explanation}"
        end

        def failure_to_respond_explanation
          if private_predicate?
            " but `#{predicate}` is a private method"
          end
        end
      end

      # @api private
      # Provides the implementation for `has_<predicate>`.
      # Not intended to be instantiated directly.
      class Has < DynamicPredicate
        # :nodoc:
        REGEX = Matchers::HAS_REGEX

        # @api private
        # @return [String]
        def failure_message
          validity_message || "expected ##{predicate}#{failure_message_args_description} to return true, got false"
        end

        # @api private
        # @return [String]
        def failure_message_when_negated
          validity_message || "expected ##{predicate}#{failure_message_args_description} to return false, got true"
        end

        # @api private
        # @return [String]
        def description
          [method_description, args_description].compact.join(' ')
        end

      private

        def args_description
          return nil if @args.empty?
          @args.map { |arg| RSpec::Support::ObjectFormatter.format(arg) }.join(', ')
        end

        def failure_message_args_description
          desc = args_description
          "(#{desc})" if desc
        end

        def predicate
          @predicate ||= :"has_#{root}?"
        end
      end

      # @api private
      # Provides the implementation of `be_<predicate>`.
      # Not intended to be instantiated directly.
      class BePredicate < DynamicPredicate
        # :nodoc:
        REGEX = Matchers::BE_PREDICATE_REGEX
      private
        def predicate
          @predicate ||= :"#{root}?"
        end

        def predicate_method_name
          actual.respond_to?(predicate) ? predicate : present_tense_predicate
        end

        def failure_to_respond_explanation
          super || if predicate == :true?
                     " or perhaps you meant `be true` or `be_truthy`"
                   elsif predicate == :false?
                     " or perhaps you meant `be false` or `be_falsey`"
                   end
        end

        def predicate_accessible?
          super || actual.respond_to?(present_tense_predicate)
        end

        def present_tense_predicate
          :"#{root}s?"
        end
      end
    end
  end
end
