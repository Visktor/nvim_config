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
    "stevearc/resession.nvim",
    lazy = false,
    dependencies = {
      {
        "tiagovla/scope.nvim",
        lazy = false,
        config = true,
      },
    },
    opts = {
      -- override default filter
      buf_filter = function(bufnr)
        local buftype = vim.bo[bufnr].buftype
        if buftype == "help" then
          return true
        end
        if buftype ~= "" and buftype ~= "acwrite" then
          return false
        end
        if vim.api.nvim_buf_get_name(bufnr) == "" then
          return false
        end

        -- this is required, since the default filter skips nobuflisted buffers
        return true
      end,
      extensions = { scope = {} }, -- add scope.nvim extension
    },
  },
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify",
    opts = {
      mapping = {
        startStopRecording = "q",
        playMacro = "Q",
        switchSlot = "<C-Q>",
        editMacro = "cq",
        deleteAllMacros = "dq",
        yankMacro = "yq",
        -- ⚠️ this should be a string you don't use in insert mode during a macro
        addBreakPoint = "<leader>|",
      },
    },
  },
}
--
