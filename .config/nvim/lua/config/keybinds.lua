local km = vim.keymap

-- Common shortcuts
km.set({ 'n', 'i', 'v', 'o' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save this buffer' })
km.set('n', '<leader>q', '<cmd>qa<cr>', { desc = 'Exit Neovim' })
km.set('n', '<leader>wq', '<cmd>q<cr>', { desc = 'Close current buffer' })

-- Lazy.nvim
km.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Open Lazy.nvim' })
