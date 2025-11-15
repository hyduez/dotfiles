return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('nvim-tree').setup({
            hijack_netrw = true,
            hijack_directories = {
                enable = false, -- ← Important: Let the autocmd handle directories
            },
            actions = {
                open_file = {
                    quit_on_open = false, -- Keep tree open when selecting files
                },
            },
            view = {
                side = 'left', -- Or "right" if preferred
                width = 30, -- Adjust as needed
            },
        })
    end,
}
