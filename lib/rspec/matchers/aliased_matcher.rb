module RSpec
  module Matchers
    # Decorator that wraps a matcher and overrides `description`
    # using the provided block in order to support an alias
    # of a matcher. This is intended for use when composing
    # matchers, so that you can use an expression like
    # `include( a_value_within(0.1).of(3) )` rather than
    # `include( be_within(0.1).of(3) )`, and have the corresponding
    # description read naturally.
    #
    # @api private
    class AliasedMatcher < MatcherDelegator
      def initialize(base_matcher, description_block)
        @description_block = description_block
        super(base_matcher)
      end

      # Forward messages on to the wrapped matcher.
      # Since many matchers provide a fluent interface
      # (e.g. `a_value_within(0.1).of(3)`), we need to wrap
      # the returned value if it responds to `description`,
      # so that our override can be applied when it is eventually
      # used.
      def method_missing(*)
        return_val = super
        return return_val unless RSpec::Matchers.is_a_matcher?(return_val)
        self.class.new(return_val, @description_block)
      end

      # Provides the description of the aliased matcher. Aliased matchers
      # are designed to behave identically to the original matcher except
      # for the description and failure messages. The description is different
      # to reflect the aliased name.
      #
      # @api private
      def description
        @description_block.call(super)
      end

      # Provides the failure_message of the aliased matcher. Aliased matchers
      # are designed to behave identically to the original matcher except
      # for the description and failure messages. The failure_message is different
      # to reflect the aliased name.
      #
      # @api private
      def failure_message
        @description_block.call(super, true)
      end

      # Provides the failure_message_when_negated of the aliased matcher. Aliased matchers
      # are designed to behave identically to the original matcher except
      # for the description and failure messages. The failure_message_when_negated is different
      # to reflect the aliased name.
      #
      # @api private
      def failure_message_when_negated
        @description_block.call(super, true)
      end
    end

    # Decorator used for matchers that have special implementations of
    # operators like `==` and `===`.
    # @private
    class AliasedMatcherWithOperatorSupport < AliasedMatcher
      # We undef these so that they get delegated via `method_missing`.
      undef ==
      undef ===
    end

    # @private
    class AliasedNegatedMatcher < AliasedMatcher
      def matches?(*args, &block)
        if @base_matcher.respond_to?(:does_not_match?)
          @base_matcher.does_not_match?(*args, &block)
        else
          !super
        end
      end

      def does_not_match?(*args, &block)
        @base_matcher.matches?(*args, &block)
      end

      def failure_message
        optimal_failure_message(__method__, :failure_message_when_negated)
      end

      def failure_message_when_negated
        optimal_failure_message(__method__, :failure_message)
      end

    private

      DefaultFailureMessages = BuiltIn::BaseMatcher::DefaultFailureMessages

      # For a matcher that uses the default failure messages, we prefer to
      # use the override provided by the `description_block`, because it
      # includes the phrasing that the user has expressed a preference for
      # by going through the effort of defining a negated matcher.
      #
      # However, if the override didn't actually change anything, then we
      # should return the opposite failure message instead -- the overriden
      # message is going to be confusing if we return it as-is, as it represents
      # the non-negated failure message for a negated match (or vice versa).
      def optimal_failure_message(same, inverted)
        if DefaultFailureMessages.has_default_failure_messages?(@base_matcher)
          base_message = @base_matcher.__send__(same)
          overriden    = @description_block.call(base_message, true)
          return overriden if overriden != base_message
        end

        @base_matcher.__send__(inverted)
      end
    end

    # Wrapper around an overriden description for an aliased
    # matcher.
    #
    # @api private
    class AliasDescription
      def initialize(new_name, old_name, override_block)
        @new_name = new_name
        @old_name = old_name
        @override_block = override_block
      end

      # Creates the overriden description.
      #
      # @api private
      def call(old_desc, replace_after_start=false)
        if @override_block
          @override_block.call(old_desc)
        else
          default_description(old_desc, replace_after_start)
        end
      end

    private

      # Generates a default message when no block is provided
      # when aliasing the matcher. Replaces instances of the old
      # matcher's name with the new matcher's name where
      # applicable.
      #
      # #api private
      def default_description(old_desc, replace_after_start)
        old_name_split = EnglishPhrasing.split_words(@old_name)

        if old_desc.start_with?(old_name_split) || replace_after_start
          old_desc.sub(old_name_split, EnglishPhrasing.split_words(@new_name))
        else
          old_desc
        end
      end
    end
  end
end
