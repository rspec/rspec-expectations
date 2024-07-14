module RSpec
  module Matchers
    RSpec.describe "eql" do
      it_behaves_like "an RSpec value matcher", :valid_value => 1, :invalid_value => 2 do
        let(:matcher) { eql(1) }
      end

      it "is diffable" do
        expect(eql(1)).to be_diffable
      end

      it "matches when actual.eql?(expected)" do
        expect(1).to eql(1)
      end

      it "does not match when !actual.eql?(expected)" do
        expect(1).not_to eql(2)
      end

      it "describes itself" do
        matcher = eql(1)
        matcher.matches?(1)
        expect(matcher.description).to eq "eql 1"
      end

      it "provides message, expected and actual on #failure_message" do
        matcher = eql("1")
        matcher.matches?(1)
        expect(matcher.failure_message).to eq "\nexpected: \"1\"\n     got: 1\n\n(compared using eql?)\n"
      end

      it "provides message, expected and actual on #negative_failure_message" do
        matcher = eql(1)
        matcher.matches?(1)
        expect(matcher.failure_message_when_negated).to eq "\nexpected: value != 1\n     got: 1\n\n(compared using eql?)\n"
      end

      # Older versions of Ruby such as less than 1.9 do not have String#encoding available, they are an array of bytes
      if String.method_defined?(:encoding)
        context "with String encoding as UTF-16LE" do
          it "provides message, expected and actual on #failure_message when string encoding is the same" do
            matcher = eql('abc'.encode('UTF-16LE'))
            matcher.matches?('def'.encode('UTF-16LE'))
            expect(matcher.failure_message).to eq "\nexpected: \"abc\"\n     got: \"def\"\n\n(compared using eql?)\n"
          end

          it "matches when actual is BINARY encoding and expected is UTF-8 encoding with the same chars" do
            expect('abc'.encode('BINARY')).to eq 'abc'.encode('UTF-8')
          end

          it "provides message, expected and actual with encoding details on #failure_message when string encoding is different" do
            matcher = eql('abc'.encode('UTF-16LE'))
            matcher.matches?('abc'.dup.force_encoding('ASCII-8BIT'))
            expect(matcher.failure_message).to eq "\nexpected: #<Encoding:UTF-16LE> \"abc\"\n     got: #<Encoding:ASCII-8BIT> \"abc\"\n\n(compared using eql?)\n"
          end

          it "provides message, expected and actual on #negative_failure_message" do
            matcher = eql('abc'.encode('UTF-16LE'))
            matcher.matches?('abc'.encode('UTF-16LE'))
            expect(matcher.failure_message_when_negated).to eq "\nexpected: value != \"abc\"\n     got: \"abc\"\n\n(compared using eql?)\n"
          end
        end
      end
    end
  end
end
