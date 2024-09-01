return {
  {
    "mg979/vim-visual-multi",
    event = "bufRead",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["q"] = {
            add = { "'", "'" },
          },
          ["Q"] = {
            add = { '"', '"' },
          },
          ["w"] = {
            add = { "`", "`" },
          },
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
    vscode = true,
    keys = {
      { "S", mode = { "x", "o" }, false },
      { "s", mode = { "n" }, false },
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
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify",
    opts = {},
  },
  { "chentoast/marks.nvim", opts = {}, event = "BufRead" },
  {
    "ckolkey/ts-node-action",
    dependencies = { "nvim-treesitter" },
    opts = {},
  },
}
