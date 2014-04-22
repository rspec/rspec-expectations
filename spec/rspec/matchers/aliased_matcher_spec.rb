module RSpec
  module Matchers

    RSpec::Matchers.define :my_base_matcher do
      match { |actual| actual == foo }

      def foo
        13
      end

      def description
        "my base matcher description"
      end
    end

    describe AliasedMatcher do

      shared_examples "making a copy" do |copy_method|
        context "when making a copy via `#{copy_method}`" do
          it "uses a copy of the base matcher" do
            base_matcher = include(3)
            aliased = AliasedMatcher.new(base_matcher, Proc.new {})
            copy = aliased.__send__(copy_method)

            expect(copy).not_to equal(aliased)
            expect(copy.base_matcher).not_to equal(base_matcher)
            expect(copy.base_matcher).to be_a(RSpec::Matchers::BuiltIn::Include)
            expect(copy.base_matcher.expected).to eq([3])
          end

          it "copies custom matchers properly so they can work even though they have singleton behavior" do
            base_matcher = my_base_matcher
            aliased = AliasedMatcher.new(base_matcher, Proc.new {})
            copy = aliased.__send__(copy_method)

            expect(copy).not_to equal(aliased)
            expect(copy.base_matcher).not_to equal(base_matcher)

            expect(13).to copy

            expect { expect(15).to copy }.to fail_with(/expected 15/)
          end
        end
      end

      include_examples "making a copy", :dup
      include_examples "making a copy", :clone

      it 'can get a method object for delegated methods', :if => (RUBY_VERSION.to_f > 1.8) do
        matcher = my_base_matcher
        decorated = AliasedMatcher.new(matcher, Proc.new { })

        expect(decorated.method(:foo).call).to eq(13)
      end

      it 'can get a method object for `description`' do
        matcher = my_base_matcher
        decorated = AliasedMatcher.new(matcher, Proc.new { "overriden description" })

        expect(decorated.method(:description).call).to eq("overriden description")
      end

      RSpec::Matchers.alias_matcher :my_overriden_matcher, :my_base_matcher do |desc|
        desc + " (overriden)"
      end

      it 'overrides the description with the provided block' do
        matcher = my_overriden_matcher
        expect(matcher.description).to eq("my base matcher description (overriden)")
      end

      RSpec::Matchers.alias_matcher :my_blockless_override, :my_base_matcher

      it 'provides a default description override based on the old and new games' do
        matcher = my_blockless_override
        expect(matcher.description).to eq("my blockless override description")
      end
    end

    describe AliasedNegatedMatcher do

      # RSpec::Matchers.define_negated_matcher :my_negated_base_matcher, :my_base_matcher




      RSpec::Matchers.define_negated_matcher :a_value_not_between, :be_between do |desc|
        desc  + " (overriden)"
      end

      fit 'can get a method object for delegated methods', :if => (RUBY_VERSION.to_f > 1.8) do
        # expect(14).to negated_matcher

        expect(44).to a_value_not_between(3, 15)
        # expect(14).to a_value_between(3, 13)
      end




      it 'can get a method object for delegated methods', :if => (RUBY_VERSION.to_f > 1.8) do
        # expect(14).to negated_matcher

        expect(14).to my_negated_base_matcher
      end

      it 'overrides the description with the provided block' do
        negated_matcher = my_negated_base_matcher
        expect(negated_matcher.description).to eq("my negated base matcher description")
      end

      # RSpec::Matchers.define_negated_matcher :my_negated_base_matcher, :my_base_matcher do |desc|
      #   desc + " (overriden)"
      # end
      #
      # it 'overrides the description with the provided block' do
      #   matcher = my_negated_base_matcher
      #   expect(matcher.description).to eq("my negated base matcher description (overriden)")
      # end

    end
  end
end

