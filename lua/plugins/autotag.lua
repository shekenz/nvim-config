return {
  {
    'windwp/nvim-ts-autotag',
    dependencies = {
      'nvim-treesitter/nvim-treesitter', -- Only needed if you want to use sesssion lens
    },
    event = {'BufReadPre', 'BufNewFile'},
    opts = {
      enable_close = true, -- Auto close tags
      enable_rename = true, -- Auto rename pairs of tags
      enable_close_on_slash = false -- Auto close on trailing </
    },
    config = function(_, opts)
      require('nvim-ts-autotag').setup({opts})
    end,
  },
}
