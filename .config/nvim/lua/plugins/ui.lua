return {
    {
        'rcarriga/nvim-notify',
        lazy = false,
        opts = {
            timeout = 5000,
            render = 'wrapped-compact',
            stages = 'fade_in_slide_out',
            icons = {
                ERROR = ' ',
                WARN = ' ',
                INFO = ' ',
                DEBUG = ' ',
                TRACE = '✎ ',
            },
            background_colour = '#000000',
        },
        init = function()
            vim.notify = require('notify')
        end,
    },

    {
        'folke/noice.nvim',
        event = 'VeryLazy',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        opts = {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
                progress = { enabled = true },
            },
            presets = {
                bottom_search = false,
                command_palette = true,
                lsp_doc_border = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    filter = {
                        event = 'notify',
                        find = 'No information available',
                    },
                    opts = { skip = true },
                },
                {
                    filter = {
                        event = 'msg_show',
                        kind = { '', 'search_count', 'write' },
                    },
                    opts = { skip = true },
                },
            },
            commands = {
                all = {
                    view = 'split',
                    opts = { enter = true, format = 'details' },
                    filter = {},
                },
            },
        },
        config = function(_, opts)
            require('noice').setup(opts)

            local focused = true
            vim.api.nvim_create_autocmd({ 'FocusGained', 'FocusLost' }, {
                callback = function(ev)
                    focused = (ev.event == 'FocusGained')
                end,
            })

            vim.api.nvim_create_autocmd('User', {
                pattern = 'NoiceNotify',
                callback = function()
                    if not focused and vim.fn.executable('notify-send') == 1 then
                        vim.fn.system({
                            'notify-send',
                            '-u',
                            'low',
                            'Neovim',
                            vim.fn.expand('%:t'),
                        })
                    end
                end,
            })
        end,
    },
    {
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
                            colored = false,
                        },
                    },
                    lualine_c = { 'filename' },
                },
                extensions = { 'nvim-tree' },
            })
        end,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'helix',
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            local logo = [[
 ██▒   █▓ ▒█████   ██▓▓█████▄     ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓
▓██░   █▒▒██▒  ██▒▓██▒▒██▀ ██▌    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒
 ▓██  █▒░▒██░  ██▒▒██▒░██   █▌   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░
  ▒██ █░░▒██   ██░░██░░▓█▄   ▌   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ 
   ▒▀█░  ░ ████▓▒░░██░░▒████▓    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒
   ░ ▐░  ░ ▒░▒░▒░ ░▓   ▒▒▓  ▒    ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░
   ░ ░░    ░ ▒ ▒░  ▒ ░ ░ ▒  ▒    ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░
     ░░  ░ ░ ░ ▒   ▒ ░ ░ ░  ░       ░   ░ ░     ░░   ▒ ░░      ░   
      ░      ░ ░   ░     ░                ░      ░   ░         ░   
     ░                 ░                        ░                   ]]

            logo = string.rep('\n', 8) .. logo .. '\n\n'

            local opts = {
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, '\n'),
                    shortcut = {
                        { desc = '[ GitHub]', group = '@property', action = 'Lazy update' },
                        { desc = '[ paulov]', group = '@property', action = 'Lazy update' },
                        { desc = '[󰊳 Update]', group = '@property', action = 'Lazy update' },
                    },
                    project = {
                        enable = true,
                        limit = 8,
                        label = ' Most Recent Projects:',
                        action = function(path)
                            require('fzf-lua').files({ cwd = path })
                        end,
                    },
                },
            }

            if vim.o.filetype == 'lazy' then
                vim.api.nvim_create_autocmd('WinClosed', {
                    pattern = tostring(vim.api.nvim_get_current_win()),
                    once = true,
                    callback = function()
                        vim.schedule(function()
                            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
                        end)
                    end,
                })
            end

            require('dashboard').setup(opts)
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    },
    {
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
                            colored = false,
                        },
                    },
                    lualine_c = { 'filename' },
                },
                extensions = { 'nvim-tree' },
            })
        end,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            preset = 'helix',
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            local logo = [[
 ██▒   █▓ ▒█████   ██▓▓█████▄     ███▄    █ ██▒   █▓ ██▓ ███▄ ▄███▓
▓██░   █▒▒██▒  ██▒▓██▒▒██▀ ██▌    ██ ▀█   █▓██░   █▒▓██▒▓██▒▀█▀ ██▒
 ▓██  █▒░▒██░  ██▒▒██▒░██   █▌   ▓██  ▀█ ██▒▓██  █▒░▒██▒▓██    ▓██░
  ▒██ █░░▒██   ██░░██░░▓█▄   ▌   ▓██▒  ▐▌██▒ ▒██ █░░░██░▒██    ▒██ 
   ▒▀█░  ░ ████▓▒░░██░░▒████▓    ▒██░   ▓██░  ▒▀█░  ░██░▒██▒   ░██▒
   ░ ▐░  ░ ▒░▒░▒░ ░▓   ▒▒▓  ▒    ░ ▒░   ▒ ▒   ░ ▐░  ░▓  ░ ▒░   ░  ░
   ░ ░░    ░ ▒ ▒░  ▒ ░ ░ ▒  ▒    ░ ░░   ░ ▒░  ░ ░░   ▒ ░░  ░      ░
     ░░  ░ ░ ░ ▒   ▒ ░ ░ ░  ░       ░   ░ ░     ░░   ▒ ░░      ░   
      ░      ░ ░   ░     ░                ░      ░   ░         ░   
     ░                 ░                        ░                   ]]

            logo = string.rep('\n', 8) .. logo .. '\n\n'

            local opts = {
                hide = {
                    statusline = false,
                },
                config = {
                    header = vim.split(logo, '\n'),
                    shortcut = {
                        { desc = '[ GitHub]', group = '@property', action = 'Lazy update' },
                        { desc = '[ paulov]', group = '@property', action = 'Lazy update' },
                        { desc = '[󰊳 Update]', group = '@property', action = 'Lazy update' },
                    },
                    project = {
                        enable = true,
                        limit = 8,
                        label = ' Most Recent Projects:',
                        action = function(path)
                            require('fzf-lua').files({ cwd = path })
                        end,
                    },
                },
            }

            if vim.o.filetype == 'lazy' then
                vim.api.nvim_create_autocmd('WinClosed', {
                    pattern = tostring(vim.api.nvim_get_current_win()),
                    once = true,
                    callback = function()
                        vim.schedule(function()
                            vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
                        end)
                    end,
                })
            end

            require('dashboard').setup(opts)
        end,
        dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    },
}
