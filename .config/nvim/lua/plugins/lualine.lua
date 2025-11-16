return {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                globalstatus = true,
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        colored = false, -- ← No colors, just plain symbols
                    },
                },
                lualine_c = { 'filename' },
            },
            extensions = { 'nvim-tree' },
        })
    end,
}
