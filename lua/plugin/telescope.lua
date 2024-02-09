--- telescope.lua
local M = {
    "nvim-telescope/telescope.nvim",
    commit = "74ce793a60759e3db0d265174f137fb627430355",
    dependencies = {
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "LukasPietzschmann/telescope-tabs",
            commit = "801425bd19d3fb511ef477bf44a1f99b82419a9c",
        },
    },
    lazy = true,
    cmd = "Telescope",
}

function M.config()
    local icons = require "plugin.icons"
    local actions = require "telescope.actions"

    require("telescope").setup {
        defaults = {
            prompt_prefix = icons.ui.Telescope .. " ",
            selection_caret = icons.ui.Forward .. " ",
            entry_prefix = "   ",
            initial_mode = "insert",
            selection_strategy = "reset",
            path_display = { "smart" },
            color_devicons = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            sorting_strategy = nil,
            layout_strategy = nil,
            layout_config = {},
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
                "--hidden",
                "--glob=!.git/",
            },

            mappings = {
                i = {
                    ["<C-n>"] = actions.cycle_history_next,
                    ["<C-p>"] = actions.cycle_history_prev,

                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
                n = {
                    ["<esc>"] = actions.close,
                    ["j"] = actions.move_selection_next,
                    ["k"] = actions.move_selection_previous,
                    ["q"] = actions.close,
                },
            },
        },
        pickers = {
            live_grep = { theme = "dropdown", },
            grep_string = { theme = "dropdown", },
            find_files = { theme = "dropdown", previewer = false, },
            buffers = { theme = "dropdown", previewer = false, initial_mode = "normal",
                mappings = {
                    i = { ["<C-d>"] = actions.delete_buffer, },
                    n = { ["dd"] = actions.delete_buffer, },
                },
            },

            planets = {
                show_pluto = true,
                show_moon = true,
            },

            colorscheme = { enable_preview = true, },

            lsp_references = { theme = "dropdown", initial_mode = "normal", },
            lsp_definitions = { theme = "dropdown", initial_mode = "normal", },
            lsp_declarations = { theme = "dropdown", initial_mode = "normal", },
            lsp_implementations = { theme = "dropdown", initial_mode = "normal", },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
    require("telescope-tabs").setup {
        entry_formatter = function(tab_id, buffer_ids, file_names, file_paths, is_current)
            local entry_string = table.concat(file_names, ", ")
            return string.format("%d: %s%s", tab_id, entry_string, is_current and " " or "")
        end,
        entry_ordinal = function(tab_id, buffer_ids, file_names, file_paths, is_current)
            return table.concat(file_names, " ")
        end,
        show_preview = false,
        close_tab_shortcut_i = "<C-d>", -- if you're in insert mode
        close_tab_shortcut_n = "dd", -- if you're in normal mode
    }

end

return M
