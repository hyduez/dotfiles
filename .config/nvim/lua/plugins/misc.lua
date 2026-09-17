return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown' },
    },
    {
        'wakatime/vim-wakatime',
        event = 'VeryLazy',
        opts = {},
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        name = 'oxocarbon',
        config = function()
            vim.cmd('colorscheme oxocarbon')
            vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
            vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
        end,
    },
}
