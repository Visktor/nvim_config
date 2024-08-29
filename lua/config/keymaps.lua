local remap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Terminal
remap({ "n", "v", "i", "t" }, "<F4>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal Float" })
remap(
  { "n", "v", "i", "t" },
  "<F5>",
  "<cmd>ToggleTerm direction=horizontal<cr>",
  { desc = "Toggle Terminal Horizontal" }
)

-- Increment/Decrement
remap({ "n" }, "+", "<C-a>")
remap({ "n" }, "-", "<C-x>")

-- Movement
remap({ "n" }, "<C-d>", "<C-d>zz")
remap({ "n" }, "<C-u>", "<C-u>zz")
remap({ "n" }, "n", "nzz")
remap({ "n" }, "N", "Nzz")
remap({ "n" }, "#", "#zz")
remap({ "n" }, "*", "*zz")

-- Registers
remap("x", "<M-p>", [["_dP]])
remap({ "n", "v" }, "<M-y>", [["+y]])
remap("n", "<M-Y>", [["+Y]])
remap({ "n", "v" }, "<M-d>", [["_d]])

-- Util
remap("i", "<C-c>", "<Esc>")

-- Telescope
remap({ "n" }, "<leader>fdw", "<cmd>Telescope dir live_grep<cr>", { desc = "Search Word in Directory" })
remap({ "n" }, "<leader>fdf", "<cmd>Telescope dir live_grep<cr>", { desc = "Search File in Directory" })
remap({ "n" }, "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Disable Highlighted Search" })
remap({ "n" }, "s", "<cmd>HopWord<cr>", opts)

-- Insert
remap({ "i" }, "<C-l>", "<DEL>")
remap({ "i" }, "<C-z>", "<C-o>u")
