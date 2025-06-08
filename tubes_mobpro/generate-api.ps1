# Set the output file path
$outputFile = "./swagger.json"

# URL of the JSON to download
$url = "http://localhost:5104/swagger/v1/swagger.json"

# Download the file
Invoke-WebRequest -Uri $url -OutFile $outputFile

# Generate Dart API client using OpenAPI Generator CLI
openapi-generator-cli generate -i $outputFile -g dart -o "./lib/tubes/api_utilities"

# Remove the output file and openapitools.json if they exist
Remove-Item $outputFile -ErrorAction SilentlyContinue
Remove-Item "./openapitools.json" -ErrorAction SilentlyContinue