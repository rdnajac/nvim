local M = { 'stevearc/oil.nvim' }

-- Utility functions for Git status
local function parse_output(proc)
  local result = proc:wait()
  local ret = {}
  if result.code == 0 then
    for line in vim.gsplit(result.stdout, '\n', { plain = true, trimempty = true }) do
      line = line:gsub('/$', '') -- Remove trailing slash
      ret[line] = true
    end
  end
  return ret
end

local function new_git_status()
  return setmetatable({}, {
    __index = function(self, key)
      local ignore_proc = vim.system(
        { 'git', 'ls-files', '--ignored', '--exclude-standard', '--others', '--directory' },
        { cwd = key, text = true }
      )
      local tracked_proc = vim.system({ 'git', 'ls-tree', 'HEAD', '--name-only' }, { cwd = key, text = true })
      local ret = {
        ignored = parse_output(ignore_proc),
        tracked = parse_output(tracked_proc),
      }
      rawset(self, key, ret)
      return ret
    end,
  })
end

M.cmd = 'Oil'
M.keys = { { '-', '<CMD>Oil --float<CR>', desc = 'Open parent directory' } }
M.opts = function()
  local git_status = new_git_status()
  local refresh = require('oil.actions').refresh
  local orig_refresh = refresh.callback
  refresh.callback = function(...)
    git_status = new_git_status()
    orig_refresh(...)
  end

  return {
    default_file_explorer = true,
    view_options = {
      is_hidden_file = function(name, bufnr)
        local dir = require('oil').get_current_dir(bufnr)
        local is_dotfile = vim.startswith(name, '.') and name ~= '..'
        -- If no local directory (e.g., for SSH connections), hide only dotfiles
        if not dir then
          return is_dotfile
        end
        -- Dotfiles are hidden unless tracked
        if is_dotfile then
          -- return not git_status[dir].tracked[name]
          return true
        else
          -- Check if the file is gitignored
          return git_status[dir].ignored[name]
        end
      end,
    },
    keymaps = {
      ['gi'] = {
        desc = 'Toggle file detail view',
        callback = function()
          detail = not detail
          if detail then
            require('oil').set_columns({ 'icon', 'permissions', 'size', 'mtime' })
          else
            require('oil').set_columns({ 'icon' })
          end
        end,
      },
    },
  }
end

return M
