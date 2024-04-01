-- lazy.nvim initialization
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Loading mappings
require('mappings')

-- Loading autocommands
require('autocmd')

-- Install Plugins
local plugins = require('plugins')
require('lazy').setup(plugins)

-- Vim configs
require('vim')
