return {
    {
        'wakatime/vim-wakatime',
        lazy = false,
        opts = {},
    },
    {
        'vyfor/cord.nvim',
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
