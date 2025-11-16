return {
    'nvim-mini/mini.pairs',
    event = 'InsertEnter',
    config = function()
        require('mini.pairs').setup({
            modes = { insert = true, command = false, terminal = false },
            skip_next = '[%w%s%"%\'%.]',
        })
    end,
}
