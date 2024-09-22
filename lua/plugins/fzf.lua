return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  opts = function(_, opts)
    return vim.tbl_deep_extend("force", opts, {
      files = vim.tbl_deep_extend("force", opts.files, {
        actions = vim.tbl_deep_extend("force", opts.files.actions, {
          ["default"] = require("fzf-lua.actions").file_edit,
        }),
      }),
    })
  end,
}
