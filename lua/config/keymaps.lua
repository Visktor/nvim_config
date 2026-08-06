local map = vim.keymap.set
local opts = { noremap = true, silent = true }

--> Movement
map({ "v", "o", "x" }, "L", "}")
map({ "v", "o", "x" }, "H", "{")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "<C-/>", function()
  local count = vim.v.count1
  require("toggleterm").toggle(count, 0, vim.loop.cwd(), "float")
end, {
  desc = "ToggleTerm",
})

map("n", "<C-_>", function()
  local count = vim.v.count1
  require("toggleterm").toggle(count, 0, vim.loop.cwd(), "float")
end, {
  desc = "ToggleTerm",
})

map("n", [[<C-_>]], function()
  local count = vim.v.count1
  require("toggleterm").toggle(count, 0, vim.loop.cwd(), "float")
end, {
  desc = "ToggleTerm",
})

--> Registers
map({ "x", "v" }, "<M-v>", [["_dP]]) -- was <M-p>, freed: herdr last_pane
map({ "n", "v" }, "<M-y>", [["+y]])
map("n", "<M-i>", [["+Y]]) -- was <M-Y>, freed: skhd shift+alt+y (mirror y-axis)
map({ "n", "v" }, "<M-d>", [["_d]])

--> Util
map({ "i", "n", "x", "o" }, "<C-c>", "<Esc>", { remap = true })
map({ "n" }, "<leader>ce", "<cmd>EslintFixAll<cr>", { desc = "Eslint Fix" })
map("n", "<leader>gg", function()
  require("snacks").terminal("lazygit", {
    interactive = true,
    win = {
      keys = {
        term_normal = {
          "<C-c>",
          function()
            local keys = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
            vim.api.nvim_feedkeys(keys, "t", false)
          end,
          silent = true,
          expr = true,
          mode = "t",
        },
      },
      relative = "editor",
      -- width = 0,
      -- height = 0,
    },
  })
end, { desc = "Lazygit (cwd)" })
map("n", "dB", "dBx")

--> Insert
map({ "i" }, "<C-l>", "<DEL>")

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

--> Goto Preview
--Can't figure out why the which key description is not working
--Unmapping the key didn't work either
map("n", "gk", "", { desc = "Goto Preview", silent = true })
map("n", "gkd", function()
  require("goto-preview").goto_preview_definition({})
end, { desc = "Preview Definition" })
map("n", "gkt", function()
  require("goto-preview").goto_preview_type_definition({})
end, { desc = "Preview Type " })
map("n", "gki", function()
  require("goto-preview").goto_preview_implementation({})
end, { desc = "Preview Implementation" })
map("n", "gkD", function()
  require("goto-preview").goto_preview_declaration({})
end, { desc = "Preview Declaration" })
map("n", "gkp", function()
  require("goto-preview").close_all_win({})
end, { desc = "Close All Previews" })
map("n", "gkr", function()
  require("goto-preview").goto_preview_references({})
end, { desc = "Preview References" })

--> Obsidian
map("n", "<leader>o", "", { silent = true, desc = "Obsidian" })
map({ "n" }, "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Obsidian Create New Note" })
map({ "n" }, "<leader>of", "<cmd>ObsidianFollowLink<CR>", { desc = "Obsidian Go to File" })
map({ "n" }, "<leader>oe", "<cmd>ObsidianExtractNote<CR>", { desc = "Obsidian Extract to Note" })
map({ "n" }, "<leader>od", "<cmd>ObsidianToday<CR>", { desc = "Obsidian Create Daily Note" })
map({ "n" }, "<leader>oD", "<cmd>ObsidianDailies<CR>", { desc = "Obsidian Daily List" })
map({ "n" }, "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Obsidian Backlinks" })
map({ "n" }, "<leader>oT", "<cmd>ObsidianTemplate<CR>", { desc = "Obsidian New Template" })
map({ "n" }, "<leader>or", "<cmd>ObsidianRename<CR>", { desc = "Obsidian Rename" })
map({ "n" }, "<leader>ot", "<cmd>ObsidianNewFromTemplate<CR>", { desc = "Obsidian New Note from Template" })

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
map("n", "<leader>bco", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Close Other Buffers" })
map("n", "<leader>bcp", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Close All Unpinned" })
map("n", "<leader>bcl", "<Cmd>BufferCloseBuffersLeft<CR>", { desc = "Close Buffers To The Left" })
map("n", "<leader>bcr", "<Cmd>BufferCloseBuffersRight<CR>", { desc = "Close Buffers To The Right" })
map("n", "<leader>bcv", "<Cmd>BufferCloseAllButVisible<CR>", { desc = "Close All But Visible" })

map("n", "<leader>bM", "<Cmd>BufferPick<CR>", opts)
map("n", "<leader>bsn", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<leader>bsN", "<Cmd>BufferOrderByName<CR>", opts)
map("n", "<leader>bsd", "<Cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<leader>bsl", "<Cmd>BufferOrderByLanguage<CR>", opts)
map("n", "<leader>bsw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)

--> Diff
map("n", "<leader>gd", "", { desc = "DiffView" })
map("n", "<leader>gdd", "<cmd>DiffviewOpen<CR>", { desc = "DiffView Open" })
map("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", { desc = "DiffView Close" })
map("n", "<leader>gdf", "<cmd>DiffviewToggleFiles<CR>", { desc = "DiffView Toggle File Panel" })
map("n", "<leader>gde", "<cmd>DiffviewFocusFiles<CR>", { desc = "DiffView Focus File Panel" })
map("n", "<leader>gdr", "<cmd>DiffviewRefresh<CR>", { desc = "DiffView Refresh" })

--> Sessions
map("n", "<leader>qs", function()
  require("resession").save()
end, { desc = "Save Session" })

map("n", "<leader>qa", function()
  require("resession").load()
end, { desc = "List Sessions" })

map("n", "<leader>ql", function()
  require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
end, { desc = "Restore last" })

map("n", "<leader>qd", function()
  require("resession").delete()
end, { desc = "Delete Session" })

--> Search and Replace
map({ "n", "v" }, "<leader>r", "", { desc = "Search and Replace" })
map({ "n", "v" }, "<leader>re", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
    prefills = {
      filesFilter = ext and ext ~= "" and "*." .. ext or nil,
    },
  })
end, { desc = "Files of same extension" })
map({ "n", "v" }, "<leader>rr", function()
  local grug = require("grug-far")
  local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
  grug.open({
    transient = true,
  })
end, { desc = "Files of same extension" })
map({ "n", "v" }, "<leader>rf", function()
  require("grug-far").open({ transient = true, prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Current File" })
map({ "n", "v" }, "<leader>rw", function()
  require("grug-far").open({ transient = true, prefills = { search = vim.fn.expand("<cword>") } })
end, { desc = "Selected Word" })
map({ "n", "v" }, "<leader>rt", function()
  require("grug-far").open({
    transient = true,
    prefills = {
      filesFilter = "!*{test,spec,types,mocks,stories,styled,dto}*",
    },
  })
end, { desc = "Code Files" })

--> Files
map("n", "<leader>N", "", { desc = "New File" })
map("n", "<leader>Ns", "<cmd>Scratch<CR>", { desc = "Create new scratch file" })
map("n", "<leader>No", "<cmd>ScratchOpen<CR>", { desc = "Open scratch file" })
map("n", "<leader>Nf", "<cmd>ScratchFzf<CR>", { desc = "Open scratch search" })
map("n", "<leader>NN", "<cmd>ScratchWithName<CR>", { desc = "Open scratch named file" })

map("n", "<leader>v", "", { desc = "Visits Menu" })
map("n", "<leader>vs", function()
  require("mini.visits").select_path(vim.fn.getcwd())
end, { desc = "Select Visit by Path" })
map("n", "<leader>vS", function()
  require("mini.visits").select_label(vim.fn.getcwd())
end, { desc = "Select Visit by Label" })
map("n", "<leader>vl", function()
  require("mini.visits").add_label()
end, { desc = "Add Visit Label" })
map("n", "<leader>vL", function()
  require("mini.visits").remove_label()
end, { desc = "Remove Visit Label" })

map({ "n", "v" }, "<C-M-k>", "<cmd>Treewalker Up<cr>", { silent = true })
map({ "n", "v" }, "<C-M-j>", "<cmd>Treewalker Down<cr>", { silent = true })
map({ "n", "v" }, "<C-M-h>", "<cmd>Treewalker Left<cr>", { silent = true })
map({ "n", "v" }, "<C-M-l>", "<cmd>Treewalker Right<cr>", { silent = true })

--> Folding
-- Nzm (native keymap in plugins/ufo.lua) also does this via ufo's own API;
-- these are just named shortcuts for the levels used often. No native z+digit
-- command exists in vim/nvim, confirmed against runtime/doc before binding.
for level = 1, 4 do
  map("n", "z" .. level, function()
    require("ufo").closeFoldsWith(level)
  end, { desc = "Fold To Level " .. level })
end

map({ "n", "v" }, "∆", "<cmd>Treewalker SwapDown<cr>", { silent = true })
map({ "n", "v" }, "˚", "<cmd>Treewalker SwapUp<cr>", { silent = true })
map({ "n", "v" }, "˙", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
map({ "n", "v" }, "¬", "<cmd>Treewalker SwapRight<cr>", { silent = true })
