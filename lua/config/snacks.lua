if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map('<leader>uh')
end

Snacks.toggle.diagnostics():map('<leader>ud')
Snacks.toggle.line_number():map('<leader>ul')
Snacks.toggle.treesitter():map('<leader>uT')

Snacks.toggle.option('spell', { name = 'Spelling' }):map('<leader>us')
Snacks.toggle.option('wrap', { name = 'Wrap' }):map('<leader>uw')
Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map('<leader>uL')
-- stylua: ignore start
Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map('<leader>ub')
Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }) :map('<leader>uc')
-- stylua: ignore end

Snacks.toggle.profiler():map('<leader>pp')
Snacks.toggle.profiler_highlights():map('<leader>ph')
