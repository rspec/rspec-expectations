# encoding: UTF-8

require 'spec_helper'
require 'date'

module RSpec
  module Matchers
    describe "eq" do
      it_behaves_like "an RSpec matcher", :valid_value => 1, :invalid_value => 2 do
        let(:matcher) { eq(1) }
      end

      it "is diffable" do
        expect(eq(1)).to be_diffable
      end

      it "matches when actual == expected" do
        expect(1).to eq(1)
      end

      it "does not match when actual != expected" do
        expect(1).not_to eq(2)
      end

      it "compares by sending == to actual (not expected)" do
        called = false
        actual = Class.new do
          define_method :== do |other|
            called = true
          end
        end.new

        expect(actual).to eq :anything # to trigger the matches? method
        expect(called).to be_truthy
      end

      it "describes itself" do
        matcher = eq(1)
        matcher.matches?(1)
        expect(matcher.description).to eq "eq 1"
      end

      it "provides message, expected and actual on #failure_message" do
        matcher = eq("1")
        matcher.matches?(1)
        expect(matcher.failure_message_for_should).to eq "\nexpected: \"1\"\n     got: 1\n\n(compared using ==)\n"
      end

      it "provides message, expected and actual on #negative_failure_message" do
        matcher = eq(1)
        matcher.matches?(1)
        expect(matcher.failure_message_for_should_not).to eq "\nexpected: value != 1\n     got: 1\n\n(compared using ==)\n"
      end

      it 'fails properly when the actual is an array of multiline strings' do
        expect {
          expect(["a\nb", "c\nd"]).to eq([])
        }.to fail_matching("expected: []")
      end

      it 'includes microseconds for Time objects' do
        t1 = Time.gm(2000)
        t2 = Time.gm(2000, 1, 1, 0, 0, 0, 1)
        matcher = eq(t1)
        matcher.matches?(t2)
        expect(matcher.failure_message_for_should).to include(
          "#{t1.inspect} (+ 000000 μs)",
          "#{t2.inspect} (+ 000001 μs)"
        )
      end

      it 'includes microseconds for DateTime objects' do
        dt1 = DateTime.new(2000)
        dt2 = DateTime.new(2000, 1, 2)
        matcher = eq(dt1)
        matcher.matches?(dt2)
        expect(matcher.failure_message_for_should).to include(
          "#{dt1.inspect} (+ 000000 μs)",
          "#{dt2.inspect} (+ 000000 μs)"
        )
      end

      it 'falls back to `inspect` when not a Time and DateTime is not defined' do
        matcher = eq("hi")
        matcher.matches?("there")
        hide_const("DateTime")
        expect(matcher.failure_message_for_should).to include(
          "hi",
          "there"
        )
      end
    end
  end
end

