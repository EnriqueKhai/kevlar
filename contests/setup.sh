#!/bin/bash
clear

# Create a new directory.
printf "%s" "Enter contest name: "
read contest_name
mkdir "$contest_name"

# Populate directory with templates.
cp -r ../settings/templates "$contest_name"/"Problem A"
cp -r ../settings/templates "$contest_name"/"Problem B"
cp -r ../settings/templates "$contest_name"/"Problem C"

# Open Visual Studio Code.
cd "$contest_name"
code .
