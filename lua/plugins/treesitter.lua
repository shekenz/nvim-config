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
      disable = function(lang, bufnr) -- Disable in large files
        return vim.api.nvim_buf_line_count(bufnr) > 3000
      end,
    },
    ensure_installed = {'lua', 'vim', 'html', 'css', 'php', 'php_only', 'phpdoc', 'blade'},
  },
  config = function(_, opts)
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = {'src/parser.c'},
        branch = 'main',
      },
      filetype = 'blade'
    }
    require('nvim-treesitter.configs').setup(opts)
  end,
}
