local map = vim.keymap.set
local opts = { noremap = true, silent = true }

if vim.g.vscode then
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

  -- vim script 中的 cursorMove 不支持 select 参数
  -- 所以这里通过lua脚本，同样调用 cursorMove，但是可以传递 select 参数
  -- !但仍然存在问题：
  -- 1. cursorMove 会破坏 visual line 模式，所以 visual line 模式只会保留一次，然后就会变成 visual 模式
  -- 2. 文档中存在有中文时，移动过程中，col 会出现偏移，导致选区不准确
  -- local vim_api = vim.api
  -- 行内移动
  local function moveInLine(d)
    require("vscode-neovim").action("cursorMove", {
      args = {
        {
          to = d == "end" and "wrappedLineEnd" or "wrappedLineStart",
          by = "wrappedLine",
          -- by = 'line',
          -- value = vim.v.count1,
          -- value = vim.v.count,
          value = 0,
          select = true,
        },
      },
    })
    return "<Ignore>"
  end

  -- 行间移动
  local function moveLine(d)
    -- local current_mode = vim.api.nvim_get_mode().mode
    require("vscode-neovim").action("cursorMove", {
      args = {
        {
          to = d == "j" and "down" or "up",
          by = "wrappedLine",
          -- by = 'line',
          value = vim.v.count1,
          -- value = vim.v.count,
          select = true,
        },
      },
      -- not work
      -- callback = function()
      --     -- cb()
      --     if current_mode == 'V' then
      --         vim.schedule(function()
      --             vim_api.nvim_input('V')
      --         end)
      --         -- vim_api.nvim_input('V')
      --         -- vim_api.nvim_feedkeys('V', 'x', false)
      --         -- vim_api.nvim_feedkeys('V', 'v', true)
      --         -- debug.debug()
      --         -- return 'V'
      --     end
      --     -- return '<Ignore>'
      -- end
    })
    return "<Ignore>"
  end

  local function move(d)
    return function()
      -- 获取当前编辑模式
      local current_mode = vim.api.nvim_get_mode().mode
      -- Only works in charwise visual and visual line mode
      -- if current_mode ~= 'v' and current_mode ~= 'V' then
      --     return 'g' .. d
      -- end

      -- 因为 moveCursor 会破坏 visual line 模式，所以 visual line 模式只会保留一次，然后就会变成 visual 模式
      -- 因此这段逻辑在一次选区的动作中只会执行一次
      if current_mode == "V" then
        moveLine(d)
        if d == "j" then
          moveInLine("end")
        else
          moveInLine("start")
        end
      else
        -- 获取当前选区的标记的位置（<）
        local start_pos = vim.api.nvim_buf_get_mark(0, "<")
        local end_pos = vim.api.nvim_buf_get_mark(0, ">")
        -- 提取列号 和 行号
        local start_line = start_pos[1]
        local start_col = start_pos[2]
        local end_line = end_pos[1]
        local end_col = end_pos[2]

        -- 获取光标当前列号
        local cursor_col = vim.fn.col(".")
        -- 获取当前行最大列号
        local line_end_col = vim.fn.col("$")
        -- 获取选区的结束行文本内容
        local selected_end_line_text = vim.fn.getline(end_line)
        -- 获取当前光标位置的行号和列号
        -- 参数 0 表示当前窗口
        local cursor = vim.api.nvim_win_get_cursor(0)
        -- 提取行号
        local current_line = cursor[1]

        -- 如果选区只有一行，而且整行内容都已被选中
        -- 那么在执行完行间移动后，就将新行的光标移动到行首或行尾
        -- 实现模拟 visual line 的效果
        -- 最后直接返回，不再执行下面的逻辑
        if start_col == 0 and end_col + 1 == #selected_end_line_text and start_line == end_line then
          moveLine(d)
          if d == "j" then
            moveInLine("end")
          else
            moveInLine("start")
          end
          return "<Ignore>"
        end

        -- 其他情况
        moveLine(d)

        -- k方向，向上移动
        -- 如果选区的结束行行内容被全选中，那么在执行完行间移动后，就将新行的光标移动到行尾
        -- 实现模拟 visual line 的效果
        if end_col + 1 == #selected_end_line_text and current_line < end_line then
          moveInLine("start")
          -- return 'V'
        end
        -- j方向，向下移动
        -- 如果选区的开始行行内容被全选中，那么在执行完行间移动后，就将新行的光标移动到行首
        -- 实现模拟 visual line 的效果
        if start_col == 0 and current_line > start_line then
          moveInLine("end")
          -- return 'V'
        end
      end
      return "<Ignore>"
    end
  end

  map("v", "gj", move("j"), {
    expr = true,
    noremap = true,
    silent = true,
  })
  map("v", "gk", move("k"), {
    expr = true,
    noremap = true,
    silent = true,
  })

  local function moveCursor(d)
    return function()
      -- 当 v.count 为 0 时，表示没有使用数字修饰符，此时可以执行自定义的移动
      -- 否则，执行原生的移动，如 10j
      if vim.v.count == 0 and vim.fn.reg_recording() == "" and vim.fn.reg_executing() == "" then
        return "g" .. d
      else
        return d
      end
    end
  end

  -- 依赖于 gj 和 gk 的定义，所以要放在 gj 和 gk 的后面
  map("n", "k", moveCursor("k"), {
    expr = true,
    remap = true,
    silent = true,
  })
  map("n", "j", moveCursor("j"), {
    expr = true,
    remap = true,
    silent = true,
  })

  return {}
end

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
map({ "x", "v" }, "<M-p>", [["_dP]])
map({ "n", "v" }, "<M-y>", [["+y]])
map("n", "<M-Y>", [["+Y]])
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

map({ "n", "v" }, "∆", "<cmd>Treewalker SwapDown<cr>", { silent = true })
map({ "n", "v" }, "˚", "<cmd>Treewalker SwapUp<cr>", { silent = true })
map({ "n", "v" }, "˙", "<cmd>Treewalker SwapLeft<cr>", { silent = true })
map({ "n", "v" }, "¬", "<cmd>Treewalker SwapRight<cr>", { silent = true })

--> Chat and Copilot
map({ "n", "v" }, "<leader>ac", "", { desc = "Copilot - AI - " })
map({ "n", "v" }, "<leader>aca", function()
  return require("CopilotChat").toggle()
end, { desc = " Toggle" })
map({ "n", "v" }, "<leader>acc", function()
  return require("CopilotChat").reset()
end, { desc = " Clear" })
map({ "n", "v" }, "<leader>acp", "<cmd>CopilotChatCommit<CR>", { desc = " Create Commit Message" })
map({ "n", "v" }, "<leader>acc", "<cmd>CopilotChatDocs<CR>", { desc = " Create Documentation" })
map({ "n", "v" }, "<leader>ace", "<cmd>CopilotChatExplain<CR>", { desc = " Explain Code" })
map({ "n", "v" }, "<leader>acr", "<cmd>CopilotChatReview<CR>", { desc = " Review Code" })
map({ "n", "v" }, "<leader>act", "<cmd>CopilotChatTests<CR>", { desc = " Create Tests" })
map({ "n", "v" }, "<leader>acq", function()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input)
  end
end, { desc = " Quick Chat" })
