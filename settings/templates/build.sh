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
            # Trimming I/O files before evaluating results.
            ./executables/trim.exe < "test cases"/"test case $index"/output_expected.txt > "test cases"/"test case $index"/output_expected_trimmed.txt
            ./executables/trim.exe < "test cases"/"test case $index"/output_generated.txt > "test cases"/"test case $index"/output_generated_trimmed.txt
            mv "test cases"/"test case $index"/output_expected_trimmed.txt "test cases"/"test case $index"/output_expected.txt
            mv "test cases"/"test case $index"/output_generated_trimmed.txt "test cases"/"test case $index"/output_generated.txt

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
