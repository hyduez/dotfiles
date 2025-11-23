return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'master',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' }, -- Load immediately when opening a file
    config = function()
        local configs = require('nvim-treesitter.configs')

        configs.setup({
            modules = {},
            ignore_install = {},
            ensure_installed = {
                'lua',
                'vim',
                'vimdoc',
                'query',
            },

            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = { enable = false },
        })
    end,
}
