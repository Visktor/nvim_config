return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
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
        vscode = true,
    keys = {
      { "+", "<C-a>", mode = { "n", "v" } },
      { "-", "<C-x>", mode = { "n", "v" } },
      { "g+", "g<C-a>", mode = { "n", "v" } },
      { "g-", "g<C-x>", mode = { "n", "v" } },
    },
  },
}
