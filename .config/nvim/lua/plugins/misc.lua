return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'codecompanion' },
    },
    {
        'wakatime/vim-wakatime',
        -- enabled = false,
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    {
        'vyfor/cord.nvim',
        -- enabled = false,
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        build = ':Cord update',
        opts = function()
            local handle = io.popen('uptime -p')

            if not handle then
                Result = 'unknown'
            else
                Result = handle:read('*a')
                handle:close()
            end

            local res = Result:gsub('^%s*(.-)%s*$', '%1')

            local opts = {
                editor = {
                    tooltip = res,
                },
            }

            return opts
        end,
    },
    {
        'projekt0n/github-nvim-theme',
        enabled = false,
        name = 'github',
        config = function()
            vim.cmd('colorscheme github_dark_high_contrast')
        end,
    },
    {
        'edeneast/nightfox.nvim',
        enabled = false,
        name = 'nightfox',
        config = function()
            vim.cmd('colorscheme carbonfox')
        end,
    },
    {
        'shatur/neovim-ayu',
        enabled = false,
        name = 'ayu-dark',
        config = function()
            vim.cmd('colorscheme ayu-dark')
        end,
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        -- enabled = false,
        name = 'oxocarbon',
        config = function()
            vim.cmd('colorscheme oxocarbon')
        end,
    },
}
