#!/bin/bash
#
# Opens the unique .pbip file found recursively from the current directory.
#
# Exits with an error if zero or more than one .pbip file is found.
# This version uses explorer.exe to bypass WindowsApps permission issues.
#

set -o errexit
set -o nounset
set -o pipefail

# Find .pbip files recursively from the current directory.
# Store file paths in an array.
# The readarray command is safer for paths with spaces.
readarray -t pbip_files < <(find . -type f -name "*.pbip")

# Get the number of .pbip files found.
file_count="${#pbip_files[@]}"

# Handle cases based on the number of files found.
if [ "${file_count}" -eq 0 ]; then
    echo "Error: No .pbip file found in the current directory or subdirectories." >&2
    exit 1
fi

if [ "${file_count}" -gt 1 ]; then
    echo "Error: Multiple .pbip files found. Expected exactly one." >&2
    printf "Found files:\n" >&2
    printf " - %s\n" "${pbip_files[@]}" >&2
    exit 1
fi

# Exactly one file was found.
target_file="${pbip_files[0]}"

echo "Opening '${target_file}' in Power BI..."

# Convert the WSL path to a Windows path and open it with the default program.
# The '&' runs the command in the background, freeing the terminal.
explorer.exe "$(wslpath -w "${target_file}")" &
