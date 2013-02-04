require 'spec_helper'
require 'ostruct'

module RSpec
  module Expectations
    describe Differ do
      context "without --color" do

      before { RSpec::Matchers.configuration.stub(:color? => false) }

      let(:differ) { RSpec::Expectations::Differ.new }

        # color disabled context

      describe '#diff_as_string' do
        it "outputs unified diff of two strings" do
          expected="foo\nbar\nzap\nthis\nis\nsoo\nvery\nvery\nequal\ninsert\na\nline\n"
          actual="foo\nzap\nbar\nthis\nis\nsoo\nvery\nvery\nequal\ninsert\na\nanother\nline\n"
          expected_diff= <<'EOD'


@@ -1,6 +1,6 @@
 foo
-zap
 bar
+zap
 this
 is
 soo
@@ -9,6 +9,5 @@
 equal
 insert
 a
-another
 line
EOD

          diff = differ.diff_as_string(expected, actual)
          expect(diff).to eql(expected_diff)
        end
      end

      describe '#diff_as_object' do
        it "outputs unified diff message of two objects" do
          animal_class = Class.new do
            def initialize(name, species)
              @name, @species = name, species
            end

            def inspect
              <<-EOA
<Animal
  name=#{@name},
  species=#{@species}
>
              EOA
            end
          end

          expected = animal_class.new "bob", "giraffe"
          actual   = animal_class.new "bob", "tortoise"

          expected_diff = <<'EOD'

@@ -1,5 +1,5 @@
 <Animal
   name=bob,
-  species=tortoise
+  species=giraffe
 >
EOD

          diff = differ.diff_as_object(expected,actual)
          expect(diff).to eq expected_diff
        end

        it "outputs unified diff message of two arrays" do
          expected = [ :foo, 'bar', :baz, 'quux', :metasyntactic, 'variable', :delta, 'charlie', :width, 'quite wide' ]
          actual   = [ :foo, 'bar', :baz, 'quux', :metasyntactic, 'variable', :delta, 'tango'  , :width, 'very wide'  ]

          expected_diff = <<'EOD'


@@ -5,7 +5,7 @@
  :metasyntactic,
  "variable",
  :delta,
- "tango",
+ "charlie",
  :width,
- "very wide"]
+ "quite wide"]
EOD

          diff = differ.diff_as_object(expected,actual)
          expect(diff).to eq expected_diff
        end

        it "outputs unified diff message of two hashes" do
          expected = { :foo => 'bar', :baz => 'quux', :metasyntactic => 'variable', :delta => 'charlie', :width =>'quite wide' }
          actual   = { :foo => 'bar', :metasyntactic => 'variable', :delta => 'charlotte', :width =>'quite wide' }

          expected_diff = <<'EOD'

@@ -1,4 +1,5 @@
-:delta => "charlotte",
+:baz => "quux",
+:delta => "charlie",
 :foo => "bar",
 :metasyntactic => "variable",
 :width => "quite wide"
EOD

          diff = differ.diff_as_object(expected,actual)
          expect(diff).to eq expected_diff
        end

        it "outputs unified diff of single line strings" do
          expected = "this is one string"
          actual   = "this is another string"

          expected_diff = <<'EOD'

@@ -1,2 +1,2 @@
-"this is another string"
+"this is one string"
EOD

          diff = differ.diff_as_object(expected,actual)
          expect(diff).to eq expected_diff
        end

        it "outputs unified diff of multi line strings" do
          expected = "this is:\n  one string"
          actual   = "this is:\n  another string"

          expected_diff = <<'EOD'

@@ -1,3 +1,3 @@
 this is:
-  another string
+  one string
EOD

          diff = differ.diff_as_object(expected,actual)
          expect(diff).to eq expected_diff
        end
      end
    end

    context "with --color" do
      before { RSpec::Matchers.configuration.stub(:color? => true) }

      let(:differ) { RSpec::Expectations::Differ.new }

      it "outputs colored diffs" do
        expected = "foo bar baz"
        actual = "foo bang baz"
        expected_diff = "\n\e[34m@@ -1,2 +1,2 @@\n\e[0m\e[31m-foo bang baz\n\e[0m\e[32m+foo bar baz\n\e[0m"


        diff = differ.diff_as_string(expected,actual)
        expect(diff).to eq expected_diff
      end
    end

    end
  end
end

