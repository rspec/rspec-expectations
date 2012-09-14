module RSpec
  module Matchers
    class << self
      attr_accessor :last_matcher, :last_should
    end

    def self.clear_generated_description
      self.last_matcher = nil
      self.last_should = nil
    end

    def self.generated_description
      return nil if last_should.nil?
      mode = last_should.to_s =~ /not/ ? :negative : :positive
      if mode == :positive && last_matcher.respond_to?(:docstring_for_should)
        last_matcher.docstring_for_should
      elsif mode == :negative && last_matcher.respond_to?(:docstring_for_should_not)
        last_matcher.docstring_for_should_not
      elsif last_matcher.respond_to?(:description)
        "#{last_should.to_s.gsub('_',' ')} #{last_matcher.description}"
      else
        no_description_message
      end
    end

  private

    def self.no_description_message
      return <<-MESSAGE
When you call a matcher in an example without a String, like this:

specify { object.should matcher }

or this:

it { should matcher }

RSpec expects the matcher to have a #description method. You should either
add a String to the example this matcher is being used in, or give it a
description method. Then you won't have to suffer this lengthy warning again.
MESSAGE
    end
  end
end
