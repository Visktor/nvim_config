return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics, {
        virtual_text = false,
      })
      opts.inlay_hints = vim.tbl_deep_extend("force", opts.inlay_hints, { enabled = false })

      -- Override LazyVim's default K->hover (buffer-local, set on LspAttach) so
      -- it peeks the fold under cursor first. A plain global keymap.set("n","K",...)
      -- in keymaps.lua would get shadowed by this buffer-local one on every attach.
      opts.servers = opts.servers or {}
      opts.servers["*"] = opts.servers["*"] or {}
      opts.servers["*"].keys = opts.servers["*"].keys or {}
      table.insert(opts.servers["*"].keys, {
        "K",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Hover / Peek Fold",
      })
      -- opts.servers = { eslint = {} }
      -- opts.setup = {
      --   eslint = function()
      --     require("lazyvim.util").lsp.on_attach(function(client)
      --       if client.name == "eslint" then
      --         client.server_capabilities.documentFormattingProvider = true
      --         elseif client.name == "vtsls" then
      --           client.server_capabilities.documentFormattingProvider = false
      --       end
      --     end)
      --   end,
      -- }
      return opts
    end,

    init = function() end,
  },
  {
    "bassamsdata/namu.nvim",
    config = function()
      require("namu").setup({
        -- Enable the modules you want
        namu_symbols = {
          enable = true,
          options = {}, -- here you can configure namu
        },
        -- Optional: Enable other modules if needed
        ui_select = { enable = false }, -- vim.ui.select() wrapper
        colorscheme = {
          enable = false,
          options = {
            -- NOTE: if you activate persist, then please remove any vim.cmd("colorscheme ...") in your config, no needed anymore
            persist = true, -- very efficient mechanism to Remember selected colorscheme
            write_shada = true, -- If you open multiple nvim instances, then probably you need to enable this
          },
        },
      })
      -- === Suggested Keymaps: ===
      vim.keymap.set("n", "<leader>ss", ":Namu symbols<cr>", {
        desc = "Jump to LSP symbol",
        silent = true,
      })
      vim.keymap.set("n", "<leader>th", ":Namu colorscheme<cr>", {
        desc = "Colorscheme Picker",
        silent = true,
      })
    end,
  },
}
