return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<M-;>",
          clear_suggestion = "<C-]>", -- plugin default, free vs herdr/ghostty/skhd
          accept_word = "<C-j>", -- was <M-b>, freed: herdr toggle_sidebar. plugin's own default, clean vs herdr/ghostty/skhd
        },
        ignore_filetypes = { "md", "markdown" },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
      })
    end,
  },
}
