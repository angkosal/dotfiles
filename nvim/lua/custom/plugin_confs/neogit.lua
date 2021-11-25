local ok, neogit = pcall(require, "neogit")

if not ok then
   return
end

local M = {}

M.setup = function(on_attach)
  neogit.setup {
    disable_commit_confirmation = true,
    integrations = {
      diffview = true  
    },
  }
end

return M
