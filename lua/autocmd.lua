local api = vim.api

local localGroup = api.nvim_create_augroup('local', { clear = true })
api.nvim_create_autocmd('BufDelete', {
  command = 'lua require("dapui").close()',
  pattern = '<buffer>',
  group = localGroup,
})
