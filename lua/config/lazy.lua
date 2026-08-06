local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

print(lazypath)

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo(
      { { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." } },
      true,
      {}
    )
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = { -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = function(_, opts)
        vim.schedule(function()
          ---@diagnostic disable-next-line: param-type-mismatch
          vim.list_extend(LazyVim.config.kind_filter.default, { "Variable" })
        end)
      end,
    },
    {
      import = "lazyvim.plugins.extras.coding.blink",
    },
    {
      import = "lazyvim.plugins.extras.coding.luasnip",
    },
    {
      import = "lazyvim.plugins.extras.coding.yanky",
    },
    {
      import = "lazyvim.plugins.extras.dap.core",
    },
    {
      import = "lazyvim.plugins.extras.dap.nlua",
    },
    {
      import = "lazyvim.plugins.extras.editor.aerial",
    },
    {
      import = "lazyvim.plugins.extras.editor.dial",
    },
    {
      import = "lazyvim.plugins.extras.editor.illuminate",
    },
    {
      import = "lazyvim.plugins.extras.editor.inc-rename",
    },
    {
      import = "lazyvim.plugins.extras.editor.mini-move",
    },
    {
      import = "lazyvim.plugins.extras.editor.telescope",
    },
    {
      import = "lazyvim.plugins.extras.formatting.prettier",
    },
    {
      import = "lazyvim.plugins.extras.lang.prisma",
    },
    {
      import = "lazyvim.plugins.extras.lang.tailwind",
    },
    {
      import = "lazyvim.plugins.extras.lang.typescript",
    },
    {
      import = "lazyvim.plugins.extras.lang.php",
    },
    {
      import = "lazyvim.plugins.extras.ui.treesitter-context",
    },
    {
      import = "lazyvim.plugins.extras.util.mini-hipatterns",
    },
    {
      import = "plugins",
    },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = {
    colorscheme = { "habamax" },
  },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip", -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
