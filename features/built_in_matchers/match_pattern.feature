Feature: `match_pattern` matcher

  Use the `match_pattern` matcher to specify that a value matches with
  expected patterns by Ruby's pattern-matching.

    ```ruby
    expect([1, 2, 3]).to match_pattern([Integer, Integer, Integer])
    expect([1, 2, 3]).to match_pattern([Integer, Integer, String])
    ```

  Scenario: Pattern usage
    Given a file named "example_spec.rb" with:
      """ruby
      RSpec.describe [1, 2, 3] do
        it { is_expected.to match_pattern([Integer, Integer, Integer]) }
        it { is_expected.not_to match_pattern([Integer, Integer, String]) }

        # deliberate failures
        it { is_expected.to match_pattern([Integer, Integer, String]) }
        it { is_expected.not_to match_pattern([Integer, Integer, Integer]) }
      end
      """
    When I run `rspec example_spec.rb`
    Then the output should contain all of these:
      | 4 examples, 2 failures                                              |
      | expected [1, 2, 3] to match pattern [Integer, Integer, String]      |
      | expected [1, 2, 3] not to match pattern [Integer, Integer, Integer] |
