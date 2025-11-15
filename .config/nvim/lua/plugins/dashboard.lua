return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        local logo = [[
 ██▒   █▓ ▒█████   ██▓▓█████▄     ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓
▓██░   █▒▒██▒  ██▒▓██▒▒██▀ ██▌    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒
 ▓██  █▒░▒██░  ██▒▒██▒░██   █▌   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░
  ▒██ █░░▒██   ██░░██░░▓█▄   ▌   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ 
   ▒▀█░  ░ ████▓▒░░██░░▒████▓    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒
   ░ ▐░  ░ ▒░▒░▒░ ░▓   ▒▒▓  ▒    ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░
   ░ ░░    ░ ▒ ▒░  ▒ ░ ░ ▒  ▒    ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░
     ░░  ░ ░ ░ ▒   ▒ ░ ░ ░  ░       ░   ░ ░     ░░   ▒ ░░      ░   
      ░      ░ ░   ░     ░                ░      ░   ░         ░   
     ░                 ░                        ░                   ]]

        logo = string.rep('\n', 8) .. logo .. '\n\n'

        local opts = {
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, '\n'),
                shortcut = {
                    { desc = '[ GitHub]', group = '@property', action = 'Lazy update' },
                    { desc = '[ paulov]', group = '@property', action = 'Lazy update' },
                    { desc = '[󰊳 Update]', group = '@property', action = 'Lazy update' },
                },
                project = {
                    enable = true,
                    limit = 8,
                    label = ' Most Recent Projects:',
                    action = function(path)
                        require('fzf-lua').files({ cwd = path })
                    end,
                },
            },
        }

        -- open dashboard after closing lazy
        if vim.o.filetype == 'lazy' then
            vim.api.nvim_create_autocmd('WinClosed', {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
                    end)
                end,
            })
        end

        require('dashboard').setup(opts)
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
