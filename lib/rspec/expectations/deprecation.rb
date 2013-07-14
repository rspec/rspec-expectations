module RSpec
  module Expectations
    module Deprecation
      # @private
      #
      # Used internally to print deprecation warnings
      def deprecate(deprecated, options={})
        call_site = caller.find { |line| line !~ %r{/lib/rspec/(core|mocks|expectations|matchers|rails)/} }
        call_site ||= caller(0)[2]

        message = "DEPRECATION: #{deprecated} is deprecated."
        message << " Use #{options[:replacement]} instead." if options[:replacement]
        message << " Called from #{call_site}."
        warn message
      end
    end
  end

  extend(Expectations::Deprecation) unless respond_to?(:deprecate)
end
