require 'spec_helper'

module RSpec
  module Matchers

    def paint(msg)
      RSpec.configuration.color_enabled? ? msg : msg.gsub(/\e\[\d+m/, '')
    end

    # refactor start
    shared_examples_for "a matcher" do
      it "passes if matches" do
        actual.should =~ expected
      end

      it "fails if doesn't match" do
       lambda { failing.should =~ expected }.should fail_with failure_message
      end
    end

    shared_examples_for "a matcher in ruby 1.8" do
      it "passes if matches" do
        actual.should =~ expected
      end

      # Don't have ordered hashes in ruby 1.8 so can't guarantee what the failure message will look like..
      # refactor...
      it "fails if doesn't match" do
       lambda { failing.should =~ expected }.should fail
      end
    end

    shared_examples_for "another matcher" do
      it "passes if matches" do
        actual.should be_hash_matching expected
      end

      it "fails if doesn't match" do
       lambda { failing.should be_hash_matching expected }.should fail_with failure_message
      end
    end

    shared_examples_for "another matcher in ruby 1.8" do
      it "passes if matches" do
        actual.should be_hash_matching expected
      end

      # Don't have ordered hashes in ruby 1.8 so can't guarantee what the failure message will look like..
      # refactor...
      it "fails if doesn't match" do
       lambda { failing.should be_hash_matching expected }.should fail
      end
    end

    shared_examples_for "a partial matcher" do
      it "passes if partially matches" do
        actual.should be_hash_partially_matching expected
      end

      it "fails if doesn't partially match" do
       lambda { failing.should be_hash_partially_matching expected }.should fail_with failure_message
      end
    end

    shared_examples_for "a partial matcher in ruby 1.8" do
      it "passes if partially matches" do
        actual.should be_hash_partially_matching expected
      end

      # Don't have ordered hashes in ruby 1.8 so can't guarantee what the failure message will look like..
      # refactor...
      it "fails if doesn't partially match" do
       lambda { failing.should be_hash_partially_matching expected }.should fail
      end
    end
    # refactor end


    describe "actual.should =~ expected, when expected hash" do

      context "has an array with missing items" do
        let(:expected        ) { { "a" => [1,2,3  ] } }
        let(:actual          ) { { "a" => [1,2, 3 ] } }
        let(:failing         ) { { "a" => [1,2    ] } }
        let(:failure_message ) {
          paint "\e[0m{\n  \"a\" => [1, 2, \e[31m- \e[1m3\e[0m]\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has an array with incorrect items" do
        let(:expected        ) { { "a" => [1,2,3] } }
        let(:actual          ) { { "a" => [1,2,3] } }
        let(:failing         ) { { "a" => [1,2,4] } }
        let(:failure_message ) {
          paint "\e[0m{\n  \"a\" => [1, 2, \e[31m- \e[1m3\e[0m\e[32m+ \e[1m4\e[0m]\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has an array with extra items" do
        let(:expected        ) { { "a" => [1,2,3  ] } }
        let(:actual          ) { { "a" => [1,2, 3 ] } }
        let(:failing         ) { { "a" => [1,2,3,4] } }
        let(:failure_message ) {
          paint "\e[0m{\n  \"a\" => [1, 2, 3, \e[32m+ \e[1m4\e[0m]\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has an array with a regex" do
        let(:expected        ) { { "a" => [1,2,/\d/ ] } }
        let(:actual          ) { { "a" => [1,2, 3   ] } }
        let(:failing         ) { { "a" => [1,2      ] } }
        let(:failure_message ) {
          paint "\e[0m{\n  \"a\" => [1, 2, \e[31m- \e[1m/\\d/\e[0m]\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "is a hash with unexpected values" do
        let(:expected        ) { { "a" => "expected1", "b" => "expected2"} }
        let(:actual          ) { { "b" => "expected2", "a" => "expected1"} }
        let(:failing         ) { { "a" => "unexpected1", "b" => "expected2"} }
        let(:failure_message ) {
          paint "\e[0m{\n  \"b\" => \"expected2\",\n  \"a\" => \e[31m- \e[1m\"expected1\"\e[0m\e[32m+ \e[1m\"unexpected1\"\e[0m\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "is a hash with unexpected keys" do
        let(:expected        ) { { "expected1"   => "expected1"  , "expected2" => "expected2"} }
        let(:actual          ) { { "expected2"   => "expected2"  , "expected1" => "expected1"} }
        let(:failing         ) { { "unexpected1" => "unexpected1", "expected2" => "expected2"} }
        let(:failure_message ) {
          paint "\e[0m{\n  \"expected2\" => \"expected2\",\n\e[31m- \e[1m\"expected1\" => \"expected1\"\e[0m,\n\e[32m+ \e[1m\"unexpected1\" => \"unexpected1\"\e[0m\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has a hash" do
        let(:expected        ) { { "x" => {"a" => "ABC", "b" => "BBC"}} }
        let(:actual          ) { { "x" => {"b" => "BBC", "a" => "ABC"}} }
        let(:failing         ) { { "x" => {"a" => "DEF", "b" => "BBC"}} }
        let(:failure_message ) {
          paint "\e[0m{\n  \"x\" => {\n    \"b\" => \"BBC\",\n    \"a\" => \e[31m- \e[1m\"ABC\"\e[0m\e[32m+ \e[1m\"DEF\"\e[0m\n  }\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has a regex" do
        let(:expected        ) { {"a" => /[A-Z]{3}/ } }
        let(:actual          ) { {"a" => "ABC"      } }
        let(:failing         ) { {"a" => "abc"      } }
        let(:failure_message ) {
          paint <<-MESSAGE
\e[0m{
  \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m~ \e[1mabc\e[0m
}
          MESSAGE
        }
        it_should_behave_like "a matcher"
      end

      context "has a hash with a regex" do
        let(:expected        ) { { "x" => { "a" => /[A-Z]{3}/ }} }
        let(:actual          ) { { "x" => {"a" => "ABC"}} }
        let(:failing         ) { { "x" => {"a" => "abc"}} }
        let(:failure_message ) {
          paint <<-MESSAGE
\e[0m{
  \"x\" => {
    \"a\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m~ \e[1mabc\e[0m
  }
}
          MESSAGE
        }

        it_should_behave_like "a matcher"
      end

      context "has multiple regexes" do
        let(:expected        ) { {'x' => {'a' => /[A-Z]/ , 'b' => /[A-Z]{3}/, 'c' => /^[A-Z]{3}$/ }} }
        let(:actual          ) { { "x" => {"a" => "ABC", "b" => "BBC", "c" => "CBC"}} }
        let(:failing         ) { { "x" => {"a" => "ABC", "b" => "bbc", "c" => "CBC"}} }
        let(:failure_message ) {
          paint "\e[0m{\n  \"x\" => {\n    \"a\" => \e[33m~ \e[1m[A]BC\e[0m,\n    \"c\" => \e[33m~ \e[1m[CBC]\e[0m,\n    \"b\" => \e[31m- \e[1m/[A-Z]{3}/\e[0m\e[33m~ \e[1mbbc\e[0m\n  }\n}\n"
        }

        it_should_behave_like "a matcher"
      end

      context "has lots of stuff" do
        let(:expected) {
          pat_datetime = /\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z/
          {
            "href" => Regexp.compile("^#{Regexp.quote 'http://puge.example.org/api/goals/games/'}[0-9]+#{Regexp.quote '/matches/'}[0-9]+$"),
            "scheduled_start" => pat_datetime,
            "networks" => %w(abc nbc cnn),
            "expected_key" => "expected_value",
            "end_date" => pat_datetime,
            "home_team" => {
              "name" => "flames",
              "short_name" => "FLA",
              "link" => [{"href" => "http://puge.example.org/api/goals/teams/FLA/players", "rel" => "players"}],
              "href" => "http://puge.example.org/api/goals/teams/FLA"
            },
            "away_team" => {
              "name" => "sharks",
              "short_name" => "SHA",
              "link" => [{"href" => "http://puge.example.org/api/goals/teams/SHA/players", "rel" => "players"}],
              "href" => "http://puge.example.org/api/goals/teams/SHA"
            }
          }
        }
        let(:actual) {
          {
            "href" => "http://puge.example.org/api/goals/games/635/matches/832",
            "scheduled_start" => "2010-01-01T00:00:00Z",
            "networks" => %w(abc nbc cnn),
            "expected_key" => "expected_value",
            "end_date" => "2010-01-02T01:00:00Z",
            "home_team" => {
              "name" => "flames",
              "short_name" => "FLA",
              "link" => [{"href"=>"http://puge.example.org/api/goals/teams/FLA/players", "rel"=>"players"}],
              "href" => "http://puge.example.org/api/goals/teams/FLA",
            },
            "away_team" => {
              "name" => "sharks",
              "short_name" => "SHA",
              "href" => "http://puge.example.org/api/goals/teams/SHA",
              "link" => [{"href"=>"http://puge.example.org/api/goals/teams/SHA/players", "rel"=>"players"}]
            }
          }
        }
        let(:failing) {
          {
            "href" => "http://puge.example.org/api/goals/games/635/matches/832",
            "scheduled_start" => "2010-01-01T00:00:00Z",
            "networks" => ["abc", "cnn", "yyy", "zzz"],
            "unexpected_key" => "unexpected_value",
            "end_date" => "2010-01-01T01:00:00Z",
            "home_team" => {
              "name" => "unexpected1",
              "short_name" => "FLA",
              "link" => [{"href" => "http://puge.example.org/api/goals/teams/FLA/players", "rel" => "players"}],
              "href" => "http://puge.example.org/api/goals/teams/FLA"
            },
            "away_team" => {
              "name" => "sharks",
              "short_name" => "unexpected2",
              "link" => [{"href" => "http://puge.example.org/api/goals/teams/SHA/players", "rel" => "players"}],
              "href" => "http://puge.example.org/api/goals/teams/SHA"
            }
          }
        }

        let(:failure_message) {
          # paint "\e[0m{\n\e[0m  \"href\" => \e[33m~ \e[1m[http://puge.example.org/api/goals/games/635/matches/832]\e[0m\e[0m\e[0m,\n\e[0m  \"scheduled_start\" => \e[33m~ \e[1m[2010-01-01T00:00:00Z]\e[0m\e[0m\e[0m,\n\e[0m  \"end_date\" => \e[33m~ \e[1m[2010-01-01T01:00:00Z]\e[0m\e[0m\e[0m,\n\e[0m  \"networks\" => \e[0m[\e[0m\"abc\", \e[31m- \e[1m\"nbc\"\e[0m\e[0m\e[32m+ \e[1m\"cnn\"\e[0m\e[0m, \e[31m- \e[1m\"cnn\"\e[0m\e[0m\e[32m+ \e[1m\"yyy\"\e[0m\e[0m, \e[32m+ \e[1m\"zzz\"\e[0m\e[0m]\e[0m,\n\e[0m  \"home_team\" => \e[0m{\n  \e[0m  \"short_name\" => \"FLA\"\e[0m,\n  \e[0m  \"link\" => \e[0m[\e[0m{\"href\"=>\"http://puge.example.org/api/goals/teams/FLA/players\", \"rel\"=>\"players\"}]\e[0m,\n  \e[0m  \"href\" => \"http://puge.example.org/api/goals/teams/FLA\"\e[0m,\n  \e[0m  \"name\" => \e[31m- \e[1m\"flames\"\e[0m\e[0m\e[32m+ \e[1m\"unexpected1\"\e[0m\e[0m\e[0m\n  \e[0m}\e[0m,\n\e[0m  \"away_team\" => \e[0m{\n  \e[0m  \"name\" => \"sharks\"\e[0m,\n  \e[0m  \"link\" => \e[0m[\e[0m{\"href\"=>\"http://puge.example.org/api/goals/teams/SHA/players\", \"rel\"=>\"players\"}]\e[0m,\n  \e[0m  \"href\" => \"http://puge.example.org/api/goals/teams/SHA\"\e[0m,\n  \e[0m  \"short_name\" => \e[31m- \e[1m\"SHA\"\e[0m\e[0m\e[32m+ \e[1m\"unexpected2\"\e[0m\e[0m\e[0m\n  \e[0m}\e[0m,\n\e[0m\e[31m- \e[1m\"expected_key\" => \"expected_value\"\e[0m\e[0m\e[0m,\n\e[0m\e[32m+ \e[1m\"unexpected_key\" => \"unexpected_value\"\e[0m\e[0m\e[0m\n\e[0m}\n"
          paint "\e[0m{\n  \"href\" => \e[33m~ \e[1m[http://puge.example.org/api/goals/games/635/matches/832]\e[0m,\n  \"scheduled_start\" => \e[33m~ \e[1m[2010-01-01T00:00:00Z]\e[0m,\n  \"end_date\" => \e[33m~ \e[1m[2010-01-01T01:00:00Z]\e[0m,\n  \"networks\" => [\"abc\", \e[31m- \e[1m\"nbc\"\e[0m\e[32m+ \e[1m\"cnn\"\e[0m, \e[31m- \e[1m\"cnn\"\e[0m\e[32m+ \e[1m\"yyy\"\e[0m, \e[32m+ \e[1m\"zzz\"\e[0m],\n  \"home_team\" => {\n    \"short_name\" => \"FLA\",\n    \"link\" => [{\"href\"=>\"http://puge.example.org/api/goals/teams/FLA/players\", \"rel\"=>\"players\"}],\n    \"href\" => \"http://puge.example.org/api/goals/teams/FLA\",\n    \"name\" => \e[31m- \e[1m\"flames\"\e[0m\e[32m+ \e[1m\"unexpected1\"\e[0m\n  },\n  \"away_team\" => {\n    \"name\" => \"sharks\",\n    \"link\" => [{\"href\"=>\"http://puge.example.org/api/goals/teams/SHA/players\", \"rel\"=>\"players\"}],\n    \"href\" => \"http://puge.example.org/api/goals/teams/SHA\",\n    \"short_name\" => \e[31m- \e[1m\"SHA\"\e[0m\e[32m+ \e[1m\"unexpected2\"\e[0m\n  },\n\e[31m- \e[1m\"expected_key\" => \"expected_value\"\e[0m,\n\e[32m+ \e[1m\"unexpected_key\" => \"unexpected_value\"\e[0m\n}\n"
        }

        it_should_behave_like "a matcher#{' in ruby 1.8' if RUBY_VERSION.to_f == 1.8}"
      end
    end


    describe "actual.should be_hash_matching(expected)" do

      context "has an array with missing items" do
        let(:expected        ) { { "a" => [1,2,3  ] } }
        let(:actual          ) { { "a" => [1,2, 3 ] } }
        let(:failing         ) { { "a" => [1,2    ] } }
        let(:failure_message ) {
          paint <<-MESSAGE
\e[0m{
  \"a\" => [1, 2, \e[31m- \e[1m3\e[0m]
}
          MESSAGE
        }

        it_should_behave_like "another matcher"
      end
    end

    describe "actual.should be_hash_partially_matching(expected)" do

      context "contains a hash with missing items" do
        let(:expected        ) { { "x" => { "a" => [1,2,3]                       } } }
        let(:actual          ) { { "x" => { "a" => [1,2,3] , "b" => "unexpected" } } }
        let(:failing         ) { { "x" => { "a" => [1,2  ] , "b" => "unexpected" } } }
        let(:failure_message) { 
          paint "\e[0m{\n  \"x\" => {\n    \"a\" => [1, 2, \e[31m- \e[1m3\e[0m],\n  \e[32m+ \e[1m\"b\" => \"unexpected\"\e[0m\n  }\n}\n"
        }

        it_should_behave_like "a partial matcher"
      end

      context "is a hash inside the expected" do
        let(:expected        ) { { "a" => { "b" => { "c" => 1 } } } }
        let(:actual          ) { { "a" => { "b" => { "c" => 1 } } } }
        let(:failing         ) {          { "b" => { "c" => 1 } }   }
        let(:failure_message) { 
          paint "\e[0m{\n\e[31m- \e[1m\"a\" => {\"b\"=>{\"c\"=>1}}\e[0m,\n\e[32m+ \e[1m\"b\" => {\"c\"=>1}\e[0m\n}\n"
        }

        it_should_behave_like "a partial matcher"
      end

      context "has lots of stuff" do
        let(:expected) {
          {
            "home_team" => {
              "name" => "flames",
              "short_name" => /^[A-Z]{3}$/
            }
          }
        }
        let(:actual) {
          {
            "href" => "http://puge.example.org/api/goals/games/635/matches/832",
            "scheduled_start" => "2010-01-01T00:00:00Z",
            "end_date" => "2010-01-02T01:00:00Z",
            "home_team" => {
              "name" => "flames",
              "short_name" => "FLA",
              "href" => "http://puge.example.org/api/goals/teams/FLA"
            },
            "away_team" => {
              "name" => "sharks",
              "short_name" => "SHA",
              "href" => "http://puge.example.org/api/goals/teams/SHA"
            }
          }
        }
        let(:failing) {
          {
            "href" => "http://puge.example.org/api/goals/games/635/matches/832",
            "scheduled_start" => "2010-01-01T00:00:00Z",
            "end_date" => "2010-01-01T01:00:00Z",
            "home_team" => {
              "name" => "unexpected1",
              "short_name" => "FLA",
              "href" => "http://puge.example.org/api/goals/teams/FLA"
            },
            "away_team" => {
              "name" => "sharks",
              "short_name" => "unexpected2",
              "href" => "http://puge.example.org/api/goals/teams/SHA"
            }
          }
        }
        let(:failure_message) {
          paint "\e[0m{\n  \"home_team\" => {\n    \"short_name\" => \e[33m~ \e[1m[FLA]\e[0m,\n    \"name\" => \e[31m- \e[1m\"flames\"\e[0m\e[32m+ \e[1m\"unexpected1\"\e[0m,\n  \e[32m+ \e[1m\"href\" => \"http://puge.example.org/api/goals/teams/FLA\"\e[0m\n  },\n\e[32m+ \e[1m\"href\" => \"http://puge.example.org/api/goals/games/635/matches/832\"\e[0m,\n\e[32m+ \e[1m\"scheduled_start\" => \"2010-01-01T00:00:00Z\"\e[0m,\n\e[32m+ \e[1m\"end_date\" => \"2010-01-01T01:00:00Z\"\e[0m,\n\e[32m+ \e[1m\"away_team\" => {\"name\"=>\"sharks\", \"short_name\"=>\"unexpected2\", \"href\"=>\"http://puge.example.org/api/goals/teams/SHA\"}\e[0m\n}\n"
        }

        it_should_behave_like "a partial matcher#{' in ruby 1.8' if RUBY_VERSION.to_f == 1.8}"
      end

    end

  end
end
