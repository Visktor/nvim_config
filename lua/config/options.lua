local opt = vim.opt

opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"

opt.foldlevel = 99
opt.foldnestmax = 1

opt.guicursor = ""
opt.relativenumber = true

opt.smartindent = true

opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

opt.textwidth = 80
opt.wrap = true

vim.g.lazyvim_prettier_needs_config = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

opt.formatoptions:append({ "r" })
