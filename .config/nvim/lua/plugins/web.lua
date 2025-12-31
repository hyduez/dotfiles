return {
    {
        'mawkler/jsx-element.nvim',
        lazy = true,
        ft = { 'typescriptreact', 'javascriptreact' },
        opts = {},
    },
    {
        'yelog/i18n.nvim',
        lazy = true,
        ft = { 'typescriptreact', 'javascriptreact' },
        config = function()
            require('i18n').setup({
                locales = { 'es', 'en' },
                sources = { 'messages/{locales}.json' },
            })
        end,
    },
}
