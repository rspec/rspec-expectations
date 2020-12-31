RSpec.describe "keyword argument delegation" do
  # We erroneously introduced keyword argument helpers to try to remove
  # the warnings generated with our normal delegation, these can cause
  # the arguments to be cast as hash and need to not be

  it "does not coerce to hash when passed through an equal? expectation" do
    cls = Class.new { def to_hash; {a:1}; end }
    obj = cls.new
    expect(obj).to be_equal(obj)
  end
end
