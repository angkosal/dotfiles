#! /bin/bash

autosuggestionsGit="https://github.com/zsh-users/zsh-autosuggestions.git"
syntaxhighlightingGit="https://github.com/zsh-users/zsh-syntax-highlighting.git"
powerlevel10kGit="https://github.com/romkatv/powerlevel10k.git"

ohmyzsh="$HOME/.oh-my-zsh"
autosuggestions="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
syntaxhighlighting="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
powerlevel10k="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# autosuggestions="$HOME/tmp/zsh-autosuggestions"
# syntaxhighlighting="$HOME/tmp/zsh-syntax-highlighting"
# powerlevel10k="$HOME/tmp/powerlevel10k"

nothingToInstall=true

# Installing oh-my-zsh
if [ ! -d "$ohmyzsh" ]; then
  nothingToInstall=false
  echo
  echo 'Installing oh-my-zsh...'
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Installing zsh-autosuggestions for zsh
if [ ! -d "$autosuggestions" ]; then
  nothingToInstall=false
  echo
  echo 'Installing zsh-autosuggestions...'
  /usr/bin/git clone "$autosuggestionsGit" "$autosuggestions"
fi

# Installing zsh-syntax-highlighting for zsh
if [ ! -d "$syntaxhighlighting" ]; then
  nothingToInstall=false
  echo
  echo 'Installing zsh-syntax-highlighting...'
  /usr/bin/git clone "$syntaxhighlightingGit" "$syntaxhighlighting"
fi

# Installing powerlevel10k for zsh
if [ ! -d "$powerlevel10k" ]; then
  nothingToInstall=false
  echo
  echo 'Installing powerlevel10k...'
  /usr/bin/git clone --depth=1 "$powerlevel10kGit" "$powerlevel10k"
fi

if $nothingToInstall; then
  echo 'Nothing to install...'
fi
