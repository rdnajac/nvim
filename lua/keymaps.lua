local map = vim.keymap.set
-- map localleader and hi to a message
map('n', '<localleader>hi', "<cmd>echo 'Hello'<cr>", { noremap = true })
-- -- comment.nvim
-- map("n", "<localleader>/", "gcc", { remap = true })
-- map("v", "<localleader>/", "gc", { remap = true })

-- -- format
-- map("n", "<leader>fm", function()
--   require("conform").format()
-- end)
