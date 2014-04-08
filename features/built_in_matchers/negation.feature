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

  @ruby-1.9
  Scenario: Explicitly enable boolean negation matcher, `!` syntax.
    Given a file named "boolean_operators_spec.rb" with:
      """ruby
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.enable_boolean_negation_matcher = true
        end
      end

      RSpec.describe 'using boolean negation matcher' do
        it "allows using boolean NOT operator '!'" do
          expect(3..15).to cover(12).and !cover(20)
        end
        it "allows using boolean NOT operator 'not'" do
          expect(3..15).to cover(12).and not(cover(20))
        end
      end
      """
    When I run `rspec boolean_operators_spec.rb`
    Then the example should pass
