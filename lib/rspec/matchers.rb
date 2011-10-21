module RSpec
  # rspec-expecations provides a number of useful Matchers we use to compose
  # expectations. A Matcher is any object that responds to the following:
  #
  #  matches?(actual)
  #  failure_message_for_should
  #
  # These methods are also part of the matcher protocol, but are optional:
  #
  #  does_not_match?(actual)
  #  failure_message_for_should_not
  #  description #optional
  #
  # == Predicates
  #
  # In addition to those Expression Matchers that are defined explicitly, RSpec will
  # create custom Matchers on the fly for any arbitrary predicate, giving your specs
  # a much more natural language feel.
  #
  # A Ruby predicate is a method that ends with a "?" and returns true or false.
  # Common examples are +empty?+, +nil?+, and +instance_of?+.
  #
  # All you need to do is write +should be_+ followed by the predicate without
  # the question mark, and RSpec will figure it out from there. For example:
  #
  #  [].should be_empty     # => [].empty?() | passes
  #  [].should_not be_empty # => [].empty?() | fails
  #
  # In addtion to prefixing the predicate matchers with "be_", you can also use "be_a_"
  # and "be_an_", making your specs read much more naturally:
  #
  #  "a string".should be_an_instance_of(String) =>"a string".instance_of?(String) #passes
  #
  #  3.should be_a_kind_of(Fixnum)        # => 3.kind_of?(Numeric)     | passes
  #  3.should be_a_kind_of(Numeric)       # => 3.kind_of?(Numeric)     | passes
  #  3.should be_an_instance_of(Fixnum)   # => 3.instance_of?(Fixnum)  | passes
  #  3.should_not be_instance_of(Numeric) # => 3.instance_of?(Numeric) | fails
  #
  # RSpec will also create custom matchers for predicates like +has_key?+. To
  # use this feature, just state that the object should have_key(:key) and RSpec will
  # call has_key?(:key) on the target. For example:
  #
  #  {:a => "A"}.should have_key(:a) # => {:a => "A"}.has_key?(:a) | passes
  #  {:a => "A"}.should have_key(:b) # => {:a => "A"}.has_key?(:b) | fails
  #
  # You can use this feature to invoke any predicate that begins with "has_", whether it is
  # part of the Ruby libraries (like +Hash#has_key?+) or a method you wrote on your own class.
  #
  # == Custom Matchers
  #
  # When you find that none of the stock Expectation Matchers provide a natural
  # feeling expectation, you can very easily write your own using RSpec's matcher
  # DSL or writing one from scratch.
  #
  # === Matcher DSL
  #
  # Imagine that you are writing a game in which players can be in various
  # zones on a virtual board. To specify that bob should be in zone 4, you
  # could say:
  #
  #  bob.current_zone.should eql(Zone.new("4"))
  #
  # But you might find it more expressive to say:
  #
  #  bob.should be_in_zone("4")
  #
  # and/or
  #
  #  bob.should_not be_in_zone("3")
  #
  # You can create such a matcher like so:
  #
  #  RSpec::Matchers.define :be_in_zone do |zone|
  #    match do |player|
  #      player.in_zone?(zone)
  #    end
  #  end
  #
  # This will generate a <tt>be_in_zone</tt> method that returns a matcher
  # with logical default messages for failures. You can override the failure
  # messages and the generated description as follows:
  #
  #  RSpec::Matchers.define :be_in_zone do |zone|
  #    match do |player|
  #      player.in_zone?(zone)
  #    end
  #
  #    failure_message_for_should do |player|
  #      # generate and return the appropriate string.
  #    end
  #
  #    failure_message_for_should_not do |player|
  #      # generate and return the appropriate string.
  #    end
  #
  #    description do
  #      # generate and return the appropriate string.
  #    end
  #  end
  #
  # Each of the message-generation methods has access to the block arguments
  # passed to the <tt>create</tt> method (in this case, <tt>zone</tt>). The
  # failure message methods (<tt>failure_message_for_should</tt> and
  # <tt>failure_message_for_should_not</tt>) are passed the actual value (the
  # receiver of <tt>should</tt> or <tt>should_not</tt>).
  #
  # === Custom Matcher from scratch
  #
  # You could also write a custom matcher from scratch, as follows:
  #
  #  class BeInZone
  #    def initialize(expected)
  #      @expected = expected
  #    end
  #
  #    def matches?(target)
  #      @target = target
  #      @target.current_zone.eql?(Zone.new(@expected))
  #    end
  #
  #    def failure_message_for_should
  #      "expected #{@target.inspect} to be in Zone #{@expected}"
  #    end
  #
  #    def failure_message_for_should_not
  #      "expected #{@target.inspect} not to be in Zone #{@expected}"
  #    end
  #  end
  #
  # ... and a method like this:
  #
  #  def be_in_zone(expected)
  #    BeInZone.new(expected)
  #  end
  #
  # And then expose the method to your specs. This is normally done
  # by including the method and the class in a module, which is then
  # included in your spec:
  #
  #  module CustomGameMatchers
  #    class BeInZone
  #      # ...
  #    end
  #
  #    def be_in_zone(expected)
  #      # ...
  #    end
  #  end
  #
  #  describe "Player behaviour" do
  #    include CustomGameMatchers
  #    # ...
  #  end
  #
  # or you can include in globally in a spec_helper.rb file <tt>require</tt>d
  # from your spec file(s):
  #
  #  RSpec::configure do |config|
  #    config.include(CustomGameMatchers)
  #  end
  module Matchers
    # Include Matchers for other test frameworks.
    # Note that MiniTest _must_ come before TU because on ruby 1.9,
    # T::U::TC is a subclass of MT::U::TC and a 1.9 bug can lead
    # to infinite recursion from the `super` call in our method_missing
    # hook.  See this gist for more info:
    #   https://gist.github.com/845896
    if defined?(MiniTest::Unit::TestCase)
      MiniTest::Unit::TestCase.send(:include, self)
    end
    if defined?(Test::Unit::TestCase)
      Test::Unit::TestCase.send(:include, self)
    end

    # @example
    #   actual.should be_true
    #   actual.should be_false
    #   actual.should be_nil
    #   actual.should be_[arbitrary_predicate](*args)
    #   actual.should_not be_nil
    #   actual.should_not be_[arbitrary_predicate](*args)
    #
    # Given true, false, or nil, will pass if actual value is true, false or
    # nil (respectively). Given no args means the caller should satisfy an if
    # condition (to be or not to be). 
    #
    # Predicates are any Ruby method that ends in a "?" and returns true or
    # false.  Given be_ followed by arbitrary_predicate (without the "?"),
    # RSpec will match convert that into a query against the target object.
    #
    # The arbitrary_predicate feature will handle any predicate prefixed with
    # "be_an_" (e.g. be_an_instance_of), "be_a_" (e.g. be_a_kind_of) or "be_"
    # (e.g. be_empty), letting you choose the prefix that best suits the
    # predicate.
    def be(*args)
      args.empty? ?  Matchers::Be.new : equal(*args)
    end

    # Passes if actual is truthy (anything but false or nil)
    def be_true
      BeTrue.new
    end

    # Passes if actual is falsy (false or nil)
    def be_false
      BeFalse.new
    end

    # Passes if actual is nil
    def be_nil
      BeNil.new
    end

    # Passes if actual.kind_of?(expected)
    #
    # == Examples
    #
    #   5.should be_kind_of(Fixnum)
    #   5.should be_kind_of(Numeric)
    #   5.should_not be_kind_of(Float)
    def be_a_kind_of(expected)
      BeAKindOf.new(expected)
    end
    
    alias_method :be_kind_of, :be_a_kind_of
    alias_method :be_a,       :be_a_kind_of
    alias_method :be_an,      :be_a_kind_of

    # Passes if actual.instance_of?(expected)
    #
    # == Examples
    #
    #   5.should be_instance_of(Fixnum)
    #   5.should_not be_instance_of(Numeric)
    #   5.should_not be_instance_of(Float)
    def be_an_instance_of(expected)
      BeAnInstanceOf.new(expected)
    end
    
    alias_method :be_instance_of, :be_an_instance_of

    # Passes if actual == expected +/- delta
    #
    # == Examples
    #
    #   result.should be_within(0.5).of(3.0)
    #   result.should_not be_within(0.5).of(3.0)
    def be_within(delta)
      BeWithin.new(delta)
    end

    # @deprecated use +be_within+ instead.
    def be_close(expected, delta)
      RSpec.deprecate("be_close(#{expected}, #{delta})", "be_within(#{delta}).of(#{expected})")
      be_within(delta).of(expected)
    end

    # Applied to a proc, specifies that its execution will cause some value to
    # change.
    #
    # @param [Object] receiver
    # @param [Symbol] message the message to send the receiver
    #
    # You can either pass <tt>receiver</tt> and <tt>message</tt>, or a block,
    # but not both.
    #
    # When passing a block, it must use the <tt>{ ... }</tt> format, not
    # do/end, as <tt>{ ... }</tt> binds to the +change+ method, whereas do/end
    # would errantly bind to the +should+ or +should_not+ method.
    #
    # == Examples
    #
    #   lambda {
    #     team.add_player(player) 
    #   }.should change(roster, :count)
    #
    #   lambda {
    #     team.add_player(player) 
    #   }.should change(roster, :count).by(1)
    #
    #   lambda {
    #     team.add_player(player) 
    #   }.should change(roster, :count).by_at_least(1)
    #
    #   lambda {
    #     team.add_player(player)
    #   }.should change(roster, :count).by_at_most(1)    
    #
    #   string = "string"
    #   lambda {
    #     string.reverse!
    #   }.should change { string }.from("string").to("gnirts")
    #
    #   lambda {
    #     person.happy_birthday
    #   }.should change(person, :birthday).from(32).to(33)
    #       
    #   lambda {
    #     employee.develop_great_new_social_networking_app
    #   }.should change(employee, :title).from("Mail Clerk").to("CEO")
    #
    #   lambda {
    #     doctor.leave_office
    #   }.should change(doctor, :sign).from(/is in/).to(/is out/)
    #
    #   user = User.new(:type => "admin")
    #   lambda {
    #     user.symbolize_type
    #   }.should change(user, :type).from(String).to(Symbol)
    #
    # == Notes
    #
    # Evaluates <tt>receiver.message</tt> or <tt>block</tt> before and after it
    # evaluates the proc object (generated by the lambdas in the examples
    # above).
    #
    # <tt>should_not change</tt> only supports the form with no subsequent
    # calls to <tt>by</tt>, <tt>by_at_least</tt>, <tt>by_at_most</tt>,
    # <tt>to</tt> or <tt>from</tt>.
    def change(receiver=nil, message=nil, &block)
      Matchers::Change.new(receiver, message, &block)
    end

    # Passes if actual covers expected. This works for
    # Ranges. You can also pass in multiple args
    # and it will only pass if all args are found in Range.
    #
    # == Examples
    #   (1..10).should cover(5)
    #   (1..10).should cover(4, 6)
    #   (1..10).should cover(4, 6, 11) # will fail
    #   (1..10).should_not cover(11)
    #   (1..10).should_not cover(5)    # will fail
    #
    # == Warning: Ruby >= 1.9 only
    def cover(*values)
      Cover.new(*values)
    end

    def exist(*args)
      Exist.new(*args)
    end

    # Passes if <tt>actual == expected</tt>.
    #
    # See http://www.ruby-doc.org/core/classes/Object.html#M001057 for more information about equality in Ruby.
    #
    # == Examples
    #
    #   5.should eq(5)
    #   5.should_not eq(3)
    def eq(expected)
      Eq.new(expected)
    end

    # Passes if +actual.eql?(expected)+
    #
    # See http://www.ruby-doc.org/core/classes/Object.html#M001057 for more information about equality in Ruby.
    #
    # == Examples
    #
    #   5.should eql(5)
    #   5.should_not eql(3)
    def eql(expected)
      Eql.new(expected)
    end

    # Passes if <tt>actual.equal?(expected)</tt> (object identity).
    #
    # See http://www.ruby-doc.org/core/classes/Object.html#M001057 for more information about equality in Ruby.
    #
    # == Examples
    #
    #   5.should equal(5) # Fixnums are equal
    #   "5".should_not equal("5") # Strings that look the same are not the same object
    def equal(expected)
      Equal.new(expected)
    end

    # Passes if receiver is a collection with the submitted
    # number of items OR if the receiver OWNS a collection
    # with the submitted number of items.
    #
    # If the receiver OWNS the collection, you must use the name
    # of the collection. So if a <tt>Team</tt> instance has a
    # collection named <tt>#players</tt>, you must use that name
    # to set the expectation.
    #
    # If the receiver IS the collection, you can use any name
    # you like for <tt>named_collection</tt>. We'd recommend using
    # either "elements", "members", or "items" as these are all
    # standard ways of describing the things IN a collection.
    #
    # This also works for Strings, letting you set an expectation
    # about its length
    #
    # == Examples
    #
    #   # Passes if team.players.size == 11
    #   team.should have(11).players
    #
    #   # Passes if [1,2,3].length == 3
    #   [1,2,3].should have(3).items #"items" is pure sugar
    #
    #   # Passes if ['a', 'b', 'c'].count == 3
    #   [1,2,3].should have(3).items #"items" is pure sugar
    #
    #   # Passes if "this string".length == 11
    #   "this string".should have(11).characters #"characters" is pure sugar
    def have(n)
      Matchers::Have.new(n)
    end

    alias :have_exactly :have

    # @example
    #   should have_at_least(number).items
    #
    # Exactly like have() with >=.
    #
    # == Warning
    #
    # +should_not+ +have_at_least+ is not supported
    def have_at_least(n)
      Matchers::Have.new(n, :at_least)
    end

    # @example
    #
    #   should have_at_most(number).items
    #
    # Exactly like have() with <=.
    #
    # == Warning
    #
    # +should_not+ +have_at_most+ is not supported
    def have_at_most(n)
      Matchers::Have.new(n, :at_most)
    end

    # Passes if actual includes expected. This works for
    # collections and Strings. You can also pass in multiple args
    # and it will only pass if all args are found in collection.
    #
    # == Examples
    #
    #   [1,2,3].should include(3)
    #   [1,2,3].should include(2,3) #would pass
    #   [1,2,3].should include(2,3,4) #would fail
    #   [1,2,3].should_not include(4)
    #   "spread".should include("read")
    #   "spread".should_not include("red")
    def include(*expected)
      Include.new(*expected)
    end

    # Given a Regexp or String, passes if actual.match(pattern)
    #
    # == Examples
    #
    #   email.should match(/^([^\s]+)((?:[-a-z0-9]+\.)+[a-z]{2,})$/i)
    #   email.should match("@example.com")
    def match(expected)
      Match.new(expected)
    end
    
    # With no args, matches if any error is raised.
    # With a named error, matches only if that specific error is raised.
    # With a named error and messsage specified as a String, matches only if both match.
    # With a named error and messsage specified as a Regexp, matches only if both match.
    # Pass an optional block to perform extra verifications on the exception matched
    #
    # == Examples
    #
    #   lambda { do_something_risky }.should raise_error
    #   lambda { do_something_risky }.should raise_error(PoorRiskDecisionError)
    #   lambda { do_something_risky }.should raise_error(PoorRiskDecisionError) { |error| error.data.should == 42 }
    #   lambda { do_something_risky }.should raise_error(PoorRiskDecisionError, "that was too risky")
    #   lambda { do_something_risky }.should raise_error(PoorRiskDecisionError, /oo ri/)
    #
    #   lambda { do_something_risky }.should_not raise_error
    #   lambda { do_something_risky }.should_not raise_error(PoorRiskDecisionError)
    #   lambda { do_something_risky }.should_not raise_error(PoorRiskDecisionError, "that was too risky")
    #   lambda { do_something_risky }.should_not raise_error(PoorRiskDecisionError, /oo ri/)
    def raise_error(error=Exception, message=nil, &block)
      Matchers::RaiseError.new(error, message, &block)
    end

    alias_method :raise_exception, :raise_error

    # Matches if the target object responds to all of the names
    # provided. Names can be Strings or Symbols.
    #
    # == Examples
    # 
    def respond_to(*names)
      Matchers::RespondTo.new(*names)
    end

    # Passes if the submitted block returns true. Yields target to the
    # block.
    #
    # Generally speaking, this should be thought of as a last resort when
    # you can't find any other way to specify the behaviour you wish to
    # specify.
    #
    # If you do find yourself in such a situation, you could always write
    # a custom matcher, which would likely make your specs more expressive.
    #
    # == Examples
    #
    #   5.should satisfy { |n|
    #     n > 3
    #   }
    def satisfy(&block)
      Matchers::Satisfy.new(&block)
    end

    # Given no argument, matches if a proc throws any Symbol.
    #
    # Given a Symbol, matches if the given proc throws the specified Symbol.
    #
    # Given a Symbol and an arg, matches if the given proc throws the
    # specified Symbol with the specified arg.
    #
    # == Examples
    #
    #   lambda { do_something_risky }.should throw_symbol
    #   lambda { do_something_risky }.should throw_symbol(:that_was_risky)
    #   lambda { do_something_risky }.should throw_symbol(:that_was_risky, culprit)
    #
    #   lambda { do_something_risky }.should_not throw_symbol
    #   lambda { do_something_risky }.should_not throw_symbol(:that_was_risky)
    #   lambda { do_something_risky }.should_not throw_symbol(:that_was_risky, culprit)
    def throw_symbol(expected_symbol=nil, expected_arg=nil)
      Matchers::ThrowSymbol.new(expected_symbol, expected_arg)
    end

    autoload :Be,             'rspec/matchers/be'
    autoload :BeAKindOf,      'rspec/matchers/be_kind_of'
    autoload :BeAnInstanceOf, 'rspec/matchers/be_instance_of'
    autoload :BeFalse,        'rspec/matchers/be'
    autoload :BeNil,          'rspec/matchers/be'
    autoload :BeTrue,         'rspec/matchers/be'
    autoload :BeWithin,       'rspec/matchers/be_within'
    autoload :Change,         'rspec/matchers/change'
    autoload :Cover,          'rspec/matchers/cover'
    autoload :Eq,             'rspec/matchers/eq'
    autoload :Eql,            'rspec/matchers/eql'
    autoload :Equal,          'rspec/matchers/equal'
    autoload :Exist,          'rspec/matchers/exist'
    autoload :Has,            'rspec/matchers/has'
    autoload :Have,           'rspec/matchers/have'
    autoload :Include,        'rspec/matchers/include'
    autoload :Match,          'rspec/matchers/match'
    autoload :RaiseError,     'rspec/matchers/raise_error'
    autoload :RespondTo,      'rspec/matchers/respond_to'
    autoload :Satisfy,        'rspec/matchers/satisfy'
    autoload :ThrowSymbol,    'rspec/matchers/throw_symbol'
  end
end

require 'rspec/matchers/extensions/instance_eval_with_args'
require 'rspec/matchers/pretty'
require 'rspec/matchers/base_matcher'
require 'rspec/matchers/matcher'
require 'rspec/matchers/operator_matcher'
require 'rspec/matchers/block_aliases'
require 'rspec/matchers/errors'
require 'rspec/matchers/generated_descriptions'
require 'rspec/matchers/match_array'
require 'rspec/matchers/method_missing'
require 'rspec/matchers/compatibility'
require 'rspec/matchers/dsl'
