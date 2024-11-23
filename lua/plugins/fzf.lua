return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>sr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>sR", false }
  },
  opts = function(_, opts)
    return opts
    -- return vim.tbl_deep_extend("force", opts, {
    -- files = vim.tbl_deep_extend("force", opts.files, {
    -- actions = vim.tbl_deep_extend("force", opts.files.actions, {
    --   ["default"] = require("fzf-lua.actions").file_edit,
    -- }),
    -- }),
    -- })
  end,
}
