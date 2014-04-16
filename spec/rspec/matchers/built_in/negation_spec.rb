module RSpec::Matchers::BuiltIn
  describe Negation do

    shared_examples "making a copy" do |copy_methods|
      copy_methods.each do |copy_method|
        context "when making a copy via `#{copy_method}`" do

          let(:base_matcher) { include(3) }
          let(:negation_matcher) { ~base_matcher }
          let(:copied_matcher) { negation_matcher.__send__(copy_method) }

          it "uses a copy of the base matchers" do
            expect(copied_matcher).not_to equal(negation_matcher)
            expect(copied_matcher.matcher).not_to equal(base_matcher)
            expect(copied_matcher.matcher).to be_a(base_matcher.class)
            expect(copied_matcher.matcher.expected).to eq([3])
          end

          it "copies custom matchers properly so they can work even though they have singleton behavior" do
            expect(copied_matcher).not_to equal(negation_matcher)
            expect(copied_matcher.matcher).not_to equal(base_matcher)
            expect([4]).to copied_matcher
            expect { expect([3]).to copied_matcher }.to fail_matching("expected [3] not to include 3")
          end
        end
      end
    end

    include_examples "making a copy", [:clone, :dup]

    def configure_boolean_negation_matcher(enable)
      RSpec.configure do |config|
        config.expect_with :rspec do |c|
          c.enable_boolean_negation_matcher = enable if RUBY_VERSION.to_f > 1.8
        end
      end
    end

    before(:all) do
      configure_boolean_negation_matcher(true)
    end

    after(:all) do
      configure_boolean_negation_matcher(false)
    end

    describe :description do

      let(:matcher) { ~inner_matcher }

      context 'when the matcher responds to :description_when_negated' do
        let(:inner_matcher) {
          base = Class.new(BaseMatcher) do
            def description_when_negated
              'matcher description when negated'
            end
          end
          base.new
        }

        it 'returns the matcher a description when negated' do
          expect(matcher.description).to eq inner_matcher.description_when_negated
        end
      end

      context "when the matcher doesn't responds to :description_when_negated" do
        let(:inner_matcher) {
          base = Class.new(BaseMatcher) do
            def description
              'matcher description'
            end
          end
          base.new
        }

        it 'returns the matcher a description when negated' do
          expect(matcher.description).to eq "not #{inner_matcher.description}"
        end
      end
    end

    describe 'failure message' do
      let(:inner_matcher) { eq('A') }

      it 'returns the matcher negated failure message' do
        inner_matcher.matches?('A')
        expect {
          expect('A').to ~inner_matcher
        }.to fail_with(inner_matcher.failure_message_when_negated)
      end

      context 'when negated' do
        it 'returns the matcher negated failure message' do
          inner_matcher.matches?('B')
          expect {
            expect('B').to_not ~inner_matcher
          }.to fail_with(inner_matcher.failure_message)
        end
      end
    end

    context 'expect(...).to ~(matcher)' do
      it 'can pass when using `~`' do
        expect('A').to ~eq('B')
      end

      it 'can pass when using `!`', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to !eq('B')
      end

      it 'can pass when using `not`', :if => (RUBY_VERSION.to_f > 1.8) do
        eval <<-RUBY
          expect('A').to not(eq('B'))
        RUBY
      end

      context 'when the matcher responds to :does_not_match?' do
        it 'can pass - with :does_not_match?' do
          actual = ['A', 'B']
          matcher = include('C')
          allow(matcher).to receive(:does_not_match?).with(actual).and_call_original
          expect(actual).to ~(matcher)
          expect(matcher).to have_received(:does_not_match?).with(actual)
        end
      end

      context 'when the matcher does not respond to :does_not_match?' do
        it 'can pass - with reverse of :match?' do
          actual = 'A'
          matcher = eq('B')
          allow(matcher).to receive(:matches?).with(actual).and_call_original
          expect(actual).to ~(matcher)
          expect(matcher).to have_received(:matches?).with(actual)
        end
      end
    end

    context 'expect(...).to_not ~(matcher)' do
      it 'can pass when using `~`' do
        expect('A').to_not ~eq('A')
      end
      it 'can pass when using `!`', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to_not !eq('A')
      end
      it 'can pass when using `not`', :if => (RUBY_VERSION.to_f > 1.8) do
        eval <<-RUBY
          expect('A').to_not not(eq('A'))
        RUBY
      end
    end

    context 'expect(...).to (~matcher_1).and (~matcher_2)' do
      it 'can pass when using `~`', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to (~(eq('B'))).and (~eq('C'))
      end
      it 'can pass when using `!`', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to (!eq('B')).and (!eq('C'))
      end
      it 'can pass when using `not`', :if => (RUBY_VERSION.to_f > 1.8) do
        eval <<-RUBY
          expect('A').to( ( not(eq('B')) ).and( not(eq('C')) ) )
        RUBY
      end
    end

    context 'expect(...).to ~(~matcher)' do

      it 'can pass when using `~~`' do
        expect('A').to ~(~eq('A'))
      end

      it 'can pass when using `!!`', :if => (RUBY_VERSION.to_f > 1.8) do
        expect('A').to !!eq('A')
      end

      it 'can pass when using `not(not())`', :if => (RUBY_VERSION.to_f > 1.8) do
        eval <<-RUBY
          expect('A').to not(not(eq('A')))
        RUBY
      end

      it 'returns the original matcher' do
        original_matcher = eq('A')
        double_negate_matcher = ~(~original_matcher)
        expect(original_matcher).to equal double_negate_matcher
      end
    end

  end
end
