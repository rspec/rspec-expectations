require 'spec_helper'

module RSpec
  module Expectations
    module Syntax
      class ToStrExampleObject
        def to_str
          return "`to_str` example object instance"
        end
      end


      describe "the should and should_not expectations" do
        describe "#should" do
          it "raises an error when the message object doesn't implement `to_str`" do
            expect {3.should eq(3), :not_a_string}.to raise_error /The value passed as the message/
          end

          it "doesn't raise an error when message is a string" do
            expect {3.should eq(3), "a string"}.to_not raise_error /The value passed as the message/
          end

          it "doesn't raise an error when the message object implements `to_str`" do
            expect {3.should eq(3), ToStrExampleObject.new}.to_not raise_error /The value passed as the message/
          end
        end

        describe "#should_not" do
          it "raises an error when the message object doesn't implement `to_str`" do
            expect {3.should_not eq(4), :not_a_string}.to raise_error /The value passed as the message/
          end

          it "doesn't raise an error when message is a string" do
            expect {3.should_not eq(4), "a string"}.to_not raise_error /The value passed as the message/
          end

          it "doesn't raise an error when the message object implements `to_str`" do
            expect {3.should_not eq(4), ToStrExampleObject.new}.to_not raise_error /The value passed as the message/
          end
        end
      end
    end
  end
end
