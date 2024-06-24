Feature: `satisfy` matcher

  The `satisfy` matcher is extremely flexible and can handle almost anything you want to
  specify. It passes if the block you provide returns true:

  ```ruby
  expect(10).to satisfy { |v| v % 5 == 0 }
  expect(7).not_to satisfy { |v| v % 5 == 0 }
  ```

  The default failure message ("expected [actual] to satisfy block") is not very descriptive or helpful.
  To add clarification, you can provide your own description as an argument:

  ```ruby
  expect(10).to satisfy("be a multiple of 5") do |v|
    v % 5 == 0
  end
  ```

  The `satisfy` matcher can also be used on block expectations to match the returned value of the block:

  ```ruby
  expect { 2 + 2 }.to satisfy { |returned_value| returned_value == 4 }
  ```

  This comes handy to check both the side effects of the subject under test and its returned value:

  ```ruby
  expect { request! }
    .to change { Log.count }.by(1)
    .and satisfy { |response| response.success? }
  ```

  @skip-when-ripper-unsupported
  Scenario: Basic usage
    Given a file named "satisfy_matcher_spec.rb" with:
      """ruby
      RSpec.describe 10 do
        it { is_expected.to satisfy { |v| v > 5 } }
        it { is_expected.not_to satisfy { |v| v > 15 } }

        # deliberate failures
        it { is_expected.not_to satisfy { |v| v > 5 } }
        it { is_expected.to satisfy { |v| v > 15 } }
        it { is_expected.to_not satisfy("be greater than 5") { |v| v > 5 } }
        it { is_expected.to satisfy("be greater than 15") { |v| v > 15 } }
      end
      """
    When I run `rspec satisfy_matcher_spec.rb`
    Then the output should contain all of these:
      | 6 examples, 4 failures                        |
      | expected 10 not to satisfy expression `v > 5` |
      | expected 10 to satisfy expression `v > 15`    |
      | expected 10 not to be greater than 5          |
      | expected 10 to be greater than 15             |

  @skip-when-ripper-unsupported
  Scenario: Matching the block expectation return value
    Given a file named "satisfy_matcher_returned_value_spec.rb" with:
      """ruby
      RSpec.describe "double-purpose" do
        it "adds an entry and returns the sum" do
          ary = [1, 2, 3]
          expect { ary.shift }
            .to change { ary }.to([2, 3])
            .and satisfy { |returned_value| returned_value == 1 }
        end
      end
      """
    When I run `rspec satisfy_matcher_returned_value_spec.rb`
    Then the output should contain all of these:
      | 1 example, 0 failures                        |
