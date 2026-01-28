return {
    {
        'olimorris/codecompanion.nvim',
        opts = {
            adapters = {
                http = {
                    ['litellm'] = function()
                        return require('codecompanion.adapters').extend('openai_compatible', {
                            env = {
                                url = 'http://litellm.me',
                                api_key = vim.env.OPENAI_TOKEN,
                                chat_url = '/v1/chat/completions',
                            },
                        })
                    end,
                },
            },
            interactions = {
                chat = {
                    adapter = 'litellm',
                    model = 'qwen2.5-coder:1.5b',
                },
                inline = {
                    adapter = 'litellm',
                    model = 'qwen2.5-coder:1.5b',
                },
            },
        },
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-treesitter/nvim-treesitter',
        },
    },
}
