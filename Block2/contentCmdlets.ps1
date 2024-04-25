# Script to showcase Add-Content, Clear-Content, Get-Content and Set-Content cmdlets

#Showcase file content first
$value = Get-Content -Path .\content.txt
Write-Host "Content of file before any operation: $value"

Write-Host "Add new Content to a file"
# Add content to a file, this will append to the file
Add-Content -Path .\content.txt -Value "This is a new line"

# Get content from a file, this will read the file
$value = Get-Content -Path .\content.txt
Write-Host "Content of file: $value"

# Set content of a file, this will overwrite the file
Set-Content -Path .\content.txt -Value "This is a new line"
$value = Get-Content -Path .\content.txt
Write-Host "Content of file after set: $value"

# Clear content of a file, this will delete the file(content)
Clear-Content -Path .\content.txt
$value = Get-Content -Path .\content.txt
Write-Host "Content of file after clear: $value"


