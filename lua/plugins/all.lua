-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  {
    "echasnovski/mini.ai",
    opts = {
      n_lines = 2000,
      custom_textobjects = {
        t = false,
      },
      search_method = "cover_or_nearest",
    },
  },
  { "ellisonleao/gruvbox.nvim" },
  { "rebelot/kanagawa.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    keys = {
      { "S", mode = { "x", "o" }, false },
      { "s", mode = { "n" }, false },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",

    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = false },
        use_libuv_file_watcher = true,
      },
    },
    keys = {
      { "<leader>o", "<cmd>Neotree reveal<cr>", desc = "Reveal current file on Neotree" },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    event = "bufRead",
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("local_detach_ufo", { clear = true }),
        pattern = opts.filetype_exclude,
        callback = function()
          require("ufo").detach()
        end,
      })

      vim.opt.foldlevelstart = 99
      require("ufo").setup(opts)
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    event = "bufRead",
    disable = true,
    config = function()
      require("neoscroll").setup({
        -- All these keys will be mapped to their corresponding default scrolling animation
        mappings = { "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = false, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
        easing_function = nil, -- Default easing function
        pre_hook = function()
          vim.opt.eventignore:append({
            "WinScrolled",
            "CursorMoved",
          })
        end,
        post_hook = function()
          vim.opt.eventignore:remove({
            "WinScrolled",
            "CursorMoved",
          })
        end,
        performance_mode = false, -- Disable "Performance Mode" on all buffers.
      })
    end,
  },
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({})
    end,
    lazy = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "princejoogie/dir-telescope.nvim",
      },
    },
    opts = {
      defaults = {
        layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
  {
    "princejoogie/dir-telescope.nvim",
    -- telescope.nvim is a required dependency
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("dir-telescope").setup({
        -- these are the default options set
        hidden = true,
        no_ignore = false,
        show_preview = true,
      })
    end,
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
}
