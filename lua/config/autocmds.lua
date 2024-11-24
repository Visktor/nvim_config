-- Until i figure out why the fuck the vim.opt.guicursor is not working.

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })

autocmd("BufWinLeave", {
  pattern = "*.*",
  callback = function()
    vim.cmd.mkview()
  end,
  group = save_fold,
})

autocmd("BufWinEnter", {
  pattern = "*.*",
  callback = function()
    vim.cmd.loadview({ mods = { emsg_silent = true } })
  end,
  group = save_fold,
})

autocmd("BufRead", {

  callback = function()
    vim.cmd('set guicursor=""')
  end,
})

local resession = require("resession")

autocmd("VimLeavePre", {
  callback = function()
    resession.save("last")
  end,
})

autocmd("VimEnter", {
  callback = function()
    -- Only load the session if nvim was started with no args
    if vim.fn.argc(-1) == 0 then
      -- Save these to a different directory, so our manual sessions don't get polluted
      resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
    end
  end,
  nested = true,
})

autocmd("VimLeavePre", {
  callback = function()
    if vim.bo.modifiable == true then
      resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
    end
  end,
})
