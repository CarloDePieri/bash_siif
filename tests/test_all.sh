#
# HELPERS
#
describe_case() {
  describe "$1"
  run_s "cd $2; ../../siif ."
}

#
# Actual tests
#

describe_case "A successful test" "01_success"; {

  it "should run succesfully" &&
    assert_exit_code &&
    s||f

  it "should print the passed test with a -" &&
    assert_output_contains "it should work" &&
    s||f "$(print_output_in_error)"

  it "should print that 1 test has passed" &&
    assert_output_contains "passed: 1" &&
    s||f

}


describe_case "Some failing tests" "02_fail"; {

  it "should exit with error" &&
    assert_exit_code 1 &&
    s||f

  it "should print the failed test name with an x" &&
    {
      assert_output_contains "x it should not work" &&
      assert_output_contains "x it should not work with custom error"
    } &&
    s||f

  it "should print the custom error" &&
    assert_output_contains "E: custom error" &&
    s||f

  it "should print the output in the error when requested" &&
    assert_output_contains "No such file or directory" &&
    s||f "$(print_output_in_error)"

  it "should print that 3 tests failed" &&
    assert_output_contains "failed: 3" &&
    s||f

}

# gruppi
# skip
# skip gruppi
# mix skip pass fail
# test file multipli
# i run
# gli assert
# i casi in cui non trova i test

# TODO serve un assert generico che registri il proprio output tipo run
