local function map(kind, lhs, rhs, opts)
  vim.api.nvim_set_keymap(kind, lhs, rhs, opts)
end

local silentnoremap = { noremap = true, silent = true }

local global = vim.g

global.mapleader = ','

map('', '<leader>w', ':w<CR>', silentnoremap)
map('', '<leader>q', ':q<CR>', silentnoremap)
map('', '<leader>r', '<C-r>', silentnoremap)

map('', '<leader>s', ':NvimTreeToggle<CR>', silentnoremap)

global.tmux_navigator_no_mappings = true

map('', '<leader>k', ':TmuxNavigateLeft<CR>', silentnoremap)
map('', '<leader>l', ':TmuxNavigateRight<CR>', silentnoremap)
map('', '<leader>i', ':TmuxNavigateUp<CR>', silentnoremap)
map('', '<leader>o', ':TmuxNavigateDown<CR>', silentnoremap)

-- map('', '<S-F1>', ':Lspsaga diagnostic_jump_next<CR>', silentnoremap)
-- map('', 'gh', ':Lspsaga lsp_finder<CR>', silentnoremap)
-- map('', 'gp', ':Lspsaga preview_definition<CR>', silentnoremap)

