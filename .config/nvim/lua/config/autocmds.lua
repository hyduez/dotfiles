vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
        require('conform').format({ bufnr = args.buf })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>dD', vim.lsp.buf.workspace_diagnostics, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    end,
})
