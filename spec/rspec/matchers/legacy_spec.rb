require 'spec_helper'

module RSpec
  module Matchers
    describe "Legacy matchers" do
      shared_examples_for "a matcher written against a legacy protocol" do |matcher_class|
        matcher = matcher_class.new
        before { allow_deprecation }

        context 'when matched positively' do
          it 'returns the positive expectation failure message' do
            expect {
              expect(false).to matcher
            }.to fail_with("failure when positive")
          end
        end

        context 'when matched negatively' do
          it 'returns the negative expectation failure message' do
            expect {
              expect(true).not_to matcher
            }.to fail_with("failure when negative")
          end

          it 'calls `does_not_match?` if it is defined on the matcher' do
            $log = true
            called = false
            with_does_not_match = Class.new(matcher_class) do
              define_method(:does_not_match?) { |actual| called = true; !actual }
            end.new

            expect(false).not_to with_does_not_match
            expect(called).to be true
          end
        end
      end

      context "written using the RSpec 2.x `failure_message_for_should` and `failure_message_for_should_not` protocol" do
        matcher_class = Class.new do
          def matches?(actual); actual; end
          def failure_message_for_should; "failure when positive"; end
          def failure_message_for_should_not; "failure when negative"; end
        end

        it_behaves_like "a matcher written against a legacy protocol", matcher_class
      end
    end
  end
end

