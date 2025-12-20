return {
    {
        'rcarriga/nvim-notify',
        lazy = false,
        opts = {
            timeout = 3500,
            render = 'wrapped-compact',
            stages = 'static',
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
        'nvim-lualine/lualine.nvim',
        event = 'VeryLazy',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'f-person/git-blame.nvim' },
        config = function()
            local colors = {
                blue = '#80a0ff',
                cyan = '#79dac8',
                black = '#080808',
                white = '#c6c6c6',
                red = '#ff5189',
                violet = '#d183e8',
                grey = '#303030',
            }

            local bubbles_theme = {
                normal = {
                    a = { fg = colors.black, bg = colors.violet },
                    b = { fg = colors.white, bg = colors.grey },
                    c = { fg = colors.white },
                },

                insert = { a = { fg = colors.black, bg = colors.blue } },
                visual = { a = { fg = colors.black, bg = colors.cyan } },
                replace = { a = { fg = colors.black, bg = colors.red } },

                inactive = {
                    a = { fg = colors.white, bg = colors.black },
                    b = { fg = colors.white, bg = colors.black },
                    c = { fg = colors.white },
                },
            }

            local git_blame = require('gitblame')

            require('lualine').setup({
                options = {
                    theme = bubbles_theme,
                    component_separators = '',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = {
                        {
                            git_blame.get_current_blame_text,
                            cond = git_blame.is_blame_text_available,
                        },
                    },
                    lualine_x = {},
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = {
                        { 'location', separator = { right = '' }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },
                tabline = {},
                extensions = {},
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
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████]]

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
                        limit = 10,
                        label = ' Most Recent Projects:',
                        action = function(path)
                            require('fzf-lua').files({ cwd = path })
                        end,
                    },
                    mru = {
                        enable = false,
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
