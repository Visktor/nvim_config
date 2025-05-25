return {
  -- Search for any word
  { "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
  { "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },

  -- List all open buffers
  {
    "<leader>fb",
    "<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=false<cr>",
    desc = "Buffers",
  },

  -- Search for word under cursor
  { "<leader>sw", LazyVim.pick("grep_string", { root = false, word_match = "-w" }), desc = "Word (cwd)" },
  { "<leader>sW", LazyVim.pick("grep_string", { word_match = "-w" }), desc = "Word (Root Dir)" },
  { "<leader>sw", LazyVim.pick("grep_string", { root = false }), mode = "v", desc = "Selection (cwd)" },
  { "<leader>sW", LazyVim.pick("grep_string"), mode = "v", desc = "Selection (Root Dir)" },

  -- Undo Tree
  { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },

  -- Jump List
  { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "JumpList" },

  -- Git
  { "<leader>fg", "", desc = "Telescope Git" },
  { "<leader>fgw", "<cmd>Telescope git_selector<cr>", desc = "Telescope Git Worktrees" },
  { "<leader>fgF", "<cmd>Telescope git_selector files<cr>", desc = "Telescope Git FILES" },
  { "<leader>fgg", "<cmd>Telescope git_selector grep<cr>", desc = "Telescope Git Grep" },
  { "<leader>fgl", "<cmd>Telescope git_selector grep<cr>", desc = "Telescope Git Live Grep" },

  -- Recent Files
  { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
  { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
  { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
  {
    "<leader>sf",
    function()
      require("telescope.builtin").grep_string({
        shorten_path = true,
        word_match = "-w",
        only_sort_text = true,
        search = "",
      })
    end,
    desc = "Fuzzy",
  },
  { "<leader><leader>", false },
  { "<leader>j", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  { "<leader>fF", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
  { "<leader>ff", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
  {
    "<leader>sQ",
    function()
      require("telescope.builtin").quickfixhistory()
    end,
    desc = "Quickfix History",
  },
  {
    "<leader>gC",
    function()
      require("telescope.builtin").git_commits()
    end,
    desc = "Commit History",
  },
  {
    "<leader>gc",
    function()
      require("telescope.builtin").git_bcommits()
    end,
    desc = "Buffer Commit History",
  },
  {
    "<leader>fp",
    function()
      require("telescope.builtin").pickers()
    end,
    desc = "Pickers",
  },
  {
    "<leader>sr",
    function()
      require("telescope.builtin").resume()
    end,
    desc = "Resume Last Search",
  },
}
