-- nvim-tree setup
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- setup nvim-tree with the settings I want
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
  }
})

-- auto close if nvimtree is the only thing left
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require('nvim-tree.utils').is_nvim_tree_buf(0) then
      vim.cmd "quit"
    end
  end
})
