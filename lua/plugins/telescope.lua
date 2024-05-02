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
  opts = {
    --[[ pickers = {
      find_files = {
        find_command = {
          'fd',
          '--type',
          'f',
          '--no-ignore-vcs',
          '--color=never',
          '--hidden',
          '--follow',
        },
      },
    }, ]]
  },
  config = function(_, opts)
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('recent_files')
    require('telescope').setup(opts)
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
