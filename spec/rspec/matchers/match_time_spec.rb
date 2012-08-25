require 'spec_helper'

describe "using match_time" do
  it_behaves_like "an RSpec matcher", :valid_value => Time.mktime(2012, 8, 25), :invalid_value => Time.mktime(2012, 8, 26) do
    let(:matcher) { match_time(Time.mktime(2012, 8, 25)) }
  end
end

describe "time.should =~ other_time" do
  let :time do
    Time.utc(2012, 8, 25)
  end

  it "passes if actual value differs from expected by less than 1 second" do
    time.should =~ time + 0.999
  end

  it "fails if actual value is lower than expected by at least 1 second" do
    expect {
      time.should =~ time + 1
    }.to fail_with("expected 2012-08-25 00:00:00 +0000 to be same time as 2012-08-25 00:00:01 +0000 but it wasn't")
  end

  it "fails if actual value is higher than expected by at least 1 second" do
    expect {
      time.should =~ time - 1
    }.to fail_with("expected 2012-08-25 00:00:00 +0000 to be same time as 2012-08-24 23:59:59 +0000 but it wasn't")
  end
end

describe "time.should_not =~ other_time" do
  it "fails if actual value differs from expected by less than 1 second" do
    time = Time.utc(2012, 8, 25)
    expect {
      time.should_not =~ time + 0.999
    }.to fail_with("expected 2012-08-25 00:00:00 +0000 not to be same time as 2012-08-25 00:00:00 +0000 but it was")
  end
end
