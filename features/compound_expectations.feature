Feature: Compound Expectations

  Matchers can be composed using `and` or `or` to make compound expectations.

  Scenario: Use `and` to chain expectations
    Given a file named "compound_and_matcher_spec.rb" with:
      """ruby
      RSpec.describe "A compound `and` matcher" do
        let(:string) { "foo bar bazz" }

        it "passes when both are true" do
          expect(string).to start_with("foo").and end_with("bazz")
        end

        it "passes when using boolean AND `&` alias" do
          expect(string).to start_with("foo") & end_with("bazz")
        end

        it "fails when the first matcher fails" do
          expect(string).to start_with("bar").and end_with("bazz")
        end

        it "fails when the second matcher fails" do
          expect(string).to start_with("foo").and end_with("bar")
        end
      end
      """
    When I run `rspec compound_and_matcher_spec.rb`
    Then the output should contain "4 examples, 2 failures"

  Scenario: Use `or` to chain expectations
    Given a file named "stoplight_spec.rb" with:
      """ruby
      class StopLight
        def color
          %w[ green yellow red ].shuffle.first
        end
      end

      RSpec.describe StopLight, "#color" do
        let(:light) { StopLight.new }
        it "is green, yellow or red" do
          expect(light.color).to eq("green").or eq("yellow").or eq("red")
        end

        it "passes when using boolean OR `|` alias" do
          expect(light.color).to eq("green") | (eq("yellow") | eq("red"))
        end
      end
      """
    When I run `rspec stoplight_spec.rb`
    Then the example should pass

  Scenario: Use `~` to negate an expectation
    Given a file named "negate_spec.rb" with:
      """ruby
      RSpec.describe "negate an expectation" do
        it "passes" do
          expect(3..15).to ~cover(20)
        end
        it "passes with compound matcher" do
          expect(3..15).to cover(12).and ~cover(20)
        end
        it "passes with compound matcher" do
          colors = [:green, :yellow, :red]
          expect(colors).to include(:red).and ~include(:blue)
        end
        it "passes with compound matcher" do
          expect(7.1).to be_within(0.1).of(7.0).and ~(be_within(0.5).of(8.0))
        end
      end
      """
    When I run `rspec negate_spec.rb`
    Then the example should pass

  @ruby-1.9
  Scenario: Explicitly enable matcher boolean operators `|`, `&`, `!` syntax.
    Given a file named "boolean_operators_spec.rb" with:
      """ruby
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.matcher_boolean_negation_operator = true
        end
      end

      RSpec.describe 'using matcher boolean negation operator' do
        it "allows using boolean NOT operator '!'" do
          expect('A').to !eq('B')
        end
        it "allows using boolean NOT operator 'not'" do
          expect('A').to not(eq('B'))
        end
      end
      """
    When I run `rspec boolean_operators_spec.rb`
    Then the example should pass
