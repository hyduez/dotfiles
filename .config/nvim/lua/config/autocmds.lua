local autocmd_group = vim.api.nvim_create_augroup('Custom auto-commands', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.ts', '*.js', '*.tsx', '*.jsx', '*.json' },
    desc = 'Auto-format Biome-compatible files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!biome format --write ' .. fileName)
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.lua' },
    desc = 'Auto-format Lua files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!stylua ' .. fileName)
    end,
    group = autocmd_group,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.zig' },
    desc = 'Auto-format Zig files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!zig fmt ' .. fileName)
    end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.go' },
    desc = 'Auto-format Go files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!gofmt -w ' .. fileName)
    end,
})

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.cpp' },
    desc = 'Auto-format C++ files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!clang-format -i ' .. fileName)
    end,
})

vim.api.nvim_create_autocmd('VimEnter', {
    callback = function(data)
        -- Check for plain startup (no args, empty buffer) or directory
        local no_args = data.file == '' and vim.bo[data.buf].buftype == ''
        local directory = vim.fn.isdirectory(data.file) == 1

        if not (no_args or directory) then
            return
        end

        -- For directories: Wipe the initial dir buffer and create a fresh one
        if directory then
            vim.cmd.enew() -- Create new empty buffer
            vim.cmd.bd('#') -- Wipe the original dir buffer
            vim.cmd.cd(data.file) -- Change to the opened dir
        end

        -- Show dashboard in the main window (delay slightly for reliability)
        vim.schedule(function()
            require('dashboard'):instance()
        end)
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    end,
})
