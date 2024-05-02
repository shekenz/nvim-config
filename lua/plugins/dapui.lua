return {
  'rcarriga/nvim-dap-ui',
  lazy = true,

  keys = {
    { '<F7>', function() require('dapui').toggle() end },
  },

  opts = {
    icons = {
      collapsed = "▶",
      expanded = "▼",
    },
    layouts = {
      {
        elements = {
          { id = 'stacks', size = 0.25 },
          { id = 'scopes', size = 0.75 },
        },
        position = 'right',
        size = 60,
      }
    }
  },

  config = function(_, opts)
    require('dapui').setup(opts)
  end,

  dependencies = {
    {
      'mfussenegger/nvim-dap',

      config = function()
        local dap = require('dap')

        dap.adapters.php = {
          type = 'executable',
          command = 'node',
          args = { vim.fn.expand('~/.local/src/vscode-php-debug/out/phpDebug.js') },
          log = true,
        }

        dap.configurations.php = {
          {
            type = 'php',
            request = 'launch',
            name = 'Listen for Xdebug',
            port = 9003,
            pathMappings = {
              ['/var/www/forms'] = os.getenv('HOME') .. '/Sites/acegforms',
            }
          }
        }

        dap.defaults.fallback.focus_terminal = true;
        vim.fn.sign_define('DapBreakpoint', {text='', texthl='CatRed', linehl='', numhl=''})
        vim.fn.sign_define('DapStopped', {text='󰏤', texthl='CatGreen', linehl='', numhl=''})
      end,

      keys = function()
        local dap = require('dap')
        return {
          { '<F8>', dap.toggle_breakpoint },
          { '<F9>', dap.continue },
          { '<F10>', dap.terminate },
          { '<F11>', dap.step_over },
          { '<F12>', dap.step_into },
        }
      end
    },
    -- 'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
  },
}
