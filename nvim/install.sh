#!/bin/sh

# sudo apt install shellcheck
# sudo npm install -g typescript-language-server
# sudo apt install -y jq        => for res.nvim: https://github.com/NTBBloodbath/rest.nvim

### Check if a directory does not exist ###
if [ ! -d "$OUT/.config/nvim" ] 
then
  echo "clonning NvChad..."
  git clone "https://github.com/NvChad/NvChad.git" "$OUT/.config/nvim"
fi

# "$S" "$HEREP" "$OUT/.config/nvim"
echo "symlink NvChad config"
"$S" "$HEREP/lua/custom/init.lua" "$OUT/.config/nvim/lua/custom/init.lua"
"$S" "$HEREP/lua/custom/chadrc.lua" "$OUT/.config/nvim/lua/custom/chadrc.lua"
"$S" "$HEREP/lua/custom/plugins.lua" "$OUT/.config/nvim/lua/custom/plugins.lua"
"$S" "$HEREP/lua/custom/plugin_confs" "$OUT/.config/nvim/lua/custom/plugin_confs"
