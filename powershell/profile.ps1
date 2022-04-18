Invoke-Expression (&starship init powershell)

function Git-Status { git status }
function Git-Add { git add $args }
function Git-Diff { git diff }
function Git-Log { git log }
function Git-Commit { git commit $args }
function Qrcode-Gen {
    python "$HOME\dotfiles\qrcode\qc.py" $args
    start "$HOME\qrcode.png"
}
New-Alias lg lazygit
New-Alias gs Git-Status
New-Alias gd Git-Diff
New-Alias ga Git-Add
New-Alias qr Qrcode-Gen
