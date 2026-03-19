#!/bin/bash

echo "Running functional tests..."

failures=0

run_test() {
    input=$1
    expected=$2
    output=$(./fib $input)
    if [ "$output" == "$expected" ]; then
        echo "Test $input: OK"
    else
        echo "Test $input: FAIL (expected $expected, got $output)"
        failures=$((failures+1))
    fi
}

run_test 0 0
run_test 1 1
run_test 2 1
run_test 3 2
run_test 4 3
run_test 5 5
run_test 6 8
run_test 7 13
run_test 8 21
run_test 9 34
run_test 10 55

if [ $failures -eq 0 ]; then
    echo "All tests passed."
    exit 0
else
    echo "$failures tests failed."
    exit 1
fi
