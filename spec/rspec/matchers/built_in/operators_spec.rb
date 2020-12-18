class MethodOverrideObject
  def method
    :foo
  end
end

class MethodMissingObject < Struct.new(:original)
  undef ==

  def method_missing(name, *args, &block)
    original.__send__ name, *args, &block
  end
end

RSpec.describe "operator matchers" do
  describe "should ==" do
    subject { 'apple'.dup }

    it "delegates message to target" do
      expect(subject).to receive(:==).with("apple").and_return(true)
      should == "apple"
    end

    it "returns true on success" do
      expect(should == "apple").to be(true)
    end

    it "fails when target.==(actual) returns false" do
      expect(RSpec::Expectations).to receive(:fail_with).with(%{expected: "orange"\n     got: "apple" (using ==)}, "orange", "apple")
      should == "orange"
    end

    context "when #method is overriden" do
      subject(:myobj) { MethodOverrideObject.new }
      it { expect { should == myobj }.to_not raise_error }
    end

    context "when implemented via method_missing" do
      let(:obj) { Object.new }
      subject(:myobj) { MethodMissingObject.new(obj) }

      it { should == obj }
      it { should_not == Object.new }
    end
  end

  describe "unsupported operators" do
    subject { "apple" }

    it "raises an appropriate error for should != expected" do
      expect {
        should != "pear"
      }.to raise_error(/does not support `should != expected`.  Use `should_not == expected`/)
    end

    it "raises an appropriate error for should_not != expected" do
      expect {
        should_not != "pear"
      }.to raise_error(/does not support `should_not != expected`.  Use `should == expected`/)
    end

    it "raises an appropriate error for should !~ expected" do
      expect {
        should !~ /regex/
      }.to raise_error(/does not support `should !~ expected`.  Use `should_not =~ expected`/)
    end

    it "raises an appropriate error for should_not !~ expected" do
      expect {
        should_not !~ /regex/
      }.to raise_error(/does not support `should_not !~ expected`.  Use `should =~ expected`/)
    end
  end

  describe "should_not ==" do
    subject { "orange" }

    it "delegates message to target" do
      expect(subject).to receive(:==).with("apple").and_return(false)
      should_not == "apple"
    end

    it "returns false on success" do
      expect(should_not == "apple").to be(false)
    end

    it "fails when target.==(actual) returns true" do
      expect(RSpec::Expectations).to receive(:fail_with).with(%(expected not: == "orange"\n         got:    "orange"), "orange", "orange")
      should_not == "orange"
    end
  end

  describe "should ===" do
    subject { "apple" }

    it "delegates message to target" do
      expect(subject).to receive(:===).with("apple").and_return(true)
      should === "apple"
    end

    it "fails when target.===(actual) returns false" do
      expect(subject).to receive(:===).with("orange").and_return(false)
      expect(RSpec::Expectations).to receive(:fail_with).with(%{expected: "orange"\n     got: "apple" (using ===)}, "orange", "apple")
      should === "orange"
    end
  end

  describe "should_not ===" do
    subject { "apple" }

    it "delegates message to target" do
      expect(subject).to receive(:===).with("apple").and_return(false)
      should_not === "apple"
    end

    it "fails when target.===(actual) returns true" do
      expect(subject).to receive(:===).with("apple").and_return(true)
      expect(RSpec::Expectations).to receive(:fail_with).with(%(expected not: === "apple"\n         got:     "apple"), "apple", "apple")
      should_not === "apple"
    end
  end

  describe "should =~" do
    subject { "foo" }

    it "delegates message to target" do
      expect(subject).to receive(:=~).with(/oo/).and_return(true)
      should =~ /oo/
    end

    it "fails when target.=~(actual) returns false" do
      expect(RSpec::Expectations).to receive(:fail_with).with(%{expected: /fu/\n     got: "foo" (using =~)}, /fu/, "foo")
      should =~ /fu/
    end
  end

  describe "should_not =~" do
    subject { "foo" }

    it "delegates message to target" do
      expect(subject).to receive(:=~).with(/fu/).and_return(false)
      should_not =~ /fu/
    end

    it "fails when target.=~(actual) returns false" do
      expect(RSpec::Expectations).to receive(:fail_with).with(%(expected not: =~ /oo/\n         got:    "foo"), /oo/, "foo")
      should_not =~ /oo/
    end
  end

  describe "should >" do
    subject { 4 }

    it "passes if > passes" do
      should > 3
    end

    it "fails if > fails" do
      expect(RSpec::Expectations).to receive(:fail_with).with("expected: > 5\n     got:   4", 5, 4)
      should > 5
    end
  end

  describe "should >=" do
    subject { 4 }

    it "passes if actual == expected" do
      should >= 4
    end

    it "passes if actual > expected" do
      should >= 3
    end

    it "fails if > fails" do
      expect(RSpec::Expectations).to receive(:fail_with).with("expected: >= 5\n     got:    4", 5, 4)
      should >= 5
    end
  end

  describe "should <" do
    subject { 4 }

    it "passes if < passes" do
      should < 5
    end

    it "fails if > fails" do
      expect(RSpec::Expectations).to receive(:fail_with).with("expected: < 3\n     got:   4", 3, 4)
      should < 3
    end
  end

  describe "should <=" do
    subject { 4 }

    it "passes if actual == expected" do
      should <= 4
    end

    it "passes if actual < expected" do
      should <= 5
    end

    it "fails if > fails" do
      expect(RSpec::Expectations).to receive(:fail_with).with("expected: <= 3\n     got:    4", 3, 4)
      should <= 3
    end
  end

  describe "OperatorMatcher registry" do
    let(:custom_klass) { Class.new }
    let(:custom_subklass) { Class.new(custom_klass) }

    after {
      RSpec::Matchers::BuiltIn::OperatorMatcher.unregister(custom_klass, "=~")
    }

    it "allows operator matchers to be registered for classes" do
      RSpec::Matchers::BuiltIn::OperatorMatcher.register(custom_klass, "=~", RSpec::Matchers::BuiltIn::Match)
      expect(RSpec::Matchers::BuiltIn::OperatorMatcher.get(custom_klass, "=~")).to eq(RSpec::Matchers::BuiltIn::Match)
    end

    it "considers ancestors when finding an operator matcher" do
      RSpec::Matchers::BuiltIn::OperatorMatcher.register(custom_klass, "=~", RSpec::Matchers::BuiltIn::Match)
      expect(RSpec::Matchers::BuiltIn::OperatorMatcher.get(custom_subklass, "=~")).to eq(RSpec::Matchers::BuiltIn::Match)
    end

    it "returns nil if there is no matcher registered for a class" do
      expect(RSpec::Matchers::BuiltIn::OperatorMatcher.get(custom_klass, "=~")).to be_nil
    end
  end

  describe RSpec::Matchers::BuiltIn::PositiveOperatorMatcher do
    subject(:o) { Object.new }

    it "works when the target has implemented #send" do
      def o.send(*_args); raise "DOH! Library developers shouldn't use #send!" end
      expect { should == o }.not_to raise_error
    end
  end

  describe RSpec::Matchers::BuiltIn::NegativeOperatorMatcher do
    subject(:o) { Object.new }

    it "works when the target has implemented #send" do
      def o.send(*_args); raise "DOH! Library developers shouldn't use #send!" end
      expect { should_not == :foo }.not_to raise_error
    end
  end
end
