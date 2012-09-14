require 'spec_helper'

describe "Matchers generate their own descriptions" do
  after(:each) do
    RSpec::Matchers.clear_generated_description
  end

  it "should == expected" do
    "this".should == "this"
    RSpec::Matchers.generated_description.should == "== \"this\""
  end

  it "should not == expected" do
    "this".should_not == "that"
    RSpec::Matchers.generated_description.should == "does not == \"that\""
  end

  it "should be empty (arbitrary predicate)" do
    [].should be_empty
    RSpec::Matchers.generated_description.should == "is empty"
  end

  it "should not be empty (arbitrary predicate)" do
    [1].should_not be_empty
    RSpec::Matchers.generated_description.should == "is not empty"
  end

  it "should be true" do
    true.should be_true
    RSpec::Matchers.generated_description.should == "is true"
  end

  it "should be false" do
    false.should be_false
    RSpec::Matchers.generated_description.should == "is false"
  end

  it "should be nil" do
    nil.should be_nil
    RSpec::Matchers.generated_description.should == "is nil"
  end

  it "should be > n" do
    5.should be > 3
    RSpec::Matchers.generated_description.should == "is > 3"
  end

  it "should be predicate arg1, arg2 and arg3" do
    5.0.should be_between(0,10)
    RSpec::Matchers.generated_description.should == "is between 0 and 10"
  end

  it "should not be predicate arg1, arg2 and arg3" do
    5.0.should_not be_between(0, 1)
    RSpec::Matchers.generated_description.should == "is not between 0 and 1"
  end

  it "should equal" do
    expected = "expected"
    expected.should equal(expected)
    RSpec::Matchers.generated_description.should == "equals \"expected\""
  end

  it "should_not equal" do
    5.should_not equal(37)
    RSpec::Matchers.generated_description.should == "does not equal 37"
  end

  it "should eql" do
    "string".should eql("string")
    RSpec::Matchers.generated_description.should == "eql \"string\""
  end

  it "should not eql" do
    "a".should_not eql(:a)
    RSpec::Matchers.generated_description.should == "does not eql :a"
  end

  it "should have_key" do
    {:a => "a"}.should have_key(:a)
    RSpec::Matchers.generated_description.should == "has key :a"
  end

  it "should have_some_method" do
    object = Object.new
    def object.has_eyes_closed?; true; end

    object.should have_eyes_closed
    RSpec::Matchers.generated_description.should == 'has eyes closed'
  end

  it "should have_some_method(args*)" do
    object = Object.new
    def object.has_taste_for?(*args); true; end

    object.should have_taste_for("wine", "cheese")
    RSpec::Matchers.generated_description.should == 'has taste for "wine", "cheese"'
  end

  it "should have n items" do
    team.should have(3).players
    RSpec::Matchers.generated_description.should == "has 3 players"
  end

  it "should have at least n items" do
    team.should have_at_least(2).players
    RSpec::Matchers.generated_description.should == "has at least 2 players"
  end

  it "should have at most n items" do
    team.should have_at_most(4).players
    RSpec::Matchers.generated_description.should == "has at most 4 players"
  end

  it "should include" do
    [1,2,3].should include(3)
    RSpec::Matchers.generated_description.should == "includes 3"
  end

  it "array.should =~ [1,2,3]" do
    [1,2,3].should =~ [1,2,3]
    RSpec::Matchers.generated_description.should == "contains exactly 1, 2 and 3"
  end

  it "should match" do
    "this string".should match(/this string/)
    RSpec::Matchers.generated_description.should == "matches /this string/"
  end

  it "should raise_error" do
    lambda { raise }.should raise_error
    RSpec::Matchers.generated_description.should == "raises Exception"
  end

  it "should raise_error with type" do
    lambda { raise }.should raise_error(RuntimeError)
    RSpec::Matchers.generated_description.should == "raises RuntimeError"
  end

  it "should raise_error with type and message" do
    lambda { raise "there was an error" }.should raise_error(RuntimeError, "there was an error")
    RSpec::Matchers.generated_description.should == "raises RuntimeError with \"there was an error\""
  end

  it "should not raise_error with type and message" do
    lambda { "Innocuous" }.should_not raise_error(RuntimeError, "there was an error")
    RSpec::Matchers.generated_description.should == "does not raise RuntimeError with \"there was an error\""
  end

  it "should respond_to" do
    [].should respond_to(:insert)
    RSpec::Matchers.generated_description.should == "responds to #insert"
  end

  it "should throw symbol" do
    lambda { throw :what_a_mess }.should throw_symbol
    RSpec::Matchers.generated_description.should == "throws a Symbol"
  end

  it "should throw symbol (with named symbol)" do
    lambda { throw :what_a_mess }.should throw_symbol(:what_a_mess)
    RSpec::Matchers.generated_description.should == "throws :what_a_mess"
  end

  it "should == expected" do
    3.should == 3
    RSpec::Matchers.generated_description.should == "== 3"
  end
end

def team
  Class.new do
    def players
      [1,2,3]
    end
  end.new
end

describe "a Matcher with no description" do
  def matcher
     Class.new do
       def matches?(ignore); true; end
       def failure_message; ""; end
     end.new
  end

  it "provides a helpful message when used in a string-less example block" do
    5.should matcher
    RSpec::Matchers.generated_description.should =~ /When you call.*description method/m
  end
end
