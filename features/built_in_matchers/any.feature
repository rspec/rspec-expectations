Feature: `any` matcher

  Use the `any` matcher to specify that a collection's objects any pass an expected matcher.
  This works on any enumerable object.

    ```ruby
    expect([1, 4, 5]).to any( be_odd )
    expect([1, 3, 'a']).to any( be_an(Integer) )
    expect([1, 3, 11]).to any( be < 10 )
    ```

  The matcher also supports compound matchers:

    ```ruby
    expect([1, 'a', 11]).to any( be_odd.and be < 10 )
    ```

  Scenario: array usage
    Given a file named "array_any_matcher_spec.rb" with:
      """ruby
      RSpec.describe [1, 4, 'a', 11] do
        it { is_expected.to any( be_odd ) }
        it { is_expected.to any( be_an(Integer) ) }
        it { is_expected.to any( be < 10 ) }
      end

      RSpec.describe [14, 'a'] do
        it { is_expected.to any( be_odd ) }
        it { is_expected.to any( be_an(Symbol) ) }
        it { is_expected.to any( be < 10 ) }
      end
      """
    When I run `rspec array_any_matcher_spec.rb`
    Then the output should contain all of these:
       | 6 examples, 3 failures                        |
       | expected [14, "a"] to any be odd              |
       | expected [14, "a"] to any be a kind of Symbol |
       | expected [14, "a"] to any be < 10             |

  Scenario: compound matcher usage
    Given a file named "compound_any_matcher_spec.rb" with:
      """ruby
      RSpec.describe [1, 'anything', 'something'] do
        it { is_expected.to any( be_a(String).and include("thing") ) }
        it { is_expected.to any( be_a(String).and end_with("g") ) }
        it { is_expected.to any( start_with("s").or include("y") ) }
      end

      RSpec.describe ['anything', 'something'] do
        it { is_expected.to any( be_a(Integer).and include("thing") ) }
        it { is_expected.to any( be_a(Integer).and end_with("z") ) }
        it { is_expected.to any( start_with("z").or include("1") ) }
      end
      """
    When I run `rspec compound_any_matcher_spec.rb`
    Then the output should contain all of these:
       | 6 examples, 3 failures                                                             |
       | expected ["anything", "something"] to any be a kind of Integer and include "thing" |
       | expected ["anything", "something"] to any be a kind of Integer and end with "z"    |
       | expected ["anything", "something"] to any start with "z" or include "1"            |

