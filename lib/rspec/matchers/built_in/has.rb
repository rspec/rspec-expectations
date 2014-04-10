module RSpec
  module Matchers
    module BuiltIn
      class Has
        include MatchAliases

        def initialize(expected, *args)
          @expected, @args = expected, args
        end

        def matches?(actual)
          method = predicate(@expected)
          result = actual.__send__(method, *@args)
          check_respond_to(actual, method)
          result
        end

        def failure_message_for_should
          "expected ##{predicate(@expected)}#{failure_message_args_description} to return true, got false"
        end

        def failure_message_for_should_not
          "expected ##{predicate(@expected)}#{failure_message_args_description} to return false, got true"
        end

        def description
          [method_description(@expected), args_description].compact.join(' ')
        end

        private

        def predicate(sym)
          "#{sym.to_s.sub("have_","has_")}?".to_sym
        end

        def method_description(method)
          method.to_s.gsub('_', ' ')
        end

        def args_description
          return nil if @args.empty?
          @args.map { |arg| arg.inspect }.join(', ')
        end

        def failure_message_args_description
          desc = args_description
          "(#{desc})" if desc
        end

        def check_respond_to(actual, method)
          RSpec.deprecate(
            "Matching with #{@expected} on an object that doesn't respond to `#{method}`",
            :replacement => "`respond_to_missing?` or `respond_to?` on your object"
          ) unless actual.respond_to?(method)
        end
      end
    end
  end
end
