return {
  {
    "mfussenegger/nvim-dap",
    opts = {},
    init = function()
      for _, language in ipairs({ "typescript", "javascript" }) do
        require("dap").configurations[language] = {
          {
            type = "pwa-node",
            request = "attach",
            name = "Auto Attach (pwa-node)",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            skipFiles = {
              "<node_internals>/**",
              "${workspaceFolder}/node_modules/**",
            },
          },
        }
      end
    end,
  },
}
