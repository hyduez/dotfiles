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
                ['<CR>'] = { 'fallback' },
                ['<Tab>'] = { 'accept' },
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
        'mason-org/mason.nvim',
        cmd = { 'Mason', 'MasonUpdate' },
        opts = {},
    },
    {
        'mason-org/mason-lspconfig.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = { 'mason-org/mason.nvim', 'neovim/nvim-lspconfig' },
        opts = {
            ensure_installed = {},
            automatic_installation = false,
        },
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
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                go = { 'gofmt' },
                javascript = { 'biome' },
                json = { 'biome' },
                lua = { 'stylua' },
            },
            format_on_save = function(bufnr)
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        },
    },
    {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
    },
}
