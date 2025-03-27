param (
    [string]$Version=(curl -s https://api.papermc.io/v2/projects/paper | yq -r '.versions[-1]'),
    [String]$Output="F:\Repository\Minecraft\Paper\$Version\paper.jar",
    [switch]$X=$False
)
If(!(Test-Path -Path "F:\Repository\Minecraft\Paper\$Version")) {
    mkdir "F:\Repository\Minecraft\Paper\$Version"
}
If ($X) {
    Download-Paper $Version $Output -X
} Else {
    Download-Paper $Version $Output
}