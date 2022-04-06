#!/bin/sh

# sudo apt install shellcheck
# sudo npm install -g typescript-language-server
# sudo apt install -y jq        => for res.nvim: https://github.com/NTBBloodbath/rest.nvim

### Check if a directory does not exist ###
#if [ ! -d "$OUT/.config/nvim" ]
#then
#  echo "clonning..."
#fi

"$S" "$HEREP" "$OUT/.config/nvim"
