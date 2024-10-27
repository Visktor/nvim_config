return {
  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local types = require("cmp.types")
      local compare = require("cmp.config.compare")

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
      { "<leader>z", "<cmd>Neotree reveal<cr>", desc = "Reveal current file on Neotree" },
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
  { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      presets = { inc_rename = true },
      routes = {
        {
          filter = {
            event = "notify",
            find = "No information available",
          },
          opts = { skip = true },
        },
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
}
