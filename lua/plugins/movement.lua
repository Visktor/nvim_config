return {
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
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  {
    "gbprod/yanky.nvim",
  },
  { -- Multi Cursor
    -- https://github.com/chrisgrieser/.config/blob/106d4eb2f039f1b9506fd5cfeed7e7d09f832e87/nvim/lua/plugins/bulk-processing.lua#L3C12-L3C12
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      -- Multi-Cursor https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
      vim.g.VM_leader = "\\"
      vim.g.VM_theme = "purplegray"
      -- vim.g.VM_default_mappings = 0

      vim.g.VM_maps = {
        -- TODO: fix mappings <C-q> already been used to check project
        -- permanent mappings
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
        -- ["Start Regex Search"] = "<C-Do wn>",
        ["Add Cursor At Pos"] = "<C-\\>",

        -- ["Visual Regex"] = "\\A",
        ["Visual Add"] = "\\f",
        ["Visual Cursors"] = "<M-b>", -- select some text firstly , then <M-b>

        ["Add Cursor Up"] = "<S-Up>",
        ["Add Cursor Down"] = "<S-Down>",
        -- ["Start Regex Search"] = "<C-q>/",
        ["Visual All"] = "\\A", --  1. selected some text in visual mode 2. press <C-q>j to select all
        -- ["Select Cursor Down"] = "<M-C-Down>",
        -- ["Select Cursor Up"] = "<M-C-Up>",

        ["Mouse Cursor"] = "<C-LeftMouse>",
        ["Mouse Word"] = "<C-RightMouse>",
        ["Mouse Column"] = "<M-C-RightMouse>",

        -- buffer mappings
        ["Switch Mode"] = "v",
        ["Find Next"] = "\\]",
        ["Find Prev"] = "\\[",
        ["Goto Next"] = "}",
        ["Goto Prev"] = "{",
        ["Seek Next"] = "<C-f>",
        ["Seek Prev"] = "<C-b>",
        ["Skip Region"] = "q",
        ["Remove Region"] = "Q",
        ["Invert Direction"] = "o",
        ["Find Operator"] = "m",
        ["Surround"] = "S",
        ["Replace Pattern"] = "R",

        ["Tools Menu"] = "\\`",
        ["Show Registers"] = '\\"',
        ["Case Setting"] = "\\c",
        ["Toggle Whole  Word"] = "\\w",
        ["Transpose"] = "\\t",
        ["Align"] = "\\a",
        ["Duplicate"] = "\\d",
        ["Rewrite Last  Search"] = "\\r",
        ["Merge Regions"] = "\\m",
        ["Split Regions"] = "\\s",
        ["Remove Last Region"] = "\\q",
        ["Visual Subtract"] = "\\s",
        ["Case Conversion  Menu"] = "\\C",

        ["Run Normal"] = "\\z",
        ["Run Last  Normal"] = "\\Z",
        ["Run Visual"] = "\\v",
        ["Run Last  Visual"] = "\\V",
        ["Run Ex"] = "\\x",
        ["Run Last  Ex"] = "\\X",
        ["Run Macro"] = "\\@",
        ["Align Char"] = "\\<",
        ["Align Regex"] = "\\>",
        ["Numbers"] = "\\n",
        ["Numbers Append"] = "\\N",
        ["Zero Numbers"] = "\\0n",
        ["Zero Numbers Append"] = "\\0N",
        ["Shrink"] = "\\-",
        ["Enlarge"] = "\\+",

        ["Toggle Block"] = "\\<BS>",
        ["Toggle Single Region"] = "\\n",
        ["Toggle Multiline"] = "\\M",

        -- ["Duplicate"] = "<C-q>d",

        -- ["Tools Menu"] = "\\t",
        -- ["Case Conversion Menu"] = "C",
        -- ["Align"] = "\\a",
      }
    end,
  },
}
