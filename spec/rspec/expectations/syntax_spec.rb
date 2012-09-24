require 'spec_helper'

module RSpec
  module Expectations
    module Syntax
      describe "the should and should_not expectations" do
        describe "#should" do
          it "raises an error when message isn't a string" do
            lambda {3.should eq(3), :not_a_string}.should raise_error
          end

          it "doesn't raise an error when message is a string" do
            lambda {3.should eq(3), "a string"}.should_not raise_error
          end
        end

        describe "#should_not" do
          it "raises an error when message isn't a string" do
            lambda {3.should_not eq(4), :not_a_string}.should raise_error
          end

          it "doesn't raise an error when message is a string" do
            lambda {3.should_not eq(4), "a string"}.should_not raise_error
          end
        end
      end
    end
  end
end
