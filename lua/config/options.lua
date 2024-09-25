-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("source $HOME/.vim/vimrc")

vim.api.nvim_create_user_command('SynGroup', function()
    local function get_vim_syntax()
        local synid = vim.fn.synID(vim.fn.line('.'), vim.fn.col('.'), 1)
        local trans_synid = vim.fn.synIDtrans(synid)
        return {
            name = vim.fn.synIDattr(synid, "name"),
            trans_name = vim.fn.synIDattr(trans_synid, "name"),
            fg = vim.fn.synIDattr(trans_synid, "fg#"),
            bg = vim.fn.synIDattr(trans_synid, "bg#")
        }
    end

    local function get_treesitter_highlight()
        local bufnr = vim.api.nvim_get_current_buf()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        row = row - 1  -- TreeSitter rows are 0-based
        local captures = vim.treesitter.get_captures_at_pos(bufnr, row, col)
        if #captures > 0 then
            local capture = captures[#captures]  -- Get the last (most specific) capture
            return {
                name = capture.capture,
                trans_name = "@" .. capture.capture,
                fg = "N/A",  -- Treesitter doesn't provide color information directly
                bg = "N/A"
            }
        end
        return nil
    end

    local ts_hl = get_treesitter_highlight()
    local vim_hl = get_vim_syntax()

    local hl = ts_hl or vim_hl
    local source = ts_hl and "Treesitter" or "Vim Syntax"

    local message = string.format("%s: %s -> %s (fg: %s, bg: %s)",
                                  source,
                                  hl.name,
                                  hl.trans_name,
                                  hl.fg ~= "" and hl.fg or "None",
                                  hl.bg ~= "" and hl.bg or "None")

    vim.api.nvim_echo({{message, "Normal"}}, true, {})
end, {})
