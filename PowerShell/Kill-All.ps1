# killall for PowerShell
param([string]$program='null')
taskkill /im $program /f