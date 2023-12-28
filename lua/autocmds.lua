--- autocmds.lua
-- See `:help autocommands`

-- Removes certain default formatoptions when entering a buffer.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    --vim.cmd "set formatoptions-=cro"
  end,
})

-- Automatically moves the cursor to the last known position
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        local last_pos = vim.fn.line("'\"")
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
        end
    end,
})

-- Automatically quits the command-line window when it's entered.
vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  callback = function()
    vim.cmd "quit"
  end,
})

-- Equalizes the width and height of windows after the Vim window is resized.
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Checks for file modifications when entering a buffer.
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = { "*" },
  callback = function()
    vim.cmd "checktime"
  end,
})

-- Highlights yanked text briefly after yanking.
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
  end,
})

-- Sets up buffer-local key mappings and options for specific file types.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw", "Jaq", "qf", "git", "help", "man", "lspinfo",
    "spectre_panel", "lir", "DressingSelect", "tsplayground", "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Auto-command for "FileType" event for gitcommit, markdown, and NeogitCommitMessage.
-- Enables word wrapping and spell checking in these file types.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Sets tab settings specific to C files.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "h" },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 8
    vim.opt_local.shiftwidth = 8
  end,
})

-- Sets tab settings specific to C++ files.
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "cpp", "hpp" },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

