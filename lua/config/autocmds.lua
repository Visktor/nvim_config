-- Until i figure out why the fuck the vim.opt.guicursor is not working.
vim.api.nvim_create_autocmd("BufRead", {
  callback = function()
    vim.cmd('set guicursor=""')
  end,
})
