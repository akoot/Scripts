# Compare a file hash with the specified hash
# Syntax: Check-Hash <file> <hash> [algorithm=sha256]

param (
    [Parameter(Mandatory = $true)]
    [string]$FilePath,

    [Parameter(Mandatory = $true)]
    [string]$ExpectedHash, 

    [Parameter(Mandatory = $false)]
    [String]$Algo='sha256'
)

# Check if the file exists
if (-Not (Test-Path -Path $FilePath)) {
    Write-Host "File not found: $FilePath" -ForegroundColor Red
    exit 1
}

# Calculate the hash of the file
$FileHash = Get-FileHash -Path $FilePath -Algorithm $Algo

# Compare the calculated hash with the expected hash
if ($FileHash.Hash -eq $ExpectedHash.ToUpper()) {
    Write-Host "Hashes match!" -ForegroundColor Green
} else {
    Write-Host "Hashes do NOT match!" -ForegroundColor Red
    Write-Host "Expected: $ExpectedHash" -ForegroundColor Yellow
    Write-Host "Actual:   $($FileHash.Hash)" -ForegroundColor Yellow
}