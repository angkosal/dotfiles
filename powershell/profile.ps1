function Git-Status { git status }
function Git-Diff { git diff }
function Git-Log { git log }
function Git-Commit { git commit }
oh-my-posh --init --shell pwsh --config ~/AppData/Local/Programs/oh-my-posh/themes/powerlevel10k_classic.omp.json | Invoke-Expression
New-Alias lg lazygit
New-Alias gs Git-Status
New-Alias gd Git-Diff


# New-Alias gl Git-Log
# New-Alias gm Git-Commit
