return {
  telescope = {
    { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },
    { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "JumpList" },
    { "<leader>fg", "", desc = "Telescope Git" },
    { "<leader>fgw", "<cmd>Telescope git_selector<cr>", desc = "Telescope Git Worktrees" },
    { "<leader>fgF", "<cmd>Telescope git_selector files<cr>", desc = "Telescope Git FILES" },
    { "<leader>fgg", "<cmd>Telescope git_selector grep<cr>", desc = "Telescope Git Grep" },
    { "<leader>fgl", "<cmd>Telescope git_selector grep<cr>", desc = "Telescope Git Live Grep" },
    { "<leader>fgf", "<cmd>Telescope git_files<cr>", desc = "Find Files (git-files)" },
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
    {
      "<leader>j",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find File",
    },
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
  },
  telescope_dir = {
    {
      "<leader>fd",
      "",
      desc = "Find in Directory",
    },
    {
      "<leader>fdw",
      "<cmd>GrepInDirectory<cr>",
      desc = "Words",
    },
    {
      "<leader>fdf",
      "<cmd>FileInDirectory<cr>",
      desc = "Files",
    },
  },
}
