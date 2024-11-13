return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    config = function()
      require("tabout").setup({
        tabkey = "", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = false, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
    dependencies = { -- These are optional
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
      "hrsh7th/nvim-cmp",
    },
    opt = true, -- Set this to true if the plugin is optional
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },
  {
    "L3MON4D3/LuaSnip",
    keys = {
      {
        mode = { "i" },
        "<M-TAB>",
        function()
          require("luasnip").expand()
        end,
      },
      {
        "<TAB>",
        mode = { "i", "s" },
        function()
          local ls = require("luasnip")
          local tabout = require("tabout")
          if ls.jumpable(1) then
            ls.jump(1)
          else
            tabout.tabout()
          end
        end,
        { silent = true, description = "Expand snippet" },
      },
      {
        "<S-TAB>",
        mode = { "i", "s" },
        function()
          local ls = require("luasnip")
          local tabout = require("tabout")

          if ls.jumpable(-1) then
            ls.jump(-1)
          else
            tabout.backwards_tabout()
          end

          require("luasnip").jump(-1)
        end,
        { silent = true, description = "Jump snippet backwards" },
      },
    },
  },
}
