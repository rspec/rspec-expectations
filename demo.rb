require './lib/rspec/expectations'
class IsolatedTest
  include RSpec::Matchers
  def test
    expect(nil).to(eq(""))
  end
end
RSpec::Expectations::Syntax.enable_expect(IsolatedTest)
IsolatedTest.new.test
