it "should not work" &&
  false &&
  s||f

it "should not work with custom error" &&
  false &&
  s||f "custom error"

run "rm \"notthere\""

it "should not work with print_output_in_error" &&
  false &&
  s||f "custom error $(print_output_in_error)"
