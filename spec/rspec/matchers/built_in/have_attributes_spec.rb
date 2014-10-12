RSpec.describe "#have_attributes matcher" do

  Person = Struct.new(:name, :age)

  class Person
    def parent(parent_name)
      @parent = parent_name
    end
  end

  let(:wrong_name) { "Wrong Name" }
  let(:wrong_age) { 11 }

  let(:correct_name) { "Correct name" }
  let(:correct_age) { 33 }

  let(:person) { Person.new(correct_name, correct_age) }

  shared_examples "not diffable" do
    it "does not render diff" do
      expect { subject }.to fail_matching(
        %r|\A((?!Diff:).)*\Z|m
      )
    end
  end

  shared_examples "has diff output with" do |lines|
    it "renders diff" do
      expect { subject }.to fail_matching(
        %r|Diff:.*#{lines.join(".*")}|m
      )
    end
  end

  it "is diffable" do
    expect(have_attributes(:age => correct_age)).to be_diffable
  end

  describe "expect(...).to have_attributes(with_one_attribute)" do

    it_behaves_like "an RSpec matcher", :valid_value => Person.new("Correct name", 33), :invalid_value => Person.new("Wrong Name", 11) do
      let(:matcher) { have_attributes(:name => "Correct name") }
    end

    it "passes if target has the provided attributes" do
      expect(person).to have_attributes(:name => correct_name)
    end

    context "when target does not have any of the expected attributes" do
      subject { expect(person).to have_attributes(:name => wrong_name) }

      it "fails" do
        expect { subject }.to fail_matching(
          %r|expected #{object_inspect person} to have attributes #{hash_inspect :name => wrong_name}|
        )
      end

      include_examples "has diff output with", [
        '-:name => "Wrong Name",',
        '\+:name => "Correct name",'
      ]

      context "when target had computed attribute that may change over time" do
        class MutablePerson < Person
          def name
            name_to_return = super
            self.name = "Wrong Name"
            name_to_return
          end
        end

        let(:person) { MutablePerson.new(correct_name, correct_age) }

        it "doesn't access these attributes twice" do
          mutated_person = person.dup
          mutated_person.name

          expect{ subject }.to fail_matching(
            %r|expected #{object_inspect mutated_person} to have attributes #{hash_inspect :name => wrong_name}|
          )
        end

        include_examples "has diff output with", [
          '-:name => "Wrong Name",',
          '\+:name => "Correct name",'
        ]
      end
    end

    context "when target does not responds to any of the attributes" do
      subject { expect(person).to have_attributes(:color => 'red') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :color"
        )
      end

      include_examples "not diffable"
    end

    context "when target responds to the attribute but requires arguments" do
      subject { expect(person).to have_attributes(:parent => 'Billy') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :parent with 0 arguments"
        )
      end

      include_examples "not diffable"
    end

    describe "expect(...).to have_attributes(key => matcher)" do

      it "passes when the matchers match" do
        expect(person).to have_attributes(:age => (a_value > 30))
      end

      it 'provides a description' do
        description = have_attributes(:age => (a_value > 30)).description
        expect(description).to eq("have attributes {:age => (a value > 30)}")
      end

      context "when the matcher does not match" do
        subject { expect(person).to have_attributes(:age => (a_value < 10)) }

        it "fails with a clear message" do
          expect { subject }.to fail_matching(
            "expected #{object_inspect person} to have attributes {:age => (a value < 10)}"
          )
        end

        include_examples "has diff output with", [
          '-:age => \(a value < 10\),',
          '\+:age => 33,'
        ]
      end
    end

    describe "expect(...).to have_attributes(key => matcher, other_key => other_matcher)" do
      let(:matcher) { have_attributes(:age => (a_value > 30).and(a_value < 40), :name => /Correct/) }
      let(:wrong_matcher) { have_attributes(:age => (a_value > 5).and(a_value < 10), :name => /Wrong/) }

      it "passes when the matchers match" do
        expect(person).to matcher
      end

      it 'provides a description' do
        description = matcher.description
        expect(description).to match("have attributes #{hash_inspect :age => MatcherValueForRegexp.new((a_value > 30).and(a_value < 40)), :name => /Correct/}")
      end

      context "when the matcher does not match" do
        subject { expect(person).to wrong_matcher }

        it "fails with a clear message" do
          expect { subject }.to fail_matching(
            %r|expected #{Regexp.quote object_inspect(person)} to have attributes #{hash_inspect :age => MatcherValueForRegexp.new((a_value > 5).and(a_value < 10)), :name => /Wrong/}|
          )
        end

        include_examples "has diff output with", [
          '-:age => \(a value > 5 and a value < 10\),',
          '-:name => /Wrong/,',
          '\+:age => 33,',
          '\+:name => "Correct name",'
        ]
      end
    end
  end

  describe "expect(...).to_not have_attributes(with_one_attribute)" do

    it "passes if target does not have any of the expected attributes" do
      expect(person).to_not have_attributes(:age => wrong_age)
    end

    context "when target has all of the expected attributes" do
      subject { expect(person).to_not have_attributes(:age => correct_age) }

      it "fails" do
        expect { subject }.to fail_matching(
          %r|expected #{object_inspect person} not to have attributes #{hash_inspect :age => correct_age}|
        )
      end

      include_examples "not diffable"
    end

    context "when target does not responds to any of the attributes" do
      subject { expect(person).to_not have_attributes(:color => 'red') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :color"
        )
      end

      include_examples "not diffable"
    end

    context "when target responds to the attribute but requires arguments" do
      subject { expect(person).to_not have_attributes(:parent => 'Billy') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :parent with 0 arguments"
        )
      end

      include_examples "not diffable"
    end
  end

  describe "expect(...).to have_attributes(with_multiple_attributes)" do

    it_behaves_like "an RSpec matcher", :valid_value => Person.new("Correct name", 33), :invalid_value => Person.new("Wrong Name", 11) do
      let(:matcher) { have_attributes(:name => "Correct name", :age => 33) }
    end

    it "passes if target has the provided attributes" do
      expect(person).to have_attributes(:name => correct_name, :age => correct_age)
    end

    context "when target does not have any of the expected attributes" do
      subject { expect(person).to have_attributes(:name => correct_name, :age => wrong_age) }

      it "fails" do
        expect { subject }.to fail_matching(
          %r|expected #{object_inspect person} to have attributes #{hash_inspect :name => correct_name, :age => wrong_age}|
        )
      end

      include_examples "has diff output with", [
        '-:age => 11,',
        '\+:age => 33,',
        ':name => "Correct name",'
      ]
    end

    context "when target does not responds to any of the attributes" do
      subject { expect(person).to have_attributes(:name => correct_name, :color => 'red') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :color"
        )
      end

      include_examples "not diffable"
    end

    context "when target responds to the attribute but requires arguments" do
      subject { expect(person).to have_attributes(:name => correct_name, :parent => 'Billy') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :parent with 0 arguments"
        )
      end

      include_examples "not diffable"
    end
  end

  describe "expect(...).to_not have_attributes(with_multiple_attributes)" do

    it "passes if target has none of the expected attributes" do
      expect(person).to_not have_attributes(:name => wrong_name, :age => wrong_age)
    end

    context "when target has any of the expected attributes" do
      subject { expect(person).to_not have_attributes(:name => wrong_name, :age => correct_age) }

      it "fails" do
        expect { subject }.to fail_matching(
          %r|expected #{object_inspect person} not to have attributes #{hash_inspect :name => wrong_name, :age => correct_age}|
        )
      end

      include_examples "not diffable"
    end

    context "when target has all of the expected attributes" do
      subject { expect(person).to_not have_attributes(:name => correct_name, :age => correct_age) }

      it "fails" do
        expect { subject }.to fail_matching(
          %r|expected #{object_inspect person} not to have attributes #{hash_inspect :name => correct_name, :age => correct_age}|
        )
      end

      include_examples "not diffable"
    end

    context "when target does not responds to any of the attributes" do
      subject { expect(person).to_not have_attributes(:name => correct_name, :color => 'red') }

      it "fails" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :color"
        )
      end

      include_examples "not diffable"
    end

    context "when target responds to the attribute but requires arguments" do
      subject { expect(person).to_not have_attributes(:name => correct_name, :parent => 'Billy') }

      it "fails if target responds to the attribute but requires arguments" do
        expect { subject }.to fail_matching(
          "expected #{object_inspect person} to respond to :parent with 0 arguments"
        )
      end

      include_examples "not diffable"
    end
  end


  include RSpec::Matchers::Pretty
  # We have to use Hash#inspect in examples that have multi-entry
  # hashes because the #inspect output on 1.8.7 is non-deterministic
  # due to the fact that hashes are not ordered. So we can't simply
  # put a literal string for what we expect because it varies.
  if RUBY_VERSION.to_f == 1.8
    def hash_inspect(hash)
      /\{(#{hash.map { |key,value| "#{key.inspect} => #{value.inspect}.*" }.join "|" }){#{hash.size}}\}/
    end
  else
    def hash_inspect(hash)
      improve_hash_formatting hash.inspect
    end
  end

  class MatcherValueForRegexp < Struct.new(:value)
    def inspect
      Regexp.quote "(#{value.description})"
    end
  end

  include RSpec::Matchers::Composable
  # a helper for failure message assertion
  def object_inspect(object)
    surface_descriptions_in object.inspect
  end

end
