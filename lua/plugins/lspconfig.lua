-- tsserver path configuration

local function get_global_ts()

  local global_ts;
  if vim.fn.hostname() == 'shekenzmbp.fritz.box' then
    global_ts = '/usr/local/lib/node_modules/typescript/lib'
  else
    global_ts = os.getenv('HOME') .. '/.local/npm/lib/node_modules/typescript/lib'
  end

  return global_ts
end

return {
  'neovim/nvim-lspconfig',

  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
  },

  config = function()

    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local capabilitiesCompletion = vim.lsp.protocol.make_client_capabilities()
    capabilitiesCompletion.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.html.setup {
      capabilities = capabilitiesCompletion;
    }

    lspconfig.intelephense.setup({
      capabilities = capabilities,
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
      init_options = {
        typescript = {
          tsdk = get_global_ts(),
        }
      },
      filetypes = {
        'javascript',
        'vue',
      }
    })

    lspconfig.jsonls.setup({
      capabilities = capabilities,
    })

    lspconfig.cssls.setup{
      capabilities = capabilitiesCompletion
    }

    lspconfig.stylelint_lsp.setup{
      settings = {
        stylelintplus = {
          -- see available options in stylelint-lsp documentation
        }
      }
    }

    vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      -- Disable underline, it's very annoying
      underline = false,
      signs = true,
    })

    vim.fn.sign_define('DiagnosticSignError', {text='󰬌', texthl='CatRed', linehl='', numhl=''})
    vim.fn.sign_define('DiagnosticSignWarn', {text='󰀧', texthl='CatYellow', linehl='', numhl=''})
  end,
}
