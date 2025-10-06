-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- sudo write
vim.api.nvim_create_user_command("Suw", function()
  local filepath = vim.fn.expand("%:p")
  if filepath == "" then
    vim.notify("E32: No file name", vim.log.levels.ERROR)
    return
  end
  -- Save buffer to a temporary file
  local tmpfile = vim.fn.tempname()
  vim.cmd("write! " .. tmpfile)
  -- Prompt for password
  vim.fn.inputsave()
  local password = vim.fn.inputsecret("Password: ")
  vim.fn.inputrestore()
  if password == "" then
    vim.notify("Invalid password, sudo aborted", vim.log.levels.WARN)
    return
  end
  -- Use sudo to move the file
  local cmd =
    string.format("sudo -p '' -S dd if=%s of=%s bs=1048576", vim.fn.shellescape(tmpfile), vim.fn.shellescape(filepath))
  local proc = vim.system({ "sh", "-c", string.format("echo %q | %s", password, cmd) }):wait()
  -- Handle result
  if proc.code == 0 then
    vim.bo.modified = false
    vim.cmd.checktime()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<ESC>", true, false, true), "n", true)
  else
    vim.notify(proc.stderr, vim.log.levels.ERROR)
  end

  vim.fn.delete(tmpfile)
end, { desc = "Sudo write current buffer" })
