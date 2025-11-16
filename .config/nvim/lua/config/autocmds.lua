-- sudo write
vim.api.nvim_create_user_command('Suw', function()
    local filepath = vim.fn.expand('%:p')
    if filepath == '' then
        vim.notify('E32: No file name', vim.log.levels.ERROR)
        return
    end
    -- Save buffer to a temporary file
    local tmpfile = vim.fn.tempname()
    vim.cmd('write! ' .. tmpfile)
    -- Prompt for password
    vim.fn.inputsave()
    local password = vim.fn.inputsecret('Password: ')
    vim.fn.inputrestore()
    if password == '' then
        vim.notify('Invalid password, sudo aborted', vim.log.levels.WARN)
        return
    end
    -- Use sudo to move the file
    local cmd = string.format(
        "sudo -p '' -S dd if=%s of=%s bs=1048576",
        vim.fn.shellescape(tmpfile),
        vim.fn.shellescape(filepath)
    )
    local proc = vim.system({ 'sh', '-c', string.format('echo %q | %s', password, cmd) }):wait()
    -- Handle result
    if proc.code == 0 then
        vim.bo.modified = false
        vim.cmd.checktime()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<ESC>', true, false, true), 'n', true)
    else
        vim.notify(proc.stderr, vim.log.levels.ERROR)
    end

    vim.fn.delete(tmpfile)
end, { desc = 'Sudo write current buffer' })

local autocmd_group = vim.api.nvim_create_augroup('Custom auto-commands', { clear = true })

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
    pattern = { '*.ts', '*.js', '*.json', '*.tsx', '*.jsx' },
    desc = 'Auto-format Biome-compatible files after saving',
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(':!biome format --write')
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
