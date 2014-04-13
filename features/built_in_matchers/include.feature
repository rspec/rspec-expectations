Feature: include matcher

  Use the include matcher to specify that a collection includes one or more
  expected objects.  This works on any object that responds to #include?  (such
  as a string or array):

    ```ruby
    expect("a string").to include("a")
    expect("a string").to include("str")
    expect("a string").to include("str", "g")
    expect("a string").not_to include("foo")

    expect([1, 2]).to include(1)
    expect([1, 2]).to include(1, 2)
    expect([1, 2]).not_to include(17)
    ```

  The matcher also provides flexible handling for hashes:

    ```ruby
    expect(:a => 1, :b => 2).to include(:a)
    expect(:a => 1, :b => 2).to include(:a, :b)
    expect(:a => 1, :b => 2).to include(:a => 1)
    expect(:a => 1, :b => 2).to include(:b => 2, :a => 1)
    expect(:a => 1, :b => 2).not_to include(:c)
    expect(:a => 1, :b => 2).not_to include(:a => 2)
    expect(:a => 1, :b => 2).not_to include(:c => 3)
    ```

  Scenario: array usage
    Given a file named "array_include_matcher_spec.rb" with:
      """ruby
      RSpec.describe [1, 3, 7] do
        it { is_expected.to include(1) }
        it { is_expected.to include(3) }
        it { is_expected.to include(7) }
        it { is_expected.to include(1, 7) }
        it { is_expected.to include(1, 3, 7) }
        it { is_expected.not_to include(17) }
        it { is_expected.not_to include(43, 100) }

        # deliberate failures
        it { is_expected.to include(4) }
        it { is_expected.not_to include(1) }
        it { is_expected.not_to include(3) }
        it { is_expected.not_to include(7) }
        it { is_expected.not_to include(1, 3, 7) }

        # both of these should fail since it includes 1 but not 9
        it { is_expected.to include(1, 9) }
        it { is_expected.not_to include(1, 9) }
      end
      """
    When I run `rspec array_include_matcher_spec.rb`
    Then the output should contain all of these:
      | 14 examples, 7 failures                       |
      | expected [1, 3, 7] to include 4               |
      | expected [1, 3, 7] not to include 1           |
      | expected [1, 3, 7] not to include 3           |
      | expected [1, 3, 7] not to include 7           |
      | expected [1, 3, 7] not to include 1, 3, and 7 |
      | expected [1, 3, 7] to include 1 and 9         |
      | expected [1, 3, 7] not to include 1 and 9     |

  Scenario: string usage
    Given a file named "string_include_matcher_spec.rb" with:
      """ruby
      RSpec.describe "a string" do
        it { is_expected.to include("str") }
        it { is_expected.to include("a", "str", "ng") }
        it { is_expected.not_to include("foo") }
        it { is_expected.not_to include("foo", "bar") }

        # deliberate failures
        it { is_expected.to include("foo") }
        it { is_expected.not_to include("str") }
        it { is_expected.to include("str", "foo") }
        it { is_expected.not_to include("str", "foo") }
      end
      """
    When I run `rspec string_include_matcher_spec.rb`
    Then the output should contain all of these:
      | 8 examples, 4 failures                             |
      | expected "a string" to include "foo"               |
      | expected "a string" not to include "str"           |
      | expected "a string" to include "str" and "foo"     |
      | expected "a string" not to include "str" and "foo" |

  Scenario: hash usage
    Given a file named "hash_include_matcher_spec.rb" with:
      """ruby
      RSpec.describe :a => 7, :b => 5 do
        it { is_expected.to include(:a) }
        it { is_expected.to include(:b, :a) }
        it { is_expected.to include(:a => 7) }
        it { is_expected.to include(:b => 5, :a => 7) }
        it { is_expected.not_to include(:c) }
        it { is_expected.not_to include(:c, :d) }
        it { is_expected.not_to include(:d => 2) }
        it { is_expected.not_to include(:a => 5) }
        it { is_expected.not_to include(:b => 7, :a => 5) }

        # deliberate failures
        it { is_expected.not_to include(:a) }
        it { is_expected.not_to include(:b, :a) }
        it { is_expected.not_to include(:a => 7) }
        it { is_expected.not_to include(:a => 7, :b => 5) }
        it { is_expected.to include(:c) }
        it { is_expected.to include(:c, :d) }
        it { is_expected.to include(:d => 2) }
        it { is_expected.to include(:a => 5) }
        it { is_expected.to include(:a => 5, :b => 7) }

        # Mixed cases--the hash includes one but not the other.
        # All 4 of these cases should fail.
        it { is_expected.to include(:a, :d) }
        it { is_expected.not_to include(:a, :d) }
        it { is_expected.to include(:a => 7, :d => 3) }
        it { is_expected.not_to include(:a => 7, :d => 3) }
      end
      """
    When I run `rspec hash_include_matcher_spec.rb`
    Then the output should contain "13 failure"

