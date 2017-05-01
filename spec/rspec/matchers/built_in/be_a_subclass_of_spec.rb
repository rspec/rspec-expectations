SuperKlass = Class.new
SubKlass = Class.new(SuperKlass)
SubSubKlass = Class.new(SubKlass)
OtherKlass = Class.new

module RSpec
  module Matcher
    [:be_a_subclass_of, :be_subclass_of].each do |method|
      RSpec.describe "expect(actual).to #{method}(expected)" do

        it_behaves_like "an RSpec matcher", :valid_value => SubKlass, :invalid_value => OtherKlass do
          let(:matcher) { send(method, SuperKlass) }
        end

        it "passes if actual is subclass of expected class" do
          expect(SubKlass).to send(method, SuperKlass)
        end

        it "passes if actual is subklass of subclass of expected class" do
          expect(SubSubKlass).to send(method, SuperKlass)
        end

        it "fails with failure message for should unless actual is subclass of expected class" do
          expect {
            expect(OtherKlass).to send(method, SuperKlass)
          }.to fail_with(%Q{expected OtherKlass to be a subclass of SuperKlass})
        end

        it "provides a description" do
          matcher = send(method, SuperKlass)
          matcher.matches?(OtherKlass)
          expect(matcher.description).to eq "be a subclass of SuperKlass"
        end
      end

      RSpec.describe "expect(actual).not_to #{method}(expected)" do
        it "fails with failure message for should_not if actual is subclass of expected class" do
          expect {
            expect(SubKlass).not_to send(method, SuperKlass)
          }.to fail_with(%Q{expected SubKlass not to be a subclass of SuperKlass})
        end
      end
    end
  end
end
