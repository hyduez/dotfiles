local opts = vim.opt

opts.clipboard = ""
opts.termguicolors = true
opts.tabstop = 2
opts.softtabstop = 2
opts.shiftwidth = 2
opts.expandtab = true
opts.autoindent = true
opts.smartindent = true
opts.smarttab = true
opts.list = true
opts.listchars = "eol:.,tab:>-,trail:~,extends:>,precedes:<"

opts.number = true
opts.relativenumber = false
opts.cursorline = true
opts.signcolumn = "yes:1"
opts.scrolloff = 8
opts.showcmd = true

opts.clipboard = "unnamed"

opts.hlsearch = true
opts.incsearch = true
opts.ignorecase = true
opts.smartcase =true

opts.showmode = false

opts.fillchars = {
  eob = " ",
  vert = "│",
  fold = "·",
}

local global = vim.g

global.mapleader = " "
global.maplocalleader = "\\"
global.loaded_netrw = 1
global.loaded_netrwPlugin = 1
