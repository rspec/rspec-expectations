Feature: exist matcher

  The exist matcher is used to specify that something exists
  (as indicated by #exist? or #exists?):

    ```ruby
    expect(obj).to exist # passes if obj.exist? or obj.exists?
    ```

  Scenario: basic usage
    Given a file named "exist_matcher_spec.rb" with:
      """ruby
      class Planet
        attr_reader :name

        def initialize(name)
          @name = name
        end

        def inspect
          "<Planet: #{name}>"
        end

        def exist? # also works with exists?
          %w[Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune].include?(name)
        end
      end

      describe "Earth" do
        let(:earth) { Planet.new("Earth") }
        specify { expect(earth).to exist }
        specify { expect(earth).not_to exist } # deliberate failure
      end

      describe "Tatooine" do
        let(:tatooine) { Planet.new("Tatooine") }
        it { expect(tatooine).to exist } # deliberate failure
        it { expect(tatooine).not_to exist }
      end
      """
    When I run `rspec exist_matcher_spec.rb`
    Then the output should contain all of these:
      | 4 examples, 2 failures                |
      | expected <Planet: Earth> not to exist |
      | expected <Planet: Tatooine> to exist  |
