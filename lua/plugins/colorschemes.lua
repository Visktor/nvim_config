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
      require("kanagawa").setup({})
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_colors = function(colors)
        colors.bg_visual = "#6C77B5"
      end,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        keywords = { bold = true },
        comments = { italic = true },
        functions = { bold = true },
      },
    },
  },
  { "sainnhe/gruvbox-material" },
}
