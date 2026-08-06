local opt = vim.opt

-- Folding: nvim-ufo (plugins/ufo.lua) takes over per-buffer via foldmethod=manual;
-- this is just the fallback for buffers ufo detaches from (filetype_exclude).
opt.foldenable = true
opt.foldlevel = 99 -- ufo needs a large value, manual foldmethod won't auto-close otherwise
opt.foldlevelstart = 99
opt.foldcolumn = "auto:9" -- statuscol.nvim renders the real gutter once ufo attaches
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- vim.o.spelllang = "en,pt"
vim.o.background = "dark"

opt.guicursor = ""
opt.relativenumber = true

opt.smartindent = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.textwidth = 80
opt.wrap = true

vim.g.autoformat = false

vim.g.lazyvim_prettier_needs_config = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.o.termguicolors = true

vim.opt.sessionoptions = { -- required
  "buffers",
  "sesdir",
  "tabpages",
  "globals",
  "winsize",
  "folds",
  "terminal",
}

vim.g.omni_sql_no_default_maps = 1
