return {
  "ibhagwan/fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>sr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
    { "<leader>sR", false },
    { "<leader><leader>", false },
    {
      "<leader>j",
      function()
        require("fzf-lua").files({})
      end,
      desc = "Jump to file",
    },
  },
  opts = {},
}
