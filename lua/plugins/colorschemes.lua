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
        theme = "wave",
        transparent = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { bold = true, italic = false },
        undercurl = true,
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
        colors.purple = "#F6FFA6"
        colors.red = "#fa2f92"
        colors.green1 = "#6FDCE3"
        colors.orange = "#ff966c"
        colors.yellow = "#C8FFE0"
        colors.green2 = "#41a6b5"
        colors.blue1 = "#30E3CA"
        colors.blue = "#86e1fc"
        colors.green = "#D2FF72"
        colors.cyan = "#fca7ea"
        --
        --   -- bg = "#222436",
        --   -- bg_dark = "#1e2030",
        --   -- bg_float = "#1e2030",
        --   -- bg_highlight = "#2f334d",
        --   -- bg_popup = "#1e2030",
        --   -- bg_search = "#3e68d7",
        --   -- bg_sidebar = "#1e2030",
        --   -- bg_statusline = "#1e2030",
        --   -- bg_visual = "#2d3f76",
        --   -- black = "#1b1d2b",
        --   -- blue = "#82aaff",
        --   -- blue0 = "#3e68d7",
        --   -- blue1 = "#65bcff",
        --   -- blue2 = "#0db9d7",
        --   -- blue5 = "#89ddff",
        --   -- blue6 = "#b4f9f8",
        --   -- blue7 = "#394b70",
        --   -- border = "#1b1d2b",
        --   -- border_highlight = "#589ed7",
        --   -- comment = "#636da6",
        --   -- dark3 = "#545c7e",
        --   -- dark5 = "#737aa2",
        --   -- diff = {
        --   --   add = "#273849",
        --   --   change = "#252a3f",
        --   --   delete = "#3a273a",
        --   --   text = "#394b70"
        --   -- },
        --   -- error = "#c53b53",
        --   -- fg = "#c8d3f5",
        --   -- fg_dark = "#828bb8",
        --   -- fg_float = "#c8d3f5",
        --   -- fg_gutter = "#3b4261",
        --   -- fg_sidebar = "#828bb8",
        --   -- git = {
        --   --   add = "#b8db87",
        --   --   change = "#7ca1f2",
        --   --   delete = "#e26a75",
        --   --   ignore = "#545c7e"
        --   -- },
        --   -- green = "#c3e88d",
        --   -- green1 = "#4fd6be",
        --   -- green2 = "#41a6b5",
        --   -- hint = "#4fd6be",
        --   -- info = "#0db9d7",
        --   -- magenta = "#c099ff",
        --   -- magenta2 = "#ff007c",
        --   -- none = "NONE",
        --   -- orange = "#ff966c",
        --   -- purple = "#fca7ea",
        --   -- rainbow = { "#82aaff", "#ffc777", "#c3e88d", "#4fd6be", "#c099ff", "#ffa2aa" },
        --   -- red = "#ff757f",
        --   -- red1 = "#c53b53",
        --   -- teal = "#4fd6be",
        --   -- terminal_black = "#444a73",
        --   -- todo = "#82aaff",
        --   -- warning = "#ffc777",
        --   -- yellow = "#ffc777"
        --
        return colors
      end,
      on_highlights = function(hl)
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
