Feature: expect error

  Expect a proc to raise an error when called.
  
  Scenario: expect error
    Given a file named "expect_error_spec.rb" with:
      """
      describe Object, "#non_existent_message" do
        it "should raise" do
          expect{Object.non_existent_message}.to raise_error(NameError)
        end
      end

      #deliberate failure
      describe Object, "#public_instance_methods" do
        it "should raise" do
          expect{Object.public_instance_methods}.to raise_error(NameError)
        end
      end
      """
    When I run "rspec ./expect_error_spec.rb"
    Then the output should contain "2 examples, 1 failure"
    Then the output should contain "expected NameError but nothing was raised"

  Scenario: expect no error
    Given a file named "expect_no_error_spec.rb" with:
      """
      describe Object, "#public_instance_methods" do
        it "should not raise" do
          expect{Object.public_instance_methods}.to_not raise_error(NameError)
        end
      end

      #deliberate failure
      describe Object, "#non_existent_message" do
        it "should not raise" do
          expect{Object.non_existent_message}.to_not raise_error(NameError)
        end
      end
      """
    When I run "rspec ./expect_no_error_spec.rb"
    Then the output should contain "2 examples, 1 failure"
    Then the output should contain "undefined method `non_existent_message'"
  
  Scenario: expect error with a message
    Given a file named "expect_error_with_message.rb" with:
      """
        describe "matching error message" do
          it "should match the error message" do
            expect{ raise StandardError, 'my message'}.to raise_error(StandardError, 'my message')
          end
          #deliberate failure
          it "should match the error message" do
            expect{ raise StandardError, 'another message'}.to raise_error(StandardError, 'my message')
          end
        end
      """
    When I run "rspec ./expect_error_with_message.rb"
    Then the output should contain all of these:
      | 2 examples, 1 failure                    |
      | expected StandardError with "my message" |

  Scenario: expect no error with message
    Given a file named "expect_no_error_with_message.rb" with:
      """
        describe "matching no error with message" do
          it "should not match errors with a different message" do
            expect{raise StandardError, 'my message'}.to_not raise_error(StandardError, "another message")
          end

          #deliberate failure
          it "should not match errors with a different message" do
            expect{raise StandardError, "my message"}.to_not raise_error(StandardError, 'my message')
          end
        end
      """
    When I run "rspec ./expect_no_error_with_message.rb"
    Then the output should contain all of these:
      | 2 examples, 1 failure                       |
      | expected no StandardError with "my message" |

  Scenario: expect error with block
    Given a file named "expect_error_with_block_spec.rb" with:
      """
      describe "accessing expected error" do
        let(:expected_error){ StandardError.new}

        it "should pass the error to the block" do
          expect{raise expected_error}.to raise_error{|block_error|
            block_error.should eq(expected_error)
          }
        end

        # deliberate failure to assert block called
        it "should pass the error to the block" do
          expect{raise expected_error}.to raise_error{|block_error|
            block_error.should_not eq(expected_error)
          }
        end

      end
      """
      When I run "rspec ./expect_error_with_block_spec.rb"
      Then the output should contain all of these:
        | 2 examples, 1 failure |
        | expected #<StandardError: StandardError> not to equal #<StandardError: StandardError> |

