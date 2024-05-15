# Import the module
Import-Module "./MyCustomCmdlet"

# Example usage with arguments
Get-RepeatedString -InputString "Hello" -RepeatCount 3

Write-Host "=========================="

# Example usage with pipeline input
"Hello", "World" | Get-RepeatedString -RepeatCount 2
