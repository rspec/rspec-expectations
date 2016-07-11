Feature: diffing

  When appropriate, failure messages will automatically include a diff.

  Scenario: diff for a multiline string
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a multiline string" do
        it "is like another string" do
          expected = <<-EXPECTED
      this is the
        expected
          string
      EXPECTED
          actual = <<-ACTUAL
      this is the
        actual
          string
      ACTUAL
          expect(actual).to eq(expected)
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should contain:
      """
             Diff:
             @@ -1,5 +1,5 @@
              this is the
             -  expected
             +  actual
                  string
      """

  Scenario: diff for a multiline string with trailing newline
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a multiline string" do
        it "is like another string" do
          expected = "Chewy\nbagel."
          actual = "Chewy\n\nbagel.\n"
          expect(actual).to eq(expected)
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should contain:
      """
             Diff:
             @@ -1,3 +1,5 @@
              Chewy
             +
              bagel.
             +\ No newline at end of input
      """

  Scenario: diff for a multiline string and a regexp
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a multiline string" do
        it "is like another string" do
          expected = /expected/m
          actual = <<-ACTUAL
      this is the
        actual
          string
      ACTUAL
          expect(actual).to match expected
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should contain:
      """
             Diff:
             @@ -1,2 +1,5 @@
             -/expected/m
             +this is the
             +  actual
             +    string
      """

  Scenario: diff for a single line string with trailing newline
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a string" do
        it "is not like another string" do
          actual = "Meow"
          expected = "Meow\n"
          expect(actual).to eq(expected)
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should contain:
      """
             Diff:
             @@ -1,3 +1,2 @@
              Meow
             -\ No newline at end of input
      """

  Scenario: no diff for a single line strings
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a single line string" do
        it "is like another string" do
          expected = "this string"
          actual   = "that string"
          expect(actual).to eq(expected)
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should not contain "Diff:"

  Scenario: no diff for numbers
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe "a number" do
        it "is like another number" do
          expect(1).to eq(2)
        end
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should not contain "Diff:"
