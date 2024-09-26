return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = "<M-b>",
          accept_line = "<M-c>",
          accept_word = "<M-w>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<M-x>",
        },
      },
      filetypes = { markdown = false },
    },
    config = function(_, opts)
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("copilot").setup(opts)

      local function set_trigger(trigger)
        vim.b.copilot_suggestion_auto_trigger = trigger
        vim.b.copilot_suggestion_hidden = not trigger
      end

      cmp.event:on("menu_closed", function()
        set_trigger(not luasnip.expand_or_locally_jumpable())
      end)
      vim.api.nvim_create_autocmd("User", {
        pattern = { "LuasnipInsertNodeEnter", "LuasnipInsertNodeLeave" },
        callback = function()
          set_trigger(not luasnip.expand_or_locally_jumpable())
        end,
      })

      return opts
    end,
  },
}
