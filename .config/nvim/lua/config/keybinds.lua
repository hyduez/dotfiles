local km = vim.keymap

-- Common shortcuts
km.set({ 'n', 'i', 'v', 'o' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save this buffer' })
km.set('n', '<leader>q', '<cmd>qa<cr>', { desc = 'Exit Neovim' })
km.set('n', '<leader>wq', '<cmd>q<cr>', { desc = 'Close current buffer' })

-- Lazy.nvim
km.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy.nvim' })

-- Fuzzy Finder Lua
km.set('n', '<leader>ff', function()
    require('fzf-lua').files()
end, { desc = 'Open files fzf' })

km.set('n', '<leader>fg', function()
    require('fzf-lua').live_grep()
end, { desc = 'Grep files with fzf' })

km.set('n', '<leader>fc', function()
    require('fzf-lua').grep_curbuf()
end, { desc = 'Grep in the current buffer' })

km.set('n', '<leader><leader>', function()
    require('fzf-lua').buffers()
end, { desc = 'Browse buffer (fzf-lua)' })

km.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle NvimTree side bar' })
