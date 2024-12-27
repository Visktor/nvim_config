return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "onsails/lspkind.nvim" },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local types = require("cmp.types")
      local compare = require("cmp.config.compare")

      local lspkind = require("lspkind")

      opts.formatting = vim.tbl_deep_extend("force", opts.formatting, {
        format = lspkind.cmp_format({
          mode = "symbol", -- show only symbol annotations
          maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
          ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          show_labelDetails = true, -- show labelDetails in menu. Disabled by default
          symbol_map = { Supermaven = "" },
        }),
      })

      ---@type table<integer, integer>
      local modified_priority = {
        [types.lsp.CompletionItemKind.Variable] = types.lsp.CompletionItemKind.Method,
        [types.lsp.CompletionItemKind.Snippet] = 0, -- top
        [types.lsp.CompletionItemKind.Keyword] = 0, -- top
        [types.lsp.CompletionItemKind.Text] = 100, -- bottom
      }
      ---@param kind integer: kind of completion entry
      local function modified_kind(kind)
        return modified_priority[kind] or kind
      end
      opts.sorting = vim.tbl_extend("force", opts.sorting, {
        comparators = {
          compare.offset,
          compare.exact,
          compare.score,
          compare.order,
          function(entry1, entry2) -- sort by length ignoring "=~"
            local len1 = string.len(string.gsub(entry1.completion_item.label, "[=~()_]", ""))
            local len2 = string.len(string.gsub(entry2.completion_item.label, "[=~()_]", ""))
            if len1 ~= len2 then
              return len1 - len2 < 0
            end
          end,
          compare.recently_used,
          function(entry1, entry2) -- sort by compare kind (Variable, Function etc)
            local kind1 = modified_kind(entry1:get_kind())
            local kind2 = modified_kind(entry2:get_kind())
            if kind1 ~= kind2 then
              return kind1 - kind2 < 0
            end
          end,
          function(entry1, entry2) -- score by lsp, if available
            local t1 = entry1.completion_item.sortText
            local t2 = entry2.completion_item.sortText
            if t1 ~= nil and t2 ~= nil and t1 ~= t2 then
              return t1 < t2
            end
          end,
        },
      })
      return opts
    end,
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
      { "<leader><leader>", "<cmd>Neotree reveal<cr>", desc = "Reveal current file on Neotree" },
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
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "MagicDuck/grug-far.nvim",
    keys = {
      { "<leader>sr", false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      terminal = {
        win = {
          style = "float",
        },
      },
      ---@class snacks.scroll.Config
      scroll = {
        animate = {
          duration = {
            step = 15,
            total = 150,
          },
          spamming = 5,
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      { "S", mode = { "n", "o", "t", "i", "s", "x" }, false },
      { "s", mode = { "n", "o" }, false },
    },
    opts = {
      modes = {
        treesitter_search = {
          enabled = false,
        },
        remote = {
          enabled = false,
        },
        treesitter = {
          enabled = false,
        },
        search = {
          enabled = false,
        },
      },
    },
  },
  {
    "monaqa/dial.nvim",
    lazy = false,
    keys = {
      { "+", "<C-a>", mode = { "n", "v" } },
      { "-", "<C-x>", mode = { "n", "v" } },
      { "g+", "g<C-a>", mode = { "n", "v" } },
      { "g-", "g<C-x>", mode = { "n", "v" } },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
}
