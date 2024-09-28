return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["A"] = {add = { "<", "/>" }},
          ["q"] = {
            add = { "'", "'" },
          },
          ["Q"] = {
            add = { '"', '"' },
          },
          ["w"] = {
            add = { "`", "`" },
          },
          ["c"] = {
            add = { "```", "```" },
          },
          ["s"] = {
            add = { "~", "~" },
          },
          ["h"] = {
            add = { "==", "==" },
          },
          ["l"] = {
            add = { "[[", "]]" },
          },
        },
        keymaps = {
          -- insert = "<C-g>s",
          -- insert_line = "<C-g>S",
          normal = "S",
          normal_cur = "SS",
          normal_cur_line = "SSG",
          visual = "S",
          visual_line = "SG",
          delete = "ds",
          change = "cs",
          change_line = "cS",
        },
      })
    end,
  },
  {
    "echasnovski/mini.ai",
    opts = {
      n_lines = 2000,
      custom_textobjects = {
        t = false,
      },
      search_method = "cover_or_nearest",
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
          enabled = true,
        },
      },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({})
    end,
    lazy = false,
  },
  {
    "jiaoshijie/undotree",
    config = true,
    keys = {
      { "<leader>cu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
    },
  },
  { "chentoast/marks.nvim", opts = {}, event = "BufRead" },
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    opts = {},
  },
}
