require("hieu.keymaps")
require("hieu.plugins")
require("hieu.lsp")
require("hieu.opts")
require("hieu.cmp")
require("hieu.autopairs")
require("hieu.file_explorer")
require("hieu.telescope")
require("hieu.lualine")

local set = vim.opt

set.syntax = "on"
set.swapfile = false
set.cursorline = true

-- Make line numbers default
vim.wo.number = true

vim.cmd.colorscheme "catppuccin-frappe"


-- Treesitter Plugin Setup 
require('nvim-treesitter.configs').setup {
  ensure_installed = { "lua", "rust", "toml" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting=false,
  },
  ident = { enable = true }, 
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  }
}

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod     = 'expr'
    vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
    vim.opt.foldenable = false -- Disable folding at startup
  end
})
---ENDWORKAROUND




-- FORMAT ON SAVE
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  callback = function()
    vim.lsp.buf.format() 
  end
})

require('Comment').setup()

