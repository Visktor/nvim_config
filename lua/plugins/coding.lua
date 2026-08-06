return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    keys = {
      { "<C-g>s", "<Plug>(nvim-surround-insert)", mode = "i" },
      { "<C-g>S", "<Plug>(nvim-surround-insert-line)", mode = "i" },
      { "S", "<Plug>(nvim-surround-normal)", mode = "n" },
      { "SS", "<Plug>(nvim-surround-normal-cur)", mode = "n" },
      { "SSG", "<Plug>(nvim-surround-normal-cur-line)", mode = "n" },
      { "S", "<Plug>(nvim-surround-visual)", mode = "x" },
      { "SG", "<Plug>(nvim-surround-visual-line)", mode = "x" },
      { "ds", "<Plug>(nvim-surround-delete)", mode = "n" },
      { "cs", "<Plug>(nvim-surround-change)", mode = "n" },
      { "cS", "<Plug>(nvim-surround-change-line)", mode = "n" },
    },
    init = function()
      vim.g.nvim_surround_no_mappings = true
    end,
    config = function()
      require("nvim-surround").setup({
        surrounds = {
          ["A"] = { add = { "<", "/>" } },
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
          ["B"] = {
            add = { "{", "}" },
          },
        },
      })
    end,
  },
  {
    "nvim-mini/mini.ai",
    event = "VeryLazy",
    opts = {
      n_lines = 2000,
      custom_textobjects = {
        t = false,
      },
      search_method = "cover_or_nearest",
    },
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {
      default_mappings = false,
      mappings = {
        set = "m.",
        toggle = "mm",
        set_next = "mn",
        next = "<M-m>",
        prev = false,
        preview = "m:",
        delete = "MM",
        delete_buf = "MB",
        delete_line = "ML",
      },
    },
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    opts = {
      subwordMovement = false,
    },
    keys = {
      { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
      { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = { useDefaults = true },
  },
  {
    "Goose97/timber.nvim",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("timber").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
