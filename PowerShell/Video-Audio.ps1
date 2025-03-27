# Convert all video files in a folder to audio
# Syntax: Video-Audio [folder=.] [videoExtension=mkv] [audioExtension=mp3]

param(
    [Parameter(Mandatory = $false)]
    [string]$FolderPath='.',

    [Parameter(Mandatory = $false)]
    [string]$Ext1='mkv',

    [Parameter(Mandatory = $false)]
    [string]$Ext2='mp3'
)

# Check if ffmpeg is available
if (-Not (Get-Command ffmpeg -ErrorAction SilentlyContinue)) {
    Write-Host "ffmpeg not found. Please make sure it's installed and in your PATH." -ForegroundColor Red
    exit 1
}

# Check if the folder exists
if (-Not (Test-Path -Path $FolderPath)) {
    Write-Host "Folder not found: $FolderPath" -ForegroundColor Red
    exit 1
}

# Get all video files in the folder
$VideoFiles = Get-ChildItem -Path $FolderPath -Filter "*.$Ext1"

if ($VideoFiles.Count -eq 0) {
    Write-Host "No $Ext1 files found in the folder." -ForegroundColor Yellow
    exit
}

# Process each video file
foreach ($File in $VideoFiles) {
    # Create the output file name
    $OutputFile = Join-Path -Path $FolderPath -ChildPath ($File.BaseName + ".$Ext2")

    Write-Host "Converting $($File.Name) to $($OutputFile)..."

    # Run ffmpeg to convert the file
    ffmpeg -i $File.FullName $OutputFile

    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully converted $($File.Name) to $($OutputFile)" -ForegroundColor Green
    } else {
        Write-Host "Error converting $($File.Name)" -ForegroundColor Red
    }
}

Write-Host "All $Ext1 files converted to $Ext2!" -ForegroundColor Cyan
