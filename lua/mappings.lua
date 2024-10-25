-- Leader key
vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.keymap.set('', '<Leader>t', ':echo "Leaderkey"<CR>') -- Leader key test

-- Next/Prev error
vim.keymap.set('n', '<Leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<Leader>k', vim.diagnostic.goto_prev)

-- Move line with Alt+j/k
vim.keymap.set('n', 'Ï', ':m+1<CR>')
vim.keymap.set('n', 'È', ':m-2<CR>')

-- Move faster
vim.keymap.set({'n', 'v'}, '<C-j>', '5j;')
vim.keymap.set({'n', 'v'}, '<C-k>', '5k;')

-- Horizontal scroll
vim.keymap.set('n', '<C-h>', '15zh')
vim.keymap.set('n', '<C-l>', '15zl')

-- Remap arrows to moving from files in normal mode
vim.keymap.set('', '<Left>', ':w <bar> bp<CR>')
vim.keymap.set('', '<Right>', ':w <bar> bn<CR>')
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')

-- Indent with Alt + </> (macOs)
vim.keymap.set('n', '≤', 'V<<ESC>')
vim.keymap.set('n', '≥', 'V><ESC>')
vim.keymap.set('v', '≤', '<gv')
vim.keymap.set('v', '≥', '>gv')

-- One keystroke Indent
vim.keymap.set({'n'}, '<', 'V<<ESC>')
vim.keymap.set({'n'}, '>', 'V><ESC>')

-- Go to definition
vim.keymap.set('n', '<Leader>d', '<C-]>')
vim.keymap.set('n', '<Leader>n', ':tnext<CR>')

-- Close buffer gracefully
vim.keymap.set('', '<C-c>', ':bp <bar> bd #<CR>')

-- Copy register 0 to register "
vim.keymap.set('n', 'gr', ':let @"=@0<CR>')

-- Telescope ignore patterns
local telescope_ignore_patterns = {
  '%.sql$',
}

vim.keymap.set('n', '<leader>s', function()
  vim.g.telescope_ignore_enabled = not vim.g.telescope_ignore_enabled

  require('telescope.config').set_defaults({
    file_ignore_patterns = vim.g.telescope_ignore_enabled and telescope_ignore_patterns or {},
  })
end, { noremap = true, desc = 'Toggle telescope ignore patterns' })

