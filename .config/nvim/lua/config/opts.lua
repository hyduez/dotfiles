local opts = vim.opt

opts.clipboard = ''
opts.termguicolors = true
opts.tabstop = 4
opts.softtabstop = 4
opts.shiftwidth = 4
opts.expandtab = true
opts.autoindent = true
opts.smartindent = true
opts.smarttab = true
opts.list = true
opts.listchars = 'eol:.,tab:>-,trail:~,extends:>,precedes:<'

opts.number = true
opts.relativenumber = false
opts.cursorline = true
opts.signcolumn = 'yes:1'
opts.scrolloff = 8
opts.showcmd = true

opts.clipboard = 'unnamed'

opts.hlsearch = true
opts.incsearch = true
opts.ignorecase = true
opts.smartcase = true

opts.fillchars = {
    eob = ' ',
    vert = '│',
    fold = '·',
}

opts.showmode = false
opts.laststatus = 3

local gb = vim.g

gb.mapleader = ' '
gb.maplocalleader = '\\'
gb.loaded_netrw = 1
gb.loaded_netrwPlugin = 1
