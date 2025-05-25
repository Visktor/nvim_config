local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local save_fold = augroup("Persistent Folds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})

if vim.g.vscode then
    return {}
end

autocmd("RecordingEnter", {
  callback = function()
    require("lualine").refresh()
  end,
})

autocmd("RecordingLeave", {
  callback = function()
    -- This is going to seem really weird!
    -- Instead of just calling refresh we need to wait a moment because of the nature of
    -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
    -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
    -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
    -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
    local timer = vim.uv.new_timer()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        require("lualine").refresh()
      end)
    )
  end,
})

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

autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.vue" },
  callback = function()
    vim.cmd("silent EslintFixAll")
    -- Add your custom actions here
    -- For example, to run a command:
    -- vim.cmd("!echo 'Save completed at' $(date)")
  end,
})
