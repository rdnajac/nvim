local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
    spec = LAZY_PLUGIN_SPEC, -- the global table
    install = { colorscheme = { "tokyonight-night" }, },
    ui = { border = "rounded", },
    change_detection = {
        enabled = true,  -- Enable change detection for plugins.
        notify = false,  -- Disable notifications for changes.
    },
}
