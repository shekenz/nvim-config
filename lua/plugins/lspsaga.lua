return {
  'nvimdev/lspsaga.nvim',

  config = function()
    require('lspsaga').setup({
      light_bulb = {
        enable = false,
      }
    })
  end,

  dependencies = {
    'nvim-tree/nvim-web-devicons'     -- optional
  },

  keys = {
    { '<Leader><Space>', '<CMD>Lspsaga hover_doc<CR>' }
  }
}
