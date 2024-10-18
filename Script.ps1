# Define the necessary parameters
$organization = "{Your_Organzition}"
$project = "$(System.TeamProject)"
$releaseId = "$env:RELEASE_RELEASEID"
$apiVersion = "7.1"

# Create the API URL
$uri = "https://vsrm.dev.azure.com/$organization/$project/_apis/release/releases/$releaseId/logs?api-version=$apiVersion"

# Use the System.AccessToken as authentication method
$headers = @{Authorization = "Bearer $(System.AccessToken)"}

# Make the GET request to fetch the logs and save it as logs.zip
$response = Invoke-RestMethod -Uri $uri -Method Get -Headers $headers  -OutFile 'logs.zip'


