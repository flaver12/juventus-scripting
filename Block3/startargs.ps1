# Ausgabe der IP-Adressen
# Write-Host "IP-Adresse 1: $($args[0])"
# Write-Host "IP-Adresse 2: $($args[1])"
# Write-Host "IP-Adresse 3: $($args[2])"


# Alternative Methode mit expliziten Parametern
param(
    [string]$IP1,
    [string]$IP2,
    [string]$IP3
)

Write-Host "IP-Adresse 1: $IP1"
Write-Host "IP-Adresse 2: $IP2"
Write-Host "IP-Adresse 3: $IP3"

