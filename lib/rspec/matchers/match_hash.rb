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
        @difference.details
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
          @difference.details
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
          @difference.details
        end
      end
    end
  end
end

module Diff
  #DEFAULT_ITEM_TYPES = [:incorrect, :missing, :additional]  # ie. Don't show the correct items, just show what's to different
  DEFAULT_ITEM_TYPES = [:correct, :incorrect, :missing, :additional]

  def self.diff expected, actual
    differ = case [expected.class, actual.class]
    when [Array, Array]; ArrayDiffer
    when [Hash , Hash ]; HashDiffer
    else DefaultDiffer
    end.new(expected, actual)
  end

  class BaseDiff
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

    def indent(item)
      item.split("\n").map {|s| "  #{s}"}.join("\n")
    end

    def show(*item_types)
      to_s
    end

    def markup(item_type, item)
      color, prefix = color_scheme[item_type]
      "#{color}#{prefix+' ' if color}#{bold if color and item_type != :match_regex}#{reset if item_type == :match_regex}#{item}#{reset if color}"
    end

    private
    def bold ; "\e[1m"; end
    def reset; "\e[0m"; end
    def color_scheme
      {
        :missing       => ["\e[31m", "-"],
        :additional    => ["\e[32m", "+"],
        :match_regex   => ["\e[33m", "~"],
        :match_class   => ["\e[34m", ":"],
        :match_proc    => ["\e[36m", "{"]
      }
    end
  end


  class HashDiffer < BaseDiff
    def match?
      incorrect_items(:match?).size + missing_items.size + additional_items.size == 0
    end

    def partial_match?
      incorrect_items(:partial_match?).size + missing_items.size == 0
    end

    def show(*item_types)
      items = []
      items += correct_items(*item_types).map             {|ck, cv| indent               "#{ck.inspect} => #{cv}"        } if item_types.include? :correct
      items += incorrect_items(:match?, *item_types).map  {|ik, iv| indent               "#{ik.inspect} => #{iv}"        } if item_types.include? :incorrect
      items += missing_items.map                          {|mk, mv| markup :missing    , "#{mk.inspect} => #{mv.inspect}"} if item_types.include? :missing
      items += additional_items.map                       {|ak, av| markup :additional , "#{ak.inspect} => #{av.inspect}"} if item_types.include? :additional
      "{\n#{items.join(",\n")}\n}\n"
    end

    def to_s
      show(*DEFAULT_ITEM_TYPES)
    end

    def details
      msg = "\e[0m" + to_s.split("\n").join("\n\e[0m")
      where = [:missing, :additional, :match_regex, :match_class, :match_proc].collect { |item_type|
        color, prefix = color_scheme[item_type]
        count = msg.scan("#{color}#{prefix}").size
        "#{color}#{prefix} #{bold}#{count} #{item_type}#{reset}" if count > 0
      }.compact.join(", ")
      msg <<  "\nWhere, #{where}" if where.size > 0

      RSpec.configuration.color_enabled? ? msg : msg.gsub(/\e\[\d+m/, "")
    end

    def missing_items
      Hash[actual.select {|k, v| !expected.keys.include? k}]
    end

    def additional_items
      Hash[expected.select {|k, v| !actual.keys.include? k}]
    end

    def correct_items(*item_types)
      _diffed_values(:match?, false, *item_types)
    end

    def incorrect_items(match_method = :match?, *item_types)
      _diffed_values(match_method, true, *item_types)
    end

    private

    def _diffed_values(match_method, not_match, *item_types)
      item_types = [:correct, :incorrect, :missing, :additional] if item_types.size == 0
      actual.inject({}) {|h, (k, v)|
        diff = Diff.diff(expected[k], v)
        h[k] = diff.show(*item_types) if expected.keys.include?(k) && (not_match ? !diff.send(match_method) : diff.send(match_method))
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

    def partial_match?
      #(expected.size == actual.size) && actual.each_with_index { |item, index| partially_correct?(index, item) }.all?  # XXX should use something like this
      to_s.scan(color_scheme[:missing].join('')).size == 0                                                              # but this is working 'for now'
    end

    def to_s
      "[" + pretty_items.join(", ") + "]"
    end

    private

    # refactor this
    def pretty_items
      [].tap do |l|
        actual.each_with_index do |item, index|
          if additional? index, item
            l << markup(:missing, item.inspect)
          else
            l << Diff.diff(expected[index], item)
          end
        end
        if expected.size > actual.size
          expected.slice(actual.size..-1).each do |item|
            l << markup(:additional, item.inspect)
          end
        end
      end
    end

    def additional? index, value
      index >= expected.size
    end

    def partially_correct? index, value
      Diff.diff(expected[index], value).partial_match?
    end

    def correct? index, value
      Diff.diff(expected[index], value).match?
    end
  end


  class DefaultDiffer < BaseDiff
    def match?
      case match_with
      when :match_regex
        expected.is_a?(String) ? !!expected.match(actual) : !!expected.inspect.match(actual)
      when :match_proc
        actual.call(expected)
      when :match_class
        expected.is_a?(actual)
      when :match_object
        expected == actual
      else
        raise "Shouldn't get here"
      end
    end

    def to_s
      # refactor
      match? ? expected_to_s : markup(:missing, @actual.inspect) + expected_to_s
    end

    def expected_to_s
      if match?
        color, prefix = color_scheme[:match_regex]
        markup(match_with, @actual.is_a?(Regexp) ? (@expected.is_a?(String) and not @expected.nil?) ? @expected.sub(@actual, "#{color}(\e[1m#{@expected[@actual, 0]}#{reset}#{color})#{reset}") : @expected.inspect : @expected.inspect)
      else
        markup(:additional, (@actual.is_a?(Regexp) and @actual.is_a?(String) and not @expected.nil?) ? @expected.sub(@actual, "[#{@expected[@actual, 0]}]") : @expected.inspect)
      end
    end

    private
    def match_with
      @match_with ||= if actual.is_a?(Regexp)
        :match_regex
      elsif actual.is_a?(Proc)
        :match_proc
      elsif actual.is_a?(Class)
        :match_class
      else
        :match_object
      end
    end
  end
end
