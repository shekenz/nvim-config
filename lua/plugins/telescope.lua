return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope.nvim',
    'smartpde/telescope-recent-files',
  },
  config = function()
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('recent_files')
  end,
  keys = function()
    local builtin = require('telescope.builtin')
    local extensions = require('telescope').extensions
    return {
      { '<leader>,', builtin.find_files },
      { '<leader>;', builtin.live_grep },
      { '<leader>r', extensions.recent_files.pick },
    }
  end,
}
