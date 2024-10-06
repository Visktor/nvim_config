local opt = vim.opt

-- UFO folding
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.foldlevelstart = 99
opt.foldenable = true
opt.foldlevel = 99
opt.foldnestmax = 1
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldmethod = "expr"
opt.foldcolumn = "auto:9"

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

vim.o.showtabline = 2
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

opt.formatoptions:append({ "r" })

vim.g.omni_sql_no_default_maps = 1
