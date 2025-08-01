#!/bin/bash

# Convert all CityGML files in /app/data/input/ to Minecraft format
# This script runs inside the Docker container

# Find all .gml files
FILES=$(find /app/data/input -name "*.gml" -type f 2>/dev/null)

if [ -z "$FILES" ]; then
    echo "No .gml files found in /app/data/input/"
    exit 1
fi

# Count files
FILE_COUNT=$(echo "$FILES" | wc -l)
echo "Found $FILE_COUNT .gml files:"
echo "$FILES" | sed 's|^|  - |'
echo ""

# Run conversion
echo "Starting conversion..."
exec python -m plateau2minecraft --target $FILES --output /app/data/output/