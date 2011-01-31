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
        end

        #deliberate failure
        describe "unmatching error message" do
          it "should match error" do
            expect{ raise StandardError, 'another message'}.to raise_error(StandardError, 'my message')
          end
        end
      """
    When I run "rspec ./expect_error_with_message.rb"
    Then the output should contain all of these:
      | 2 examples, 1 failure                                                           |
      | expected StandardError with "my message", got #<StandardError: another message> |

  Scenario: expect error with block
    Given a file named "expect_error_with_block_spec.rb" with:
      """
      describe "accessing expected error" do
        it "should pass the error to the block" do
          expected_error = StandardError.new
          actual_error = nil
          expect{raise expected_error}.to raise_error{|block_error|
            actual_error = block_error
          }
          actual_error.should eq(expected_error)
        end
      end
      """
      When I run "rspec ./expect_error_with_block_spec.rb"
      Then the output should contain "1 example, 0 failures"

