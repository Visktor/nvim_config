return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        bind_to_cwd = true,
        follow_current_file = { enabled = false },
        use_libuv_file_watcher = true,
        cwd_target = {
          sidebar = "global", -- sidebar is when position = left or right
          current = "global", -- current is when position = current
        },
      },
    },
    keys = {
      { "<leader><leader>", "<cmd>Neotree reveal<cr>", desc = "Reveal current file on Neotree" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", false },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      terminal = { enabled = false },
      scratch = { enabled = false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      ---@class snacks.scroll.Config
      ---
      scratch = { enabled = false },
      scroll = {
        enabled = false,
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "S", mode = { "n", "o", "t", "i", "s", "x" }, false },
      { "s", mode = { "n", "o" }, false },
    },
    opts = {
      modes = {
        treesitter_search = {
          enabled = false,
        },
        remote = {
          enabled = false,
        },
        treesitter = {
          enabled = false,
        },
        search = {
          enabled = false,
        },
      },
    },
  },
  {
    "monaqa/dial.nvim",
    lazy = false,
    keys = {
      { "+", "<C-a>", mode = { "n", "v" } },
      { "-", "<C-x>", mode = { "n", "v" } },
      { "g+", "g<C-a>", mode = { "n", "v" } },
      { "g-", "g<C-x>", mode = { "n", "v" } },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
}
