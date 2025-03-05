return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("everforest").setup({
  --       background = "hard",
  --     })
  --   end,
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = false,
  --   opts = {
  --     flavour = "latte",
  --     transparent_background = false,
  --   },
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   opts = {},
  -- },
  -- { "ellisonleao/gruvbox.nvim" },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   config = function()
  --     require("kanagawa").setup({
  --       theme = "wave",
  --       -- transparent = true,
  --       commentStyle = { italic = true },
  --       functionStyle = { bold = true },
  --       keywordStyle = { bold = true, italic = false },
  --       undercurl = true,
  --     })
  --   end,
  -- },
  { "EdenEast/nightfox.nvim" },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = false,
      style = "storm",
      on_colors = function(colors)
        -- colors.bg_visual = "#6C77B5"
        -- colors.comment = "#444b87"
        -- colors.purple = "#F6FFA6"
        colors.red = "#fa2f92"
        -- colors.green1 = "#6FDCE3"
        -- colors.orange = "#ff966c"
        colors.yellow = "#F6FFA6"
        -- colors.green2 = "#41a6b5"
        -- colors.blue1 = "#30E3CA"
        colors.blue = "#fca7ea"
        colors.green = "#D2FF92"
        -- colors.cyan = "#C8FFE0"
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
        -- colors.blue7 = "#636da6"
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
        --   -- magenta = "#fca7ea",
        --   -- magenta2 = "#ff007c",
        --   -- none = "NONE",
        --   -- orange = "#ff966c",
        colors.purple = "#c099ff"
        --   -- rainbow = { "#82aaff", "#ffc777", "#c3e88d", "#4fd6be", "#c099ff", "#ffa2aa" },
        --   -- red = "#ff757f",
        --   -- red1 = "#c53b53",
        --   -- teal = "#4fd6be",
        colors.terminal_black = "#636da6"
        --d   -- todo = "#82aaff",
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
}
