local map = vim.keymap.set
local unmap = vim.keymap.del
local opts = { noremap = true, silent = true }

--> Terminal
map({ "n", "v", "i", "t" }, "<F4>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal Float" })

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
map({ "i", "n", "x", "o" }, "<C-c>", "<Esc>")
map({ "n" }, "<leader>n", "<cmd>nohlsearch<cr>", { desc = "Disable Highlighted Search" })
map({ "n" }, "<leader>ce", "<cmd>EslintFixAll<cr>", { desc = "Eslint Fix" })

--> Insert
map({ "i" }, "<C-l>", "<DEL>")
map({ "i" }, "<C-z>", "<C-o>u")

--> Windows
map("n", "<leader><left>", ":vertical resize +15<cr>")
map("n", "<leader><right>", ":vertical resize -15<cr>")
map("n", "<leader><up>", ":resize +10<cr>")
map("n", "<leader><down>", ":resize -10<cr>")

--> Telescope
map({ "n" }, "<leader>fD", "", { desc = "Find in Directory" })
map({ "n" }, "<leader>fDw", "<cmd>Telescope dir live_grep<cr>", { desc = "Find Word in Directory" })
map({ "n" }, "<leader>fDf", "<cmd>Telescope dir live_grep<cr>", { desc = "Find File in Directory" })

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

--> Obsidian
map("n", "<leader>o", "", { silent = true, desc = "Obsidian" })

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

--> Obsidian
map({ "n" }, "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "Obsidian Go to File" })
map({ "n" }, "<leader>or", "<cmd>RenderMarkdown toggle<CR>", { desc = "Obsidian Render Markdown" })
map({ "n" }, "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Obsidian Extract to Note" })
map({ "n" }, "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Obsidian Create Daily Note" })

--> TSC
map({ "n" }, "<leader>cT", "<cmd>TSC<CR>", { desc = "Run TSC on Project" })

--> Buffers
map("n", "H", "<Cmd>BufferPrevious<CR>", opts)
map("n", "L", "<Cmd>BufferNext<CR>", opts)
map("n", "<leader>b<", "<Cmd>BufferMovePrevious<CR>", opts)
map("n", "<leader>b>", "<Cmd>BufferMoveNext<CR>", opts)
map("n", "<leader>b1", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<leader>b2", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<leader>b3", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<leader>b4", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<leader>b5", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<leader>b6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<leader>b7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<leader>b8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<leader>b9", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<leader>bl", "<Cmd>BufferLast<CR>", opts)
map("n", "<leader>br", "<Cmd>BufferRestore<CR>", opts)
map("n", "<leader>bp", "<Cmd>BufferPin<CR>", opts)
map("n", "<leader>bgp", "<cmd>BufferGotoPinned<CR>", opts)
map("n", "<leader>bgP", "<cmd>BufferGotoUnpinned<CR>", opts)
map("n", "<leader>bd", "<Cmd>BufferClose<CR>", opts)
map("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close Other Buffers" })
map("n", "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Close All Unpinned" })
map("n", "<leader>bL", "<Cmd>BufferCloseBuffersLeft<CR>", { desc = "Close Buffers To The Left" })
map("n", "<leader>bR", "<Cmd>BufferCloseBuffersRight<CR>", { desc = "Close Buffers To The Right" })
map("n", "<leader>bM", "<Cmd>BufferPick<CR>", opts)
map("n", "<leader>bsn", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bsN", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<leader>bsd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bsl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bsw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

--> Sessions
map("n", "<leader>qs", function()
  require("resession").save()
end, { desc = "Save Session" })
map("n", "<leader>qa", function()
  require("resession").load()
end, { desc = "List Sessions" })
map("n", "<leader>ql", function()
  require("resession").load("last")
end, { desc = "Restore last" })
map("n", "<leader>qd", function()
  require("resession").delete()
end, { desc = "Delete Session" })
