require 'spec_helper'

def fix_eof_problem(s)
  # <<-EOF isn't working like its meant to :(
  whitespace = s.split("\n")[-1][/^[ ]+/]
  indentation = whitespace ? whitespace.size : 0
  s.gsub("\n#{" " * indentation}", "\n").strip
end

module RSpec
  module Matchers
    describe :be_hash_matching do

      shared_examples_for "a hash matcher" do
        it "passes if matches" do
          same.should be_hash_matching(expected, opts)
        end

        it "fails if doesn't match" do
          failure_message = fix_eof_problem(difference)
          DiffMatcher::Difference.new(expected, different, opts).to_s.should == failure_message
          lambda { different.should be_hash_matching(expected, opts) }.should fail_with failure_message
        end
      end

      context "when expected has multiple items," do
        let(:expected  ) { { :a=>{ :a1=>11          }, :b=>[ 21, 22 ], :c=>/\d/, :d=>Fixnum, :e=>lambda { |x| (4..6).include? x } } }
        let(:same      ) { { :a=>{ :a1=>11          }, :b=>[ 21, 22 ], :c=>'3' , :d=>4     , :e=>5                                } }
        let(:different ) { { :a=>{ :a1=>10, :a2=>12 }, :b=>[ 21     ], :c=>'3' , :d=>4     , :e=>5                                } }

        before { RSpec.configuration.should_receive(:color_enabled?).and_return false }

        describe "it shows regex, class, proc matches and" do
          let(:opts) { {} }
          let(:difference) {
            <<-EOF
            {
              :a=>{
                :a1=>- 11+ 10,
              + :a2=>12
              },
              :b=>[
              - 22
              ],
              :c=>~ (3),
              :d=>: 4,
              :e=>{ 5
            }
            Where, - 2 missing, + 2 additional, ~ 1 match_regexp, : 1 match_class, { 1 match_proc
            EOF
          }

          it_should_behave_like "a hash matcher"
        end

        describe "it doesn't show matches and" do
          let(:opts) { { :quiet=>true } }
          let(:difference) {
            <<-EOF
            {
              :a=>{
                :a1=>- 11+ 10,
              + :a2=>12
              },
              :b=>[
              - 22
              ]
            }
            Where, - 2 missing, + 2 additional
            EOF
          }

          it_should_behave_like "a hash matcher"
        end

        describe "it ignores additional values" do
          let(:opts) { { :ignore_additional=>true, :quiet=>true } }
          let(:same      ) { { :a=>{ :a1=>11, :xxxx=>9999 }, :b=>[ 21, 22, 9999 ], :c=>'3', :d=>4, :e=>5 } }
          let(:different ) { { :a=>{ :a1=>10, :xxxx=>9999 }, :b=>[ 21           ], :c=>'3', :d=>4, :e=>5 } }
          let(:difference) {
            <<-EOF
            {
              :a=>{
                :a1=>- 11+ 10
              },
              :b=>[
              - 22
              ]
            }
            Where, - 2 missing, + 1 additional
            EOF
          }

          it_should_behave_like "a hash matcher"
        end

        describe "it shows all matches and" do
          let(:opts) { { :verbose=>true } }
          let(:difference) {
            <<-EOF
            {
              :a=>{
                :a1=>- 11+ 10,
              + :a2=>12
              },
              :b=>[
                21,
              - 22
              ],
              :c=>~ (3),
              :d=>: 4,
              :e=>{ 5
            }
            Where, - 2 missing, + 2 additional, ~ 1 match_regexp, : 1 match_class, { 1 match_proc
            EOF
          }

          it_should_behave_like "a hash matcher"
        end

        describe "it shows matches in color and" do
          let(:opts) { { :verbose=>true, :color_scheme=>:default } }
          let(:difference) {
            <<-EOF
            \e[0m{
            \e[0m  :a=>{
            \e[0m    :a1=>\e[31m- \e[1m11\e[0m\e[33m+ \e[1m10\e[0m,
            \e[0m  \e[33m+ \e[1m:a2=>12\e[0m
            \e[0m  },
            \e[0m  :b=>[
            \e[0m    21,
            \e[0m  \e[31m- \e[1m22\e[0m
            \e[0m  ],
            \e[0m  :c=>\e[32m~ \e[0m\e[32m(\e[1m3\e[0m\e[32m)\e[0m\e[0m,
            \e[0m  :d=>\e[34m: \e[1m4\e[0m,
            \e[0m  :e=>\e[36m{ \e[1m5\e[0m
            \e[0m}
            Where, \e[31m- \e[1m2 missing\e[0m, \e[33m+ \e[1m2 additional\e[0m, \e[32m~ \e[1m1 match_regexp\e[0m, \e[34m: \e[1m1 match_class\e[0m, \e[36m{ \e[1m1 match_proc\e[0m
            EOF
          }

          it_should_behave_like "a hash matcher"

          context "on a white background" do
            let(:opts) { { :verbose=>true, :color_scheme=>:white_background } }
            let(:difference) {
              <<-EOF
              \e[0m{
              \e[0m  :a=>{
              \e[0m    :a1=>\e[31m- \e[1m11\e[0m\e[35m+ \e[1m10\e[0m,
              \e[0m  \e[35m+ \e[1m:a2=>12\e[0m
              \e[0m  },
              \e[0m  :b=>[
              \e[0m    21,
              \e[0m  \e[31m- \e[1m22\e[0m
              \e[0m  ],
              \e[0m  :c=>\e[32m~ \e[0m\e[32m(\e[1m3\e[0m\e[32m)\e[0m\e[0m,
              \e[0m  :d=>\e[34m: \e[1m4\e[0m,
              \e[0m  :e=>\e[36m{ \e[1m5\e[0m
              \e[0m}
              Where, \e[31m- \e[1m2 missing\e[0m, \e[35m+ \e[1m2 additional\e[0m, \e[32m~ \e[1m1 match_regexp\e[0m, \e[34m: \e[1m1 match_class\e[0m, \e[36m{ \e[1m1 match_proc\e[0m
              EOF
            }

            it_should_behave_like "a hash matcher"
          end
        end
      end
    end
  end
end
