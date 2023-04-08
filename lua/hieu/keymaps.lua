-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set("i", "jj", "<Esc>")
-- vim.keymap.set("n", "<Leader>d", ":NvimTreeFindFile<CR>", {
--   noremap = true
-- })

vim.keymap.set("n", "<Leader>d", function() 
  local isExplorerOpened = require'nvim-tree.view'.is_visible()

  if isExplorerOpened then
    vim.cmd("NvimTreeClose")
  else 
    vim.cmd("NvimTreeFindFile")
  end
end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
