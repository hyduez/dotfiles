return {
    {
        'wakatime/vim-wakatime',
        enabled = false,
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {},
    },
    {
        'vyfor/cord.nvim',
        enabled = false,
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        build = ':Cord update',
        opts = {
            editor = {
                tooltip = 'nvim',
            },
        },
    },
    {
        dir = '~/Workspaces/flexoki-neovim-fork',
        name = 'flexoki',
        config = function()
            vim.cmd('colorscheme flexoki-dark')
        end,
    },
}
