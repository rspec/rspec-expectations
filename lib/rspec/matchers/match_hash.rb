require 'term/ansicolor'

module RSpec
  module Matchers
    class MatchHash
      def initialize(expected)
        @expected = expected
      end

      def matches?(actual)
        @difference = Diff.diff(actual, @expected)
        @difference.match?
      end

      def failure_message_for_should
        @difference.to_s
      end
    end

    OperatorMatcher.register(Hash, '=~', RSpec::Matchers::MatchHash)

    def be_hash_matching(expected)
      Matcher.new :be_hash_matching, expected do |_expected_|
        match do |actual|
          @difference = Diff.diff(actual, _expected_)
          @difference.match?
        end

        failure_message_for_should do
          @difference.to_s
        end
      end
    end

    def be_hash_partially_matching(expected)
      Matcher.new :be_hash_partially_matching, expected do |_expected_|
        match do |actual|
          @difference = Diff.diff(actual, _expected_)
          @difference.partial_match?
        end

        failure_message_for_should do
          @difference.to_s
        end
      end
    end
  end
end

module Diff
  def self.diff expected, actual
    case expected
    when Array; ArrayDiffer
    when Hash ; HashDiffer
    else DefaultDiffer
    end.new(expected, actual)
  end

  class BaseDiff
    include Term::ANSIColor
    attr_reader :expected, :actual

    def self.diff(expected, actual)
      new(expected, actual)
    end

    def initialize(expected, actual)
      @expected = expected
      @actual = actual
    end

    def match?
      expected == actual
    end

    def partial_match?
      match?
    end

    def matched_to_s(item)
      yellow "~ #{bold item}"
    end

    def missing_to_s(item)
      red "- #{bold item}"
    end

    def additional_to_s(item)
      green "+ #{bold item}"
    end

    def indent(item)
      item.split("\n").map {|s| "  #{s}"}.join("\n")
    end
  end


  class HashDiffer < BaseDiff
    def match?
      diffed_wrong_values.size + missing_items.size + additional_items.size == 0
    end

    def partial_match?
      diffed_wrong_values(:partial_match?).size + missing_items.size == 0
    end

    def to_s
      reset("{\n") +
      (
        diffed_correct_values.map {|ck, cv| indent          "#{ck.inspect} => #{cv}"} +
        diffed_wrong_values.map   {|wk, wv| indent          "#{wk.inspect} => #{wv}"} +
        missing_items.map         {|mk, mv| missing_to_s    "#{mk.inspect} => #{mv.inspect}"} +
        additional_items.map      {|ak, av| additional_to_s "#{ak.inspect} => #{av.inspect}"}
      ).join(reset ",\n") +
      reset("\n") +
      "}\n"
    end

    def missing_items
      Hash[actual.select {|k, v| !expected.keys.include? k}]
    end

    def additional_items
      Hash[expected.select {|k, v| !actual.keys.include? k}]
    end

    def diffed_correct_values
      _diffed_values(:match?, false)
    end

    def diffed_wrong_values(match_method = :match?)
      _diffed_values(match_method, true)
    end

    private

    def _diffed_values(match_method, not_match)
      actual.inject({}) {|h, (k, v)|
        diff = Diff.diff(expected[k], v)
        h[k] = diff if expected.keys.include?(k) && (not_match ? !diff.send(match_method) : diff.send(match_method))
        h
      }
    end
  end


  class ArrayDiffer < BaseDiff
    def match?
      # refactor this with pretty_items
      m = true
      actual.each_with_index do |item, index|
        if additional? index, item
          m = false
        elsif !(correct?(index, item))
          m = false
        end
      end
      if expected.size > actual.size
        expected.slice(actual.size..-1).each do |item|
          m = false
        end
      end
      m
    end

    def to_s
      reset("[") + pretty_items.join(", ") + "]"
    end

    private

    def pretty_items
      [].tap do |l|
        actual.each_with_index do |item, index|
          if additional? index, item
            l << missing_to_s(item.inspect)
          elsif correct? index, item
            l << item.inspect
          else
            l << Diff.diff(expected[index], item)
          end
        end
        if expected.size > actual.size
          expected.slice(actual.size..-1).each do |item|
            l << additional_to_s(item.inspect)
          end
        end
      end
    end

    def additional? index, value
      index >= expected.size
    end

    def correct? index, value
      Diff.diff(expected[index], value).match?
    end
  end


  class DefaultDiffer < BaseDiff
    def match?
      if actual.is_a?(Regexp) 
        expected.is_a?(String) ? !!expected.match(actual) : !!expected.inspect.match(actual)
      else
        expected == actual
      end
    end

    def to_s
      # refactor
      match? ? expected_to_s : missing_to_s(@actual.inspect) + expected_to_s
    end

    def expected_to_s
      if match?
        @actual.is_a?(Regexp) ? matched_to_s(@expected.sub(@actual, "[#{@expected[@actual, 0]}]")) : @expected.inspect
      else
        @actual.is_a?(Regexp) ? matched_to_s(@expected.sub(@actual, "[#{@expected[@actual, 0]}]")) : additional_to_s(@expected.inspect)
      end
    end
  end
end
