$ErrorActionPreference = "Continue" #SilentlyContinue/Continue/Stop

try {
  Write-Host(1 / $null)
}
catch {
  <#Do this if a terminating exception happens#>
  Write-Host("You tried to divide by 0");
  Write-Host($error[0])
  Write-Host($?)
}

Write-Host("Done");
