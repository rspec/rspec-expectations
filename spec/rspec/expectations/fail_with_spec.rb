# encoding: utf-8

RSpec.describe RSpec::Expectations, "#fail_with" do
  let(:differ) { double("differ") }
  let(:matcher_class) { Struct.new(:expected, :actual)}

  before(:example) do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => false)
    allow(RSpec::Expectations).to receive(:differ) { differ }
  end

  it "includes a diff if expected and actual are diffable" do
    expect(differ).to receive(:diff).and_return("diff text")

    expect {
      RSpec::Expectations.fail_with "message", matcher_class.new("abc", "def")
    }.to fail_with("message\nDiff:diff text")
  end

  it "does not include the diff if expected and actual are not diffable" do
    expect(differ).to receive(:diff).and_return("")

    expect {
      RSpec::Expectations.fail_with "message", matcher_class.new("abc", "def")
    }.to fail_with("message")
  end

  it "raises an error if message is not present" do
    expect(differ).not_to receive(:diff)

    expect {
      RSpec::Expectations.fail_with nil
    }.to raise_error(ArgumentError, /Failure message is nil\./)
  end
end

RSpec.describe RSpec::Expectations, "#fail_with with matchers" do
  let(:matcher_class) { Struct.new(:expected, :actual)}

  before do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => false)
  end

  it "uses matcher descriptions in place of matchers in diffs" do
    expected = [a_string_matching(/foo/), a_string_matching(/bar/)]
    actual = ["poo", "car"]

    expected_diff = dedent(<<-EOS)
      |
      |@@ -1,2 +1,2 @@
      |-[(a string matching /foo/), (a string matching /bar/)]
      |+["poo", "car"]
      |
    EOS

    expect {
      RSpec::Expectations.fail_with "message", matcher_class.new(expected, actual)
    }.to fail_with("message\nDiff:#{expected_diff}")
  end

  context "when matcher provides custom differ" do
    let(:custom_differ) { double("custom differ") }
    let(:custom_diff) { "custom diff" }
    let(:matcher_class) { Struct.new(:expected, :actual, :differ) }

    before(:example) do
      allow(custom_differ).to receive(:diff).and_return(custom_diff)
    end

    it "uses custom differ instead of default" do
      expect(RSpec::Expectations).not_to receive(:differ)

      expect {
        RSpec::Expectations.fail_with "message", matcher_class.new("abc", "def", custom_differ)
      }.to fail_with("message\nDiff:#{custom_diff}")
    end
  end
end

RSpec.describe RSpec::Expectations, "#fail_with with --color" do
  let(:matcher_class) { Struct.new(:expected, :actual)}

  before do
    allow(RSpec::Matchers.configuration).to receive_messages(:color? => true)
  end

  it "tells the differ to use color" do
    expected = "foo bang baz\n"
    actual = "foo bar baz\n"
    expected_diff = "\e[0m\n\e[0m\e[34m@@ -1,2 +1,2 @@\n\e[0m\e[31m-foo bang baz\n\e[0m\e[32m+foo bar baz\n\e[0m"

    expect {
      RSpec::Expectations.fail_with "message", matcher_class.new(expected, actual)
    }.to fail_with("message\nDiff:#{expected_diff}")
  end
end
