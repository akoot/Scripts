# Update the paper in my paper repo
# Syntax: Update-Paper [version=(latest)] [outputFile="F:\Repository\Minecraft\Paper\$Version\paper.jar"] [-X]
# -X switch allows downloading experimental versions

# curl is busted on windows, fix it by running: Remove-Item alias:curl

param (
    [string]$Version=(curl -s 'https://api.papermc.io/v2/projects/paper' | yq -r '.versions[-1]'),
    [String]$Output="F:\Repository\Minecraft\Paper\$Version\paper.jar",
    [switch]$X=$False
)
$ParentDir = Split-Path -Path $Output -Parent
If(!(Test-Path -Path $ParentDir)) {
    mkdir $ParentDir
}
If ($X) {
    Download-Paper $Version $Output -X
} Else {
    Download-Paper $Version $Output
}