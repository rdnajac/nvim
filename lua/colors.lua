local colors = {
    bg = '#000000',
    fg = '#39ff14',
    blue = '#14afff',
    magenta = '#ff69ff',
}

local function setup()
    vim.api.nvim_command('highlight clear')
    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "custom_scheme"

    -- General colors
    vim.api.nvim_set_hl(0, 'Normal', { bg = "000000" })
    vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg })
    vim.api.nvim_set_hl(0, 'Constant', { fg = colors.fg })

    -- Syntax highlighting
    vim.api.nvim_set_hl(0, 'Statement', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.blue })
    vim.api.nvim_set_hl(0, 'Type', { fg = colors.magenta })
    vim.api.nvim_set_hl(0, 'Special', { fg = colors.magenta })

    -- UI Elements
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#202020' })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#505050', bg = colors.bg })
    vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = '#202020' })
    vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#505050', bg = '#202020' })
    vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#505050', bg = colors.bg })
    vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#303030' })

    -- Additional elements can be customized as needed
end

return {
    setup = setup,
}

