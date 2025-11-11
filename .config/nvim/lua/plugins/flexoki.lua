return {
  dir = "~/Workspaces/flexoki-neovim-fork",
  name = "flexoki",
  lazy = false,
  priority = 1000,
  config = function()
    require("flexoki").setup({
      transparent = true,
    })
    vim.cmd("colorscheme flexoki-dark")
  end,
}
