#!/bin/bash

#See README.md for instructions on how to use this script. 

# Check if there is more than one argument 
if [[ $# -gt "1" ]]; then
	echo "Too many arguments"
	echo "Program can only take directory path as a valid argument"
	echo "Default argument is current directory"
	echo "Usage: ./projectLines.sh [path/of/directory/]"
	echo "Example: ./projectLines.sh ./sample-project/"
	#Exit with code 1 to indicate failure
	exit 1

# Help option and information
elif [[ $# -eq "1" && $1 = "-h" ]] || [[ $# -eq "1" && $1 = "-help" ]] || [[ $# -eq "1" && $1 = "--help" ]]; then
	echo "Outputs the number of lines of code found in the (current) directory."
	echo "Usage: ./projectLines.sh [path/of/directory/]"
	echo "Example: ./projectLines.sh ./sample-project/"
	exit 1

dirpath;
# If argument is provided, attempt to cd into directory
elif [ $# -eq "1" ]; then
	# Set dirpath to the first argument
	dirpath="$1"
	# Check if dirpath is an empty string
	if [[ -z "$dirpath" ]]; then
		# If root directory, change value of variable to the text in quotes
		dirpath="$PWD"
	fi
	# Redirect any stderr and stdout to /dev/null
	cd $1 > /dev/null 2>&1
	# Check exit status of cd (the last command) to see if it was a failure
	# cd will return 0 if success, 1 if failure
	if [ $? -ne "0" ]; then
		echo "Attempt to cd into provided path failed."
		echo "Path provided is not a valid directory."
		# Exit with code 1 to indicate failure
		exit 1
	fi
fi

# Count number of lines within the directory we cd'd into
count=`find . -type f -execdir wc -l {} \; | awk '{lines += $1} END{print lines }'`

# Write to the terminal
echo "Found $count lines of code in $dirpath ."

# Exit with code 0 on successful completion.
exit 0