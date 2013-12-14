require 'spec_helper'
require 'rspec/matchers/composable_aliases'

module RSpec
  module Matchers
    describe "Composing matchers" do
      include ComposableAliases

      describe "expect { ... }.to change { ... }" do
        context ".from( matcher ).to( matcher )" do
          it 'passes when the matchers match the from and to values' do
            k = 0.51
            expect { k += 1 }.to change { k }.
              from( a_value_within(0.1).of(0.5) ).
              to( a_value_within(0.1).of(1.5) )
          end

          it 'fails with a clear message when the `from` does not match' do
            expect {
              k = 0.51
              expect { k += 1 }.to change { k }.
                from( a_value_within(0.1).of(0.7) ).
                to( a_value_within(0.1).of(1.5) )
            }.to fail_with(/expected result to have initially been a value within 0.1 of 0.7, but was 0.51/)
          end

          it 'fails with a clear message when the `to` does not match' do
            expect {
              k = 0.51
              expect { k += 1 }.to change { k }.
                from( a_value_within(0.1).of(0.5) ).
                to( a_value_within(0.1).of(2.5) )
            }.to fail_with(/expected result to have changed to a value within 0.1 of 2.5, but is now 1.51/)
          end

          it 'provides a description' do
            expect(change(nil, :foo).
              from( a_value_within(0.1).of(0.5) ).
              to( a_value_within(0.1).of(1.5) ).description
            ).to eq("change #foo from a value within 0.1 of 0.5 to a value within 0.1 of 1.5")
          end
        end

        context ".to( matcher ).from( matcher )" do
          it 'passes when the matchers match the from and to values' do
            k = 0.51
            expect { k += 1 }.to change { k }.
              to( a_value_within(0.1).of(1.5) ).
              from( a_value_within(0.1).of(0.5) )
          end

          it 'fails with a clear message when the `from` does not match' do
            expect {
              k = 0.51
              expect { k += 1 }.to change { k }.
                to( a_value_within(0.1).of(1.5) ).
                from( a_value_within(0.1).of(0.7) )
            }.to fail_with(/expected result to have initially been a value within 0.1 of 0.7, but was 0.51/)
          end

          it 'fails with a clear message when the `to` does not match' do
            expect {
              k = 0.51
              expect { k += 1 }.to change { k }.
                to( a_value_within(0.1).of(2.5) ).
                from( a_value_within(0.1).of(0.5) )
            }.to fail_with(/expected result to have changed to a value within 0.1 of 2.5, but is now 1.51/)
          end

          it 'provides a description' do
            expect(change(nil, :foo).
              to( a_value_within(0.1).of(0.5) ).
              from( a_value_within(0.1).of(1.5) ).description
            ).to eq("change #foo to a value within 0.1 of 0.5 from a value within 0.1 of 1.5")
          end
        end

        context "when given a matcher for `by`" do
          it "passes when the matcher matches" do
            k = 0.5
            expect { k += 1.05 }.to change { k }.by( a_value_within(0.1).of(1) )
          end

          it 'fails with a clear message when the `by` does not match' do
            expect {
              k = 0.5
              expect { k += 1.05 }.to change { k }.by( a_value_within(0.1).of(0.5) )
            }.to fail_with(/expected result to have changed by a value within 0.1 of 0.5, but was changed by 1.05/)
          end

          it 'provides a description' do
            expect(change(nil, :foo).
              by( a_value_within(0.1).of(0.5) ).description
            ).to eq("change #foo by a value within 0.1 of 0.5")
          end
        end
      end

      describe "expect { ... }.not_to change { ... }.from( matcher ).to( matcher )" do
        it 'passes when the matcher matches the `from` value and it does not change' do
          k = 0.51
          expect { }.not_to change { k }.from( a_value_within(0.1).of(0.5) )
        end

        it 'fails with a clear message when the `from` matcher does not match' do
          expect {
            k = 0.51
            expect { }.not_to change { k }.from( a_value_within(0.1).of(1.5) )
          }.to fail_with(/expected result to have initially been a value within 0.1 of 1.5, but was 0.51/)
        end
      end

      describe "include" do
        it "works with be_within(delta).of(expected)" do
          expect([10, 20, 30]).to include( be_within(5).of(24) )
          expect([10, 20, 30]).not_to include( be_within(3).of(24) )
        end

        it "works with be_instance_of(klass)" do
          expect(["foo", 123, {:foo => "bar"}]).to include( be_instance_of(Hash) )
          expect(["foo", 123, {:foo => "bar"}]).not_to include( be_instance_of(Range) )
        end

        it "works with be_kind_of(klass)" do
          class StringSubclass < String; end
          class NotHashSubclass; end

          expect([StringSubclass.new("baz")]).to include( be_kind_of(String) )
          expect([NotHashSubclass.new]).not_to include( be_kind_of(Hash) )
        end

        it "works with be_[some predicate]" do
          expect([double("actual", :happy? => true)]).to include( be_happy )
          expect([double("actual", :happy? => false)]).not_to include( be_happy )
        end
      end
    end
  end
end
