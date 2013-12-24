module RSpec
  module Matchers
    module BuiltIn
      class BeAnInstanceOf < BaseMatcher
        def match(expected, actual)
          actual.instance_of? expected
        end

        def description
          "be an instance of #{expected}"
        end

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
    end
  end
end
