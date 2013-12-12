require 'spec_helper'

module RSpec
  module Matchers
    describe "built in matchers" do
      let(:matchers) do
        BuiltIn.constants.map { |n| BuiltIn.const_get(n) }.select do |m|
          m.method_defined?(:matches?) && m.method_defined?(:failure_message)
        end
      end

      specify "they all have defined #=== so they can be composable" do
        missing_threequals = matchers.select do |m|
          m.instance_method(:===).owner == ::Kernel
        end

        # This spec is merely to make sure we don't forget to make
        # a built-in matcher implement `===`. It doesn't check the
        # semantics of that. Use the "an RSpec matcher" shared
        # example group to actually check the semantics.
        expect(missing_threequals).to eq([])
      end

      specify "they all have defined #and and #or so they support compound expectations" do
        noncompound_matchers = matchers.reject do |m|
          m.method_defined?(:and) || m.method_defined?(:or)
        end

        expect(noncompound_matchers).to eq([])
      end
    end
  end
end

