

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      {
        "princejoogie/dir-telescope.nvim",
        "debugloop/telescope-undo.nvim",
      },
    },
    opts = {
      defaults = {
        layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
        sorting_strategy = "ascending",
        winblend = 0,
        -- file_ignore_patterns = {
        --   ".*index.js.*",
        -- },
        path_display = {
          "filename_first",
        },
      },
    },
    keys = require("config.lazy_keys.telescope"),
    init = function()
      require("telescope").load_extension("undo")
      require("telescope").load_extension("dir")
      require("telescope").load_extension("git_selector")
    end,
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = { "nvim-telescope/telescope.nvim" },
    keys = require("config.lazy_keys.telescope_dir"),
    opts = {
      -- these are the default options set
      hidden = true,
      no_ignore = false,
      show_preview = true,
    },
  },
  {
    "davvid/telescope-git-selector.nvim",
    dependencies = { "davvid/telescope-git-grep.nvim" },
  },
  -- {
  --   "danielfalk/smart-open.nvim",
  --   branch = "0.2.x",
  --   init = function()
  --     require("telescope").load_extension("smart_open")
  --   end,
  --   opts = {
  --     cwd_only = true,
  --     filename_first = false,
  --   },
  --   keys = {
  --     { "<leader>fo", "<cmd>Telescope smart_open<cr>", desc = "Smart Open" },
  --   },
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --     { "nvim-telescope/telescope-fzy-native.nvim" },
  --   },
  -- },
}


--  => Cheat Sheet
--  Search whole word in fzf = Prefix word with "'" such as 'word
--
--  Search whole word in vim regex = Prefix word with "\<" such as \<word>\
