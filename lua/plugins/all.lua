return {
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
    "kevinhwang91/nvim-hlslens",
    config = function()
      local hlslens = require("hlslens")
      if hlslens then
        local overrideLens = function(render, posList, nearest, idx, relIdx)
          local _ = relIdx
          local lnum, col = unpack(posList[idx])

          local text, chunks
          if nearest then
            text = ("[%d/%d]"):format(idx, #posList)
            chunks = { { " ", "Ignore" }, { text, "VM_Extend" } }
          else
            text = ("[%d]"):format(idx)
            chunks = { { " ", "Ignore" }, { text, "HlSearchLens" } }
          end
          render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        end
        local lensBak
        local config = require("hlslens.config")
        local gid = vim.api.nvim_create_augroup("VMlens", {})
        vim.api.nvim_create_autocmd("User", {
          pattern = { "visual_multi_start", "visual_multi_exit" },
          group = gid,
          callback = function(ev)
            if ev.match == "visual_multi_start" then
              lensBak = config.override_lens
              config.override_lens = overrideLens
            else
              config.override_lens = lensBak
            end
            hlslens.start()
          end,
        })
      end
    end,
    event = "VeryLazy",
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
        "debugloop/telescope-undo.nvim",
      },
    },
    opts = {
      defaults = {
        layout_config = { prompt_position = "top", width = 0.9, height = 0.9 },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },

    config = function(_, opts)
      require("telescope").load_extension("undo")
      return opts
    end,
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
    keys = {
      { "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo Tree" },
    },
  },
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
    keys = {
      { "<leader>cu", "<cmd>lua require('undotree').toggle()<cr>", desc = "Undo Tree" },
    },
  },
  {
    "m-demare/hlargs.nvim",
  },
}
