return {
  {
    'folke/noice.nvim',
      -- stylua: ignore
    keys = { { '<M-Enter>', function() require('noice').redirect(vim.fn.getcmdline()) end, mode = 'c' } },
    -- enabled = false,

    ---@param opts NoiceConfig
    opts = function(_, opts)
      opts.cmdline = { view = 'cmdline' }
      opts.lsp.signature = { auto_open = { enabled = false } }
      -- opts.messages = { enabled = true, view = 'mini' }
      opts.presets = { lsp_doc_border = true }
      opts.routes = {
        {
          filter = {
            cmdline = '^:%s*!',
            kind = 'shell_out',
          },
          view = 'split',
        },
        {
          filter = {
            event = 'msg_show',
            any = {
              { find = '^E486: Pattern not found' },
              { find = 'E85: There is no listed buffer' },
              { find = 'E490: No fold found' },
              { find = 'Already at oldest change' },
              { find = 'There is no next R code chunk to go.' },
            },
          },
          opts = { skip = true },
        },
      }

      Snacks.toggle({
        name = 'Noice',
        get = function()
          return require('noice.config').is_running()
        end,
        set = function(state)
          if state then
            require('noice').enable()
          else
            require('noice').disable()
          end
        end,
      }):map('<leader>uN', { desc = 'Toggle Noice' })
    end,
  },

  {
    'williamboman/mason.nvim',
    opts = {
      ui = {
        border = 'rounded',
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },
}
