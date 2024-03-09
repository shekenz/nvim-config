return {
  'catppuccin/nvim',
  name = 'catppuccin',
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme('catppuccin')
    vim.cmd.hi('Type cterm=italic')
    vim.cmd.hi('Normal guibg=NONE ctermbg=NONE')
    vim.cmd.hi('WinSeparator guifg=#6c7086')
    vim.cmd.hi('NormalNC guibg=NONE guifg=#585b70')
    vim.cmd.hi('CatRed guifg=#ed8796')
    vim.cmd.hi('CatGreen guifg=#a6da95')
    vim.cmd.hi('CatDarkRed guifg=#cc394f')
    vim.cmd.hi('CatYellow guifg=#eed49f')
  end
}
