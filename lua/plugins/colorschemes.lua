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
        transparent = true,
        theme = "wave",
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      on_colors = function(colors)
        colors.bg_visual = "#6C77B5"
        colors.comment = "#6C77B5"
        return colors
      end,

      on_highlights = function(hl, c)
        hl.LineNr = {
          fg = "#6C77B5",
        }
        hl.LineNrAbove = {
          fg = "#6C77B5",
        }
        hl.LineNrBelow = {
          fg = "#6C77B5",
        }
        hl.CursorLineNr = {
          bold = true,
          fg = "#ffffff",
        }
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
