require 'spec_helper'

module RSpec
  module Matchers
    describe ".configuration" do
      it 'returns a memoized configuration instance' do
        RSpec::Matchers.configuration.should be_a(RSpec::Matchers::Configuration)
        RSpec::Matchers.configuration.should be(RSpec::Matchers.configuration)
      end
    end

    shared_examples_for "configuring the expectation syntax" do
      # We want a sandboxed method that ensures that we wind up with
      # both syntaxes properly enabled when the example ends.
      #
      # On platforms that fork, using a sub process is the easiest,
      # most robust way to achieve that.
      #
      # On jRuby we just re-enable both syntaxes at the end of the example;
      # however, this is a generally inferior approach because it depends on
      # the code-under-test working properly; if it doesn't work properly,
      # it could leave things in a "broken" state where tons of other examples fail.
      if RUBY_PLATFORM == "java"
        def sandboxed
          yield
        ensure
          configure_syntax([:should, :expect])
        end
      else
        include InSubProcess
        alias sandboxed in_sub_process
      end

      it 'is configured to :should and :expect by default' do
        configured_syntax.should eq([:should, :expect])

        3.should eq(3)
        3.should_not eq(4)
        expect(3).to eq(3)
      end

      it 'can limit the syntax to :should' do
        sandboxed do
          configure_syntax :should
          configured_syntax.should eq([:should])

          3.should eq(3)
          3.should_not eq(4)
          lambda { expect(6).to eq(6) }.should raise_error(NameError)
        end
      end

      it 'is a no-op when configured to :should twice' do
        sandboxed do
          ::Kernel.stub(:method_added).and_raise("no methods should be added here")

          configure_syntax :should
          configure_syntax :should
        end
      end

      it 'can limit the syntax to :expect' do
        sandboxed do
          configure_syntax :expect
          expect(configured_syntax).to eq([:expect])

          expect(3).to eq(3)
          expect { 3.should eq(3) }.to raise_error(NameError)
          expect { 3.should_not eq(3) }.to raise_error(NameError)
        end
      end

      it 'is a no-op when configured to :expect twice' do
        sandboxed do
          RSpec::Matchers.stub(:method_added).and_raise("no methods should be added here")

          configure_syntax :expect
          configure_syntax :expect
        end
      end

      it 'can re-enable the :should syntax' do
        sandboxed do
          configure_syntax :expect
          configure_syntax [:should, :expect]
          configured_syntax.should eq([:should, :expect])

          3.should eq(3)
          3.should_not eq(4)
          expect(3).to eq(3)
        end
      end

      it 'can re-enable the :expect syntax' do
        sandboxed do
          configure_syntax :should
          configure_syntax [:should, :expect]
          configured_syntax.should eq([:should, :expect])

          3.should eq(3)
          3.should_not eq(4)
          expect(3).to eq(3)
        end
      end
    end

    describe "configuring rspec-expectations directly" do
      it_behaves_like "configuring the expectation syntax" do
        def configure_syntax(syntax)
          RSpec::Matchers.configuration.syntax = syntax
        end

        def configured_syntax
          RSpec::Matchers.configuration.syntax
        end
      end
    end

    describe "configuring using the rspec-core config API" do
      it_behaves_like "configuring the expectation syntax" do
        def configure_syntax(syntax)
          RSpec.configure do |rspec|
            rspec.expect_with :rspec do |c|
              c.syntax = syntax
            end
          end
        end

        def configured_syntax
          RSpec.configure do |rspec|
            rspec.expect_with :rspec do |c|
              return c.syntax
            end
          end
        end
      end
    end

  end
end

