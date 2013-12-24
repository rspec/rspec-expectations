require 'stringio'

module RSpec
  module Matchers
    module BuiltIn
      class CaptureIo < BaseMatcher
        def initialize(expected)
          @expected = expected
        end

        def matches?
          capture_io
        end

        def failure_message
          "expected capture_io to be called with stdout."
        end

        private
        def capture_io
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

      def capture_io(expected)
        Capture_io.new(expected)
      end
    end
  end
end
