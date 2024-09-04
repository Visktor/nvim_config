return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
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
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        keywords = { italic = true },
        comments = { italic = true },
        functions = { italic = true, bold = true },
        variables = { italic = true },
        strings = { italic = true },
      },
    },
  },
  { "sainnhe/gruvbox-material" },
}