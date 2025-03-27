# Figure out what process is locking this file!

param([string]$FileOrFolderPath='.')

if ((Test-Path -Path $FileOrFolderPath) -eq $false) {
  Write-Warning "File or directory does not exist."
} else {
  $LockingProcess = CMD /C "openfiles /query /fo table | find /I ""$FileOrFolderPath"""
  Write-Host $LockingProcess
}