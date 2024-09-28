return {
  {
    "lambdalisue/suda.vim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>W"] = { "<Cmd>SudaWrite<CR>", desc = "Suda Write" },
            },
          },
        },
      },
    },
    cmd = { "SudaRead", "SudaWrite" },
  },
  -- {
  --     "sindrets/diffview.nvim"
  -- }
  {
    "tzachar/highlight-undo.nvim",
    opts = {
      ...,
    },
  },
  { "kevinhwang91/nvim-bqf" },
  {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("wildfire").setup({
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<leader><CR>",
        },
      })
    end,
  },
}
--
