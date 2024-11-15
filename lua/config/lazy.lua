return {
  root = vim.fn.stdpath('data') .. '/lazy', -- directory where plugins will be installed
  defaults = {
    lazy = false,
    version = nil, -- always use the latest git commit
  },
  spec = nil, ---@type LazySpec
  local_spec = false,
  lockfile = vim.fn.stdpath('config') .. '/lazy-lock.json', -- lockfile generated after running update.
  pkg = {
    enabled = false,
  },
  dev = {
    ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
    path = '~/projects',
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    missing = true,
    colorscheme = { 'tokyonight-night' },
  },
  ui = {
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤',
    },
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    border = 'rounded',
    custom_keys = {
      -- You can define custom key maps here. If present, the description will
      -- be shown in the help menu.
      -- To disable one of the defaults, set it to false.
      ['<localleader>l'] = {
        function(plugin)
          require('lazy.util').float_term({ 'lazygit', 'log' }, {
            cwd = plugin.dir,
          })
        end,
        desc = 'Open lazygit log',
      },

      ['<localleader>t'] = {
        function(plugin)
          require('lazy.util').float_term(nil, {
            cwd = plugin.dir,
          })
        end,
        desc = 'Open terminal in plugin dir',
      },
    },
  },
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = true, -- get a notification when changes are found
  },
  performance = {
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      disabled_plugins = {
        'gzip',
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}
