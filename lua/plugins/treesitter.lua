return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    highlight = {
      enable = true,
      disable = function(lang, bufnr) -- Disable in large files
        return vim.api.nvim_buf_line_count(bufnr) > 3000
      end,
    },
    indent = {
      enable = true,
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
