local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
    require("nvim-treesitter.configs").setup {
        auto_install = true,
        modules = {},
        ensure_installed = {
            "lua",
            "vim",
            "c",
            "cpp",
            "bash",
            "python",
            "markdown",
            "ocaml",
        },
        ignore_install = { "" },
        sync_install = false,
        highlight = {
            enable = true,
            disable = { "markdown" },
            additional_vim_regex_highlighting = false,
        },

        -- why??
        indent = { enable = true, disable = {"c"} },
        matchup = { disable = { "lua" }, },
        autotag = { enable = true },
        context_commentstring = { enable = true, enable_autocmd = false, },
        autopairs = { enable = true },

        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["at"] = "@class.outer",
                    ["it"] = "@class.inner",
                    ["ac"] = "@call.outer",
                    ["ic"] = "@call.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["a/"] = "@comment.outer",
                    ["i/"] = "@comment.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["as"] = "@statement.outer",
                    ["is"] = "@scopename.inner",
                    ["aA"] = "@attribute.outer",
                    ["iA"] = "@attribute.inner",
                    ["aF"] = "@frame.outer",
                    ["iF"] = "@frame.inner",
                },
            },
        },
    }
end

return M
