-- init.lua
require('config.lazy') -- https://www.lazyvim.org/news

-- lazyvim configuration `options`
vim.g.autoformat = false

Snacks.toggle.new({
  id = "virtual_text",
  name = "Virtual Text",
  get = function()
    return vim.diagnostic.config().virtual_text
  end,
  set = function(state)
    vim.diagnostic.config({ virtual_text = state })
  end,
}):map("<leader>uv", { desc = "Toggle Virtual Text" })

require("conform").formatters.shfmt = {
  inherit = false,
  command = "shfmt",
  args = { "-ci", "-bn", "-filename", "$FILENAME" },
}
