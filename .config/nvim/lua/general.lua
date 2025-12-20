local opts = {
  backup = false,
  mouse = 'a',
  number = true,
  numberwidth = 4,
  showcmd = true,
  showmatch = true,
  tabstop = 2,
  encoding = 'utf-8',
  showmode = false,
  cursorline = true,
  wrap = false,
  cmdheight = 2,
  showtabline = 2,
  relativenumber = true,
	syntax = 'on',
	completeopt = {'menuone', 'noselect'}
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

