return {
    {
        'saghen/blink.cmp',
        event = 'InsertEnter',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',
        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            keymap = {
                preset = 'default',
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'accept', 'fallback' },
            },
            appearance = {
                nerd_font_variant = 'mono',
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        score_offset = 100,
                    },
                },
            },
            fuzzy = { implementation = 'prefer_rust_with_warning' },
        },
        opts_extend = { 'sources.default' },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    {
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
    },
    {
        'mason-org/mason.nvim',
        cmd = { 'Mason', 'MasonUpdate' },
        opts = {},
    },
    {
        'rachartier/tiny-inline-diagnostic.nvim',
        event = 'VeryLazy',
        priority = 1000,
        config = function()
            require('tiny-inline-diagnostic').setup()
            vim.diagnostic.config({ virtual_text = false })
        end,
    },
}
