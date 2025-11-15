local km = vim.keymap

-- Common shortcuts
km.set({ 'n', 'i', 'v', 'o' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save this buffer' })
km.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Exit Neovim' })
km.set('n', 'q', '<cmd>q<cr>', { desc = 'Close current buffer' })

-- Fuzzy Finder Lua
km.set('n', '<leader>ff', require('fzf-lua').files, { desc = 'Open files fzf' })
km.set('n', '<leader>fg', require('fzf-lua').live_grep, { desc = 'Grep files with fzf' })
km.set('n', '<leader>fc', require('fzf-lua').grep_curbuf, { desc = 'Grep in the current buffer' })
km.set('n', '<leader><leader>', require('fzf-lua').buffers, { desc = 'Open buffers fzf' })

-- NvimTree
km.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toogle NvimTree side bar' })
