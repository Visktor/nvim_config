local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- local cursors = require('vscode-multi-cursor')

-- map({ "n", "x", "i", "v" }, "<C-n>", function()
--     require("vscode-multi-cursor").addSelectionToNextFindMatch()
--   end)
-- map({ 'n', 'x' }, 'mc', cursors.create_cursor, { expr = true, desc = 'Create cursor' })
-- map({ 'n' }, 'mcc', cursors.cancel, { desc = 'Cancel/Clear all cursors' })

-- map({ 'n', 'x' }, 'ma', cursors.start_right, { desc = 'Start cursors on the right' })
-- map({ 'n', 'x' }, 'mA', cursors.start_right, { desc = 'Start cursors on the right' })
-- map({ 'n' }, '[mc', cursors.prev_cursor, { desc = 'Goto prev cursor' })
-- map({ 'n' }, ']mc', cursors.next_cursor, { desc = 'Goto next cursor' })
-- map({ 'n' }, 'mcs', cursors.flash_char, { desc = 'Create cursor using flash' })
-- map({ 'n' }, 'mcw', cursors.flash_word, { desc = 'Create selection using flash' })
-- map({ 'x' }, 'I', function()
--     local mode = api.nvim_get_mode().mode
--     M.start_left_edge { no_selection = mode == '\x16' }
-- end)
-- map({ 'x' }, 'A', function()
--     local mode = api.nvim_get_mode().mode
--     M.start_right { no_selection = mode == '\x16' }
-- end)
-- vim.keymap.set('n', '<C-n>', 'mciw*<Cmd>nohl<CR>', { remap = true })


--> Movement
map({ "v", "o", "x" }, "L", "}")
map({ "v", "o", "x" }, "H", "{")

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
