return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    require('telescope').load_extension('fzf')
  end,
  keys = function()
    local builtin = require('telescope.builtin')
    return {
      { '<leader>,', builtin.find_files },
      { '<leader>;', builtin.live_grep },
    }
  end,
}
