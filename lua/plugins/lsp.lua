return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.diagnostics = vim.tbl_deep_extend("force", opts.diagnostics, {
        virtual_text = false,
      })
      opts.inlay_hints = vim.tbl_deep_extend("force", opts.inlay_hints, { enabled = false })
      -- opts.servers = { eslint = {}, marksman = {} }
      opts.setup = vim.tbl_deep_extend("force", opts.setup, {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      })
      return opts
    end,
  },
}
