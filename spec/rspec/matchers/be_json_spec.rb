require 'spec_helper'

module Rspec
  module Matchers

    shared_examples_for "a json matcher" do
      it "passes if matches" do
        actual.should be_json_matching expected
      end

      it "fails if doesn't match" do
        lambda { failing.should be_json_matching expected }.should fail_with failure_message
      end
    end

    describe "actual.should be_json_matching(expected)" do

      # Assume the match_hash matcher works, so don't need a bunch of test cases.
      context "a json string against a regex" do
        let(:expected       ) {  { 'x' => {'a' => /[A-Z]{3}/ } }  }
        let(:actual         ) { '{ "x" :  {"a" :  "ABC"      } }' }
        let(:failing        ) { '{ "x" :  {"a" :  "123"      } }' }
        let(:failure_message) {
          paint "\e[0m{\n  \"x\" => {\n    \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m~ \e[1m123\e[0m\n  }\n}\n"
        }

        it_should_behave_like "a json matcher"
      end
    end

    describe "actual.should be_json_partially_matching(expected)" do

      # Assume the match_hash matcher works, so don't need a bunch of test cases.
      context "a json string against a regex" do
        let(:expected       ) {  { 'x' => { 'a' => /[A-Z]{3}/           } }  }
        let(:actual         ) { '{ "x" :  { "a" : "ABC"       , "b" : 1 } }' }
        let(:failing        ) { '{ "x" :  { "a" : "abc"       , "b" : 1 } }' }
        let(:failure_message) {
          paint "\e[0m{\n  \"x\" => {\n    \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m~ \e[1mabc\e[0m,\n  \e[32m+ \e[1m\"b\" => 1\e[0m\n  }\n}\n"
        }

				it "passes if include" do
					actual.should be_json_partially_matching expected
				end

				it "fails if doesn't include" do
					lambda { failing.should be_json_partially_matching expected }.should fail_with failure_message
				end
      end
    end
  end
end
