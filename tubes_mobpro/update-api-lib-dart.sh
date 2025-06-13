# Set the output file path
OUTPUT_FILE="./swagger.json"

# URL of the JSON to download
URL="https://160.19.167.222:5104/swagger/v1/swagger.json"

curl -o "$OUTPUT_FILE" "$URL"
openapi-generator-cli generate -i "$OUTPUT_FILE" -g dart -o "./lib/tubes/api_utilities"
rm "$OUTPUT_FILE"
rm "./openapitools.json"