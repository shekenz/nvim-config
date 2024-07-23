return {
  'nvimdev/lspsaga.nvim',

  config = function()
    require('lspsaga').setup({
      lightbulb = {
        enable = false,
      }
    })
  end,

  event = "LspAttach",

  dependencies = {
    'nvim-tree/nvim-web-devicons' -- optional
  },

  keys = {
    { '<Leader><Space>', '<CMD>Lspsaga hover_doc<CR>' }
  }
}
