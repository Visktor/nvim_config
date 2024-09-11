local map = vim.keymap.set
local unmap = vim.keymap.del
local opts = { noremap = true, silent = true }

--> Terminal
map({ "n", "v", "i", "t" }, "<F4>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal Float" })
map({ "n", "v", "i", "t" }, "<F5>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Terminal Horizontal" })

--> Dial
map({ "n" }, "+", "<C-a>")
map({ "n" }, "-", "<C-x>")

--> Movement
map({ "n" }, "<C-d>", "<C-d>zz")
map({ "n" }, "<C-u>", "<C-u>zz")

--> Registers
map("x", "<M-p>", [["_dP]])
map({ "n", "v" }, "<M-y>", [["+y]])
map("n", "<M-Y>", [["+Y]])
map({ "n", "v" }, "<M-d>", [["_d]])

--> Util
map({ "i", "n" }, "<C-c>", "<Esc>")
map({ "n" }, "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Disable Highlighted Search" })

--> Insert
map({ "i" }, "<C-l>", "<DEL>")
map({ "i" }, "<C-z>", "<C-o>u")

--> Windows
map("n", "<leader><left>", ":vertical resize +20<cr>")
map("n", "<leader><right>", ":vertical resize -20<cr>")
map("n", "<leader><up>", ":resize +10<cr>")
map("n", "<leader><down>", ":resize -10<cr>")

--> Telescope
map({ "n" }, "<leader>fdw", "<cmd>Telescope dir live_grep<cr>", { desc = "Search Word in Directory" })
map({ "n" }, "<leader>fdf", "<cmd>Telescope dir live_grep<cr>", { desc = "Search File in Directory" })

--> Hop
map({ "n" }, "s", "<cmd>HopWord<cr>", opts)

--> Surround
map("o", "ir", "i[")
map("o", "ir", "i[")
map("o", "ar", "a[")
map("o", "ia", "i<")
map("o", "aa", "a<")

--> Obsidian
map("n", "<leader>o", "", { silent = true, desc = "Obsidian" })
map("n", "<leader>oy", [[:s/\[\s\]/[ ]/<cr>]], { silent = true, desc = "Check" })
map("n", "<leader>ou", [[:s/\[x\]/[ ]/<cr>]], { silent = true, desc = "Uncheck" })

--> Node Action
map({ "n", "v" }, "<leader>ck", function()
  require("ts-node-action").node_action()
end, { silent = true, desc = "Quick Refactor" })

--> Goto Preview
--Can't figure out why the which key description is not working
--Unmapping the key didn't work either
unmap({ "n", "v" }, "gP")
unmap({ "n", "v" }, "gp")
map("n", "gp", "", { desc = "Goto Preview", silent = true })
map("n", "gpd", function()
  require("goto-preview").goto_preview_definition({})
end, { desc = "Preview Definition" })
map("n", "gpt", function()
  require("goto-preview").goto_preview_type_definition({})
end, { desc = "Preview Type " })
map("n", "gpi", function()
  require("goto-preview").goto_preview_implementation({})
end, { desc = "Preview Implementation" })
map("n", "gpD", function()
  require("goto-preview").goto_preview_declaration({})
end, { desc = "Preview Declaration" })
map("n", "gpp", function()
  require("goto-preview").close_all_win({})
end, { desc = "Close All Previews" })
map("n", "gpr", function()
  require("goto-preview").goto_preview_references({})
end, { desc = "Preview References" })

--> Actions Preview
map({ "v", "n" }, "<leader>cp", require("actions-preview").code_actions, { desc = "Preview Code Actions" })

--> Obsidian
map({ "n" }, "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "Obsidian Go to File" })
