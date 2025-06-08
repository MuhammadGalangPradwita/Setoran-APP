#!/bin/bash

set -e

# The JSON file must already exist in the current directory as swagger.json
OUTPUT_FILE="./swagger.json"

# Generate Dart client code using openapi-generator-cli
openapi-generator-cli generate -i "$OUTPUT_FILE" -g dart -o "./lib/tubes/api_utilities"

# Remove the Swagger JSON and openapitools.json if they exist
rm -f "$OUTPUT_FILE"
rm -f "./openapitools.json"