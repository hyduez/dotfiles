return {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
    opts = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        ---@type MasonLspconfigSettings
        return {
            ensure_installed = {}, -- Add "lua_ls" here if you want auto-install
            automatic_installation = false,
            handlers = {
                -- Default handler for other servers
                function(server_name)
                    require('lspconfig')[server_name].setup({ capabilities = capabilities })
                end,
            },
        }
    end,
}
