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
      },
    },
    keys = require("config.plugin_keymaps").telescope,
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
    keys = require("config.plugin_keymaps").telescope_dir,
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
}
