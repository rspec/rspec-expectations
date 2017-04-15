require 'stringio'

module RSpec
  module Matchers
    module BuiltIn
      class Couple < BaseMatcher
        def initialize(expected)
          @expected = expected
        end

        def matches?
          output_to_stream
        end

        def failure_message
          "expected capture_io to be called with stdout."
        end

        private
        def output_to_stream
          captured_stdout, captured_stderr = StringIO.new, StringIO.new

          orig_stdout, orig_stderr = $stdout, $stderr
          $stdout, $stderr         = captured_stdout, captured_stderr

          yield

          return captured_stdout.string, captured_stderr.string

        ensure
          $stdout = orig_stdout
          $stderr = orig_stderr
        end
      end

      def output_to_stdout(expected)
        Couple.new(expected)
      end

      def output_to_stderr(expected)
        Couple.new(expected)
      end
    end
  end
end
