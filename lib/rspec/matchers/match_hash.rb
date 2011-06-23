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
  end
end

module Diff
  def self.diff left, right
    differ_name = "#{left.class}Differ"
    differ = Diff.constants.map(&:to_s).include?(differ_name) ? Diff.const_get(differ_name) : Diff::DefaultDiffer
    differ.new left, right
  end

  class BaseDiff
    include Term::ANSIColor
    attr_reader :left, :right

    def self.diff left, right
      new left, right
    end

    def initialize left, right
      @left = left
      @right = right
    end

    def match?
      left == right
    end

    def missing_to_s(item)
      red "- #{bold item}"
    end

    def additional_to_s(item)
      green "+ #{bold item}"
    end

    def indent str
      str.split("\n").map {|s| "  #{s}"}.join("\n")
    end
  end

  class HashDiffer < BaseDiff
    def match?
      diffed_wrong_values.size + missing_items.size + additional_items.size == 0
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

    private

    def correct_values
      Hash[right.select {|k, v| (right.keys & left.keys).include?(k) && Diff.diff(left[k], v).match? }]
    end

    def diffed_correct_values
      Hash[correct_values.map {|k, v| [k, Diff.diff(left[k], v)]}]
    end

    def missing_items
      Hash[right.select {|k, v| !left.keys.include? k}]
    end

    def additional_items
      Hash[left.select {|k, v| !right.keys.include? k}]
    end

    def wrong_values
      Hash[right.select {|k, v| (right.keys & left.keys).include?(k) && !Diff.diff(left[k], v).match?} ]
    end

    def diffed_wrong_values
      Hash[wrong_values.map {|k, v| [k, Diff.diff(left[k], v)]}]
    end
  end

  class ArrayDiffer < BaseDiff
    def match?
      # refactor this with pretty_items
      m = true
      right.each_with_index do |item, index|
        if additional? index, item
          m = false
        elsif !(correct?(index, item))
          m = false
        end
      end
      if left.size > right.size
        left.slice(right.size..-1).each do |item|
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
        right.each_with_index do |item, index|
          if additional? index, item
            l << missing_to_s(item.inspect)
          elsif correct? index, item
            l << item.inspect
          else
            l << Diff.diff(left[index], item)
          end
        end
        if left.size > right.size
          left.slice(right.size..-1).each do |item|
            l << additional_to_s(item.inspect)
          end
        end
      end
    end

    def additional? index, value
      index >= left.size
    end

    def correct? index, value
      Diff.diff(left[index], value).match?
    end
  end

  class DefaultDiffer < BaseDiff
    def match?
      result = if right.is_a?(Regexp) 
        left.is_a?(String) ? !!left.match(right) : !!left.inspect.match(right)
      else
        left == right
      end
      result
    end

    def to_s
      match? ? left_to_s : missing_to_s(right_to_s) + additional_to_s(left_to_s)
    end

    def matched_to_s
      '"'+@left.sub(@right, yellow(bold(@left[@right, 0])))+'"'
    end

    def left_to_s
      @right.is_a?(Regexp) ? matched_to_s : @left.inspect
    end

    def right_to_s
      @right.inspect
    end
  end
end
