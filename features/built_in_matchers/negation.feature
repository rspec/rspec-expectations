Feature: Negation Matcher

  Matchers can be negated using `~` or `or` to make a negative expectation.

  Scenario: Use `~` to negate an expectation
    Given a file named "negate_spec.rb" with:
      """ruby
      RSpec.describe "negate an expectation" do
        let(:colors) { [:green, :yellow, :red] }
        it "passes" do
          expect(colors).to ~include(:blue)
        end
        it "passes with compound matcher" do
          expect(colors).to include(:red).and ~include(:blue)
        end
        it "passes with compound matcher" do
          expect(7.1).to be_within(0.1).of(7.0).and ~be_within(0.5).of(8.0)
        end
      end
      """
    When I run `rspec negate_spec.rb`
    Then the example should pass
    