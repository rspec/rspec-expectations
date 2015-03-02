RSpec.describe "something" do
  it "does something that passes" do
    expect([1,3,2]).to include(2,3)
  end

  it "does something that fails" do
    expect([1,3]).not_to include(1,18)
  end
end
