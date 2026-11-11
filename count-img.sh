#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Target directory (defaults to current directory if none provided)
TARGET_DIR="${1:-.}"

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory '$TARGET_DIR' does not exist." >&2
  exit 1
fi

# Count the files safely using find
# -iname ensures case-insensitivity (.jpg, .JPG, .jpeg, etc.)
# -type f ensures we only count files, not directories named .jpg
count=$(find "$TARGET_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" \) | wc -l)

echo "Found $count JPG file(s) in '$TARGET_DIR' (including subdirectories)."