module RSpec
  module Matchers
    class << self
      attr_accessor :last_matcher, :last_should # :nodoc:
    end

    def self.clear_generated_description
      self.last_matcher = nil
      self.last_should = nil
    end

    def self.generated_description
      return nil if last_should.nil?
      negative = last_should.to_s =~ /not/
      last_description(negative)
    end
    
  private
    
    def self.last_description(negative=false)
      if last_matcher.respond_to?(:docstrings)
        if negative
          last_matcher.docstrings[:negative]
        else
          last_matcher.docstrings[:positive]
        end
      else 
        last_matcher.respond_to?(:description) ? "#{last_should.to_s.sub("_", " ")} #{last_matcher.description}" : <<-MESSAGE
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
end
      
