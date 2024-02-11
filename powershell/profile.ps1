function Git-Status { git status }
function Git-Add { git add $args }
function Git-Diff { git diff }
function Git-Log { git log }
function Git-Commit { git commit $args }
function Qrcode-Gen {
    python "$HOME\dotfiles\qrcode\qc.py" $args
    start "$HOME\qrcode.png"
}
function Show-Calendar {
    python "$HOME\dotfiles\calendar\calendar.py" $args
}
function Php-Artisan { php artisan $args }
function Neovim { nvim $args }
New-Alias lg lazygit
New-Alias gs Git-Status
New-Alias gd Git-Diff
New-Alias ga Git-Add
New-Alias qr Qrcode-Gen
New-Alias calen Show-Calendar
New-Alias art Php-Artisan
New-Alias vi Neovim

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
