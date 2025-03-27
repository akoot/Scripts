# Downloads the latest version of Paper
# Syntax: Download-Paper [version=(latest)] [output="paper-<version>.jar"] [-X]
# -X switch allows downloading experimental versions

# curl is busted on windows, fix it by running: Remove-Item alias:curl

param (
    [string]$Version=(curl -s 'https://api.papermc.io/v2/projects/paper' | yq -r '.versions[-1]'),
    [String]$Output="paper-$Version.jar",
    [switch]$X=$False
)

$Channel = If ($X) {"experimental"} Else {"default"}
$BuildNumber = (curl -s "https://api.papermc.io/v2/projects/paper/versions/$Version/builds" | yq ".builds | map(select(.channel == \`"$Channel\`") | .build) | .[-1]")
$JarName = "paper-$Version-$BuildNumber.jar"
$Url = "https://api.papermc.io/v2/projects/paper/versions/$Version/builds/$BuildNumber/downloads/$JarName"

curl -o $Output $Url 