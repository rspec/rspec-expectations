Feature: Class matchers

  rspec-expectations a matcher to specify the nature of classes:

    * `expect(Klass).to be_subclass_of(Klazz)`: calls `Klass.ancestors.include?(Klazz)`, which returns true if
        Klazz is in Klass's class hierarchy or is a module and is included in a class in Klass's
        class hierarchy. This matcher is aliased as `be_a_subclass_of` and `a_subclass_of`.


  Scenario: be_(a_)subclass_of matcher
    Given a file named "be_subclass_of_matcher_spec.rb" with:
      """ruby
      module Qux

      end

      class Foo

      end
      
      class Bar < Foo

      end

      class Baz < Bar
        include Qux
      end

      RSpec.describe Baz do
        subject { Baz }

        # the superclass
        specify { expect(subject).to be_subclass_of(Bar) }

        # the super-superclass
        specify { expect(subject).to be_subclass_of(Foo) }

        # Ruby internals
        specify { expect(subject).to be_subclass_of(Object) }

        # an included module
        specify { expect(subject).to be_subclass_of(Qux) }

        # negative passing case
        it { is_expected.not_to be_subclass_of(String) }

        # deliberate failures
        specify { expect(subject).not_to be_subclass_of(Foo) }
        specify { expect(subject).to be_subclass_of(Fixnum) }
      end
      """
    When I run `rspec be_subclass_of_matcher_spec.rb`
    Then the output should contain all of these:
      | 7 examples, 2 failures                   |
      | expected Baz not to be a subclass of Foo |
      | expected Baz to be a subclass of Fixnum  |