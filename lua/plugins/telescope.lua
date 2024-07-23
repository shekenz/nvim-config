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
    --[[ defaults = {
      vimgrep_arguments = {
        -- all required except `--smart-case`
        'rg',
        '--color=never',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        -- add your options
        -- '--glob="!sql/"',
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
      { '<leader>n', extensions.recent_files.pick },
      -- { '<leader>b', builtin.buffers },
      { '<leader>b', ':Telescope buffers initial_mode=normal<CR>' },
    }
  end,
}
