require 'spec_helper'

module RSpec
  module Matchers
    describe Pretty do
      describe "#_pretty_print" do
        include Pretty

        it 'is deprecated' do
          expect_deprecation_with_call_site(__FILE__, __LINE__ + 1, /_pretty_print/)
          _pretty_print([1, 2])
        end
      end
    end
  end
end

