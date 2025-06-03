return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  opts = {
    buttons = {
      {
        label = function(opts)
          return opts.repo_url and "View Repository" or nil
        end,
        url = function(opts)
          return opts.repo_url or nil
        end,
      },
    },
  },
}
