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

-- Go to definition
vim.keymap.set('n', '<Leader>d', '<C-]>')
vim.keymap.set('n', '<Leader>n', ':tnext<CR>')
