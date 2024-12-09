return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>sr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>sR", false },
  },
  opts = function(_, opts)
    opts.grep = {
      rg_glob = true,
      -- first returned string is the new search query
      -- second returned string are (optional) additional rg flags
      -- @return string, string?
      rg_glob_fn = function(query)
        local regex, flags = query:match("^(.-)%s%-%-(.*)$")
        -- If no separator is detected will return the original query
        return (regex or query), flags
      end,
    }
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
