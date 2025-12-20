local grep_opts = {
    'rg',
    '--vimgrep',
    '--hidden',
    '--follow',
    '--glob',
    '"!**/.git/*"',
    '--column',
    '--line-number',
    '--no-heading',
    '--color=always',
    '--smart-case',
    '--max-columns=4096',
    '-e',
}

return {
    {
        'ibhagwan/fzf-lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            local fzf_defaults = require('fzf-lua').defaults
            local fzf_path = require('fzf-lua.path')

            local file_actions = fzf_defaults.actions.files

            file_actions['ctrl-d'] = {
                fn = function(selected, opts)
                    if #selected == 0 then
                        return
                    end

                    local confirm = vim.fn.confirm('Delete ' .. #selected .. ' item(s)?', '&Yes\n&No', 2)
                    if confirm ~= 1 then
                        return
                    end

                    for _, sel in ipairs(selected) do
                        local entry = fzf_path.entry_to_file(sel, opts)
                        local full_path = entry.path or entry.uri

                        if vim.fn.isdirectory(full_path) == 1 then
                            vim.fn.delete(full_path, 'rf')
                        else
                            vim.fn.delete(full_path)
                        end
                    end
                end,
                reload = true,
            }

            file_actions['ctrl-n'] = {
                fn = function(_, opts)
                    vim.ui.input({ prompt = 'New file name (relative path OK): ' }, function(name)
                        if not name then
                            return
                        end

                        local full_path = vim.fs.joinpath(opts.cwd or vim.loop.cwd(), name)
                        local dir = vim.fs.dirname(full_path)
                        if vim.fn.isdirectory(dir) == 0 then
                            vim.fn.mkdir(dir, 'p')
                        end

                        local file = io.open(full_path, 'w')
                        if file then
                            file:close()
                        end
                        vim.cmd('edit ' .. vim.fn.fnameescape(full_path))
                    end)
                end,
                reload = false,
            }

            file_actions['ctrl-r'] = {
                fn = function(selected, opts)
                    if #selected ~= 1 then
                        vim.notify('Rename supports only single selection', vim.log.levels.WARN)
                        return
                    end

                    local sel = selected[1]
                    local entry = fzf_path.entry_to_file(sel, opts)
                    local old_path = entry.path or entry.uri

                    vim.ui.input(
                        { prompt = 'New name (relative path OK): ', default = vim.fs.basename(old_path) },
                        function(new_name)
                            if not new_name then
                                return
                            end

                            local new_path = vim.fs.joinpath(vim.fs.dirname(old_path), new_name)
                            vim.fn.rename(old_path, new_path)
                        end
                    )
                end,
                reload = true,
            }

            require('fzf-lua').setup({
                file_ignore_patterns = {
                    'node_modules',
                    'dist',
                    '.git',
                    'build',
                    'target',
                    'package-lock.json',
                    'bun.lock',
                    'pnpm-lock.yaml',
                    'yarn.lock',
                },
                files = {
                    cwd_prompt = false,
                    git_icons = true,
                    hidden = true,
                    follow = true,
                },
                grep = {
                    cwd_prompt = false,
                    cmd = table.concat(grep_opts, ' '),
                    hidden = true,
                    follow = true,
                },
            })
        end,
    },
    {
        'nvim-mini/mini.pairs',
        event = 'InsertEnter',
        config = function()
            require('mini.pairs').setup({
                modes = { insert = true, command = false, terminal = false },
                skip_next = '[%w%s%"%\'%.]',
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'master',
        build = ':TSUpdate',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                modules = {},
                ignore_install = {},
                ensure_installed = {
                    'lua',
                    'vim',
                    'vimdoc',
                    'query',
                },

                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = false },
            })
        end,
    },
}
