return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        commentStyle = { italic = true },
        undercurl = true,
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      on_colors = function(colors)
        colors.bg_visual = "#007197"
      end,
      transparent = false,
      styles = {
        keywords = { bold = true, italic = true },
        comments = { italic = true },
        functions = { italic = true, bold = true },
        strings = { italic = true },
      },
    },
  },

  { "sainnhe/gruvbox-material" },
}
