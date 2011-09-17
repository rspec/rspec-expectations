require 'spec_helper'

module Rspec
  module Matchers

    shared_examples_for "a json matcher" do
      it "passes if matches" do
        actual.should be_json_matching expected
      end

      it "fails if doesn't match" do
        lambda { failing.should be_json_matching(expected, :color_scheme=>:default) }.should fail_with failure_message
      end
    end

    describe "actual.should be_json_matching(expected)" do
      context "a json string matched against a hash with a regex" do
        let(:expected       ) {  { 'x' => {'a' => /[A-Z]{3}/ } }  }
        let(:actual         ) { '{ "x" :  {"a" :  "ABC"      } }' }
        let(:failing        ) { '{ "x" :  {"a" :  "123"      } }' }
        let(:failure_message) {
          "\e[0m{\n\e[0m  \"x\"=>{\n\e[0m    \"a\"=>\e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m+ \e[1m\"123\"\e[0m\n\e[0m  }\n\e[0m}\nWhere, \e[31m- \e[1m1 missing\e[0m, \e[33m+ \e[1m1 additional\e[0m"
        }

        it_should_behave_like "a json matcher"
      end
    end
  end
end
