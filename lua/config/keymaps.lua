local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--> Movement
map({ "v", "o", "x" }, "L", "}")
map({ "v", "o", "x" }, "H", "{")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

--> Registers
map({ "x", "v" }, "<M-p>", [["_dP]])
map({ "n", "v" }, "<M-y>", [["+y]])
map("n", "<M-Y>", [["+Y]])
map({ "n", "v" }, "<M-d>", [["_d]])

--> Util
map({ "i", "n", "x", "o" }, "<C-c>", "<Esc>", { remap = true })

map("n", "dB", "dBx")

--> Insert
map("i", "<C-l>", "<DELETE>")

--> Hop
map({ "n" }, "s", "<cmd>HopWord<cr>", opts)

--> Surround
map({ "o", "v" }, "ir", "i[")
map({ "o", "v" }, "ir", "i[")
map({ "o", "v" }, "ar", "a[")
map({ "o", "v" }, "ia", "i<")
map({ "o", "v" }, "aa", "a<")
map({ "o", "v" }, "ia", "i<")
map({ "o", "v" }, "aa", "a<")
