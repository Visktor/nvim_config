-- Until i figure out why the fuck the vim.opt.guicursor is not working.

vim.api.nvim_create_autocmd("BufRead", {

  callback = function()
    vim.cmd('set guicursor=""')
  end,
})

local resession = require("resession")

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    resession.save("last")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Only load the session if nvim was started with no args
    if vim.fn.argc(-1) == 0 then
      -- Save these to a different directory, so our manual sessions don't get polluted
      resession.load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
    end
  end,
  nested = true,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.bo.modifiable == true then
      resession.save(vim.fn.getcwd(), { dir = "dirsession", notify = false })
    end
  end,
})
