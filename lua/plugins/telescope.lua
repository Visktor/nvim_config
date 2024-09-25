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

    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Telescope Undo Tree" },
      { "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Telescope Marks" },
      { "<leader>fj", "<cmd>Telescope jumplist<cr>", desc = "Telescope JumpList" },
    },

    config = function(_, opts)
      require("telescope").load_extension("undo")
      return opts
    end,
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
}
