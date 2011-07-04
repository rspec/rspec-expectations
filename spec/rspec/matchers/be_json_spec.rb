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
      context "a json string matched against a hash with a regex" do
        let(:expected       ) {  { 'x' => {'a' => /[A-Z]{3}/ } }  }
        let(:actual         ) { '{ "x" :  {"a" :  "ABC"      } }' }
        let(:failing        ) { '{ "x" :  {"a" :  "123"      } }' }
        let(:failure_message) {
          "\e[0m{\n\e[0m  \"x\" => {\n\e[0m    \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[32m+ \e[1m\"123\"\e[0m\n\e[0m  }\n\e[0m}\nWhere, \e[31m- \e[1m1 missing\e[0m, \e[32m+ \e[1m1 additional\e[0m"
        }

        it_should_behave_like "a json matcher"
      end

      context "a hash matched against a hash with a regex" do
        let(:expected       ) {  { 'x' => {'a' => "ABC" } }  }
        let(:failing        ) {  { 'x' => {'a' => "ABC" } }  }

        it "should raise an exception about not using a JSON String" do
          lambda { failing.should be_json_matching expected }.should raise_error /can't convert Hash into String/
        end
      end

      context "a hash partially matched against a hash with a regex" do
        let(:expected       ) {  { 'x' => {'a' => "ABC" } }  }
        let(:failing        ) {  { 'x' => {'a' => "ABC" } }  }

        it "should raise an exception about not using a JSON String" do
          lambda { failing.should be_json_partially_matching expected }.should raise_error /can't convert Hash into String/
        end
      end
    end

    describe "actual.should be_json_partially_matching(expected)" do

      # Assume the match_hash matcher works, so don't need a bunch of test cases.
      context "a json string against a hash with a regex" do
        let(:expected       ) {  { 'x' => { 'a' => /[A-Z]{3}/           } }  }
        let(:actual         ) { '{ "x" :  { "a" : "ABC"       , "b" : 1 } }' }
        let(:failing        ) { '{ "x" :  { "a" : "abc"       , "b" : 1 } }' }
        let(:failure_message) {
          "\e[0m{\n\e[0m  \"x\" => {\n\e[0m    \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[32m+ \e[1m\"abc\"\e[0m,\n\e[0m  \e[32m+ \e[1m\"b\" => 1\e[0m\n\e[0m  }\n\e[0m}\nWhere, \e[31m- \e[1m1 missing\e[0m, \e[32m+ \e[1m2 additional\e[0m"
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
