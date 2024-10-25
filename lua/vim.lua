vim.opt.wrap = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '◀', nbsp = '▒', precedes = '→', extends = '→' }
local tabWidth = 4
vim.opt.tabstop = tabWidth
vim.opt.softtabstop = tabWidth
vim.opt.shiftwidth = tabWidth
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true -- Needed for smartcase to work
vim.opt.smartcase = true -- Case-sensitive search only when using a uppercase letter
vim.opt.splitright = true -- Split new windows to right with vs
vim.opt.showmatch = true -- Match open-close parenthesis
vim.opt.so = 999 -- Keep cursor centered
vim.opt.colorcolumn = '120' -- Max column mark

-- Folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

-- Filetypes
vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
