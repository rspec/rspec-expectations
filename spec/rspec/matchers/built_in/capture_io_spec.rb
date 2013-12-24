require 'spec_helper'

module RSpec::Matchers::BuiltIn
  describe CaptureIo do
    describe "expect(actual).to capture_io(expected)" do
      let(:matcher) { capture_io("1") }

      xit "behaves like an RSpec matcher"
      it "has failure mesage " do
        expect(matcher.failure_message).to eq "expected capture_io to be called with stdout."
      end
    end
  end
end

