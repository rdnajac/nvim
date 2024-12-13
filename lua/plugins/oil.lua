return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  keys = { { '-', '<CMD>Oil --float<CR>' } },
  opts = function()
    local git_utils = require('helpers.git_utils')
    local git_status = git_utils.new_git_status()
    local refresh = require('oil.actions').refresh
    local orig_refresh = refresh.callback
    refresh.callback = function(...)
      git_status = git_utils.new_git_status()
      orig_refresh(...)
    end

    return {
      default_file_explorer = true,
      view_options = {
        is_hidden_file = function(name, bufnr)
          local dir = require('oil').get_current_dir(bufnr)
          local is_dotfile = vim.startswith(name, '.') and name ~= '..'
          -- if no local directory (e.g. for ssh connections), just hide dotfiles
          if not dir then
            return is_dotfile
          end
          -- dotfiles are considered hidden unless tracked
          if is_dotfile then
            return not git_status[dir].tracked[name]
          else
            -- Check if file is gitignored
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
  end,
}
