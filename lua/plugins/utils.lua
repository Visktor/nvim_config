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
  {
    "tiagovla/scope.nvim",
    config = function()
      require("scope").setup({
        hooks = {
          pre_tab_leave = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" })
            -- [other statements]
          end,

          post_tab_enter = function()
            vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" })
            -- [other statements]
          end,

          -- [other hooks]
        },

        -- [other options]
      })
    end,
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      pre_save = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" })
      end,
    },
  -- stylua: ignore
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
    { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
    { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
  },
  },
}
--
