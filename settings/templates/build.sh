#!/bin/bash
clear

# Compile.
printf "%s" "Compiling source code..."
g++ -o solution.exe source_code.cpp
mv solution.exe executables/solution.exe
printf "%s\n" " done."

# Run against test cases.
printf "%s" "Running solution against test cases..."
for index in $(seq -f "%02g" 1 10)
do
    if [ -d "test cases"/"test case $index" ]
    then
        # If input.txt is not empty,
        if [ -s "test cases"/"test case $index"/input.txt ]
        then
            ./executables/solution.exe < "test cases"/"test case $index"/input.txt > "test cases"/"test case $index"/output_generated.txt
        fi
    fi
done
printf "%s\n\n" " done."

# Verify results.
printf "%s\n" "Verifying results:"
printf "%s\n" "------------------"
for index in $(seq -f "%02g" 1 10)
do
    if [ -d "test cases"/"test case $index" ]
    then
        # If input.txt is not empty,
        if [ -s "test cases"/"test case $index"/input.txt ]
        then
            printf "%s" "Test-Case $index: "
            diff "test cases"/"test case $index"/output_expected.txt "test cases"/"test case $index"/output_generated.txt | ./executables/check_results.exe
            printf "%s\n" ""
        fi
    fi
done
printf "%s\n" ""

# Prepare source code.
printf "%s" "Preparing solution..."
cp source_code.cpp solution.txt
printf "%s\n" " done!"

# Enhancements

# array test_cases[]

# var index = 1;
# for each test_case in test_cases:
#     if input.txt is empty:
#         continue;
#     else:
#         echo -n "test case $index: "
#         diff output_expected output_generated | check_results
#     index += 1;

# Why? Code =
# test_cases=$(ls "test cases")
# for test_case in "${test_cases[@]}"; do
#     printf "%s\n" "test..." "$test_case"
# done
# Output =
# test...
# test case 1
# test case 2
# test case 3

# for NAMES in $(cat name.txt); do...