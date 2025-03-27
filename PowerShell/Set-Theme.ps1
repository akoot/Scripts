# Oh-My-Posh shortcut for quickly trying out different themes from https://ohmyposh.dev/docs/themes/

param([string]$theme)
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/$theme.omp.json" | Invoke-Expression
clear # Look at your new theme