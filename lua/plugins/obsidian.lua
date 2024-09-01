return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  keys = {
    {
      "<leader>of",
      function()
        return require("obsidian").util.gf_passthrough()
      end,
      desc = "Obsidian Go to File",
    },
    -- toggle check-boxes
    -- ["<leader>ch"] = {
    --   action = function()
    --     return require("obsidian").util.toggle_checkbox()
    --   end,
    --   opts = { buffer = true },
    -- },
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "personal",
          path = "~/Documents/Obsidian Vault/",
        },
      },
      -- templates = {
      --   subdir = "templates",
      --   date_format = "%d-%m-%Y",
      --   time_format = "%H:%M:%S",
      -- },

      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
    })
  end,
}
