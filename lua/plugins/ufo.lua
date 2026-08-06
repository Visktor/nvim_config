return {
  -- UFO folding
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    event = "BufReadPost",
    opts = {
      filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
      provider_selector = function(_, _, buftype)
        -- nofile buffers (dashboards, terminals, etc.) crash treesitter provider
        -- with an unhandled UfoFallbackException; skip ufo for them entirely
        if buftype ~= "" and buftype ~= "acwrite" then
          return ""
        end
        -- lsp main, treesitter fallback: ufo only reads providers[1] and [2],
        -- a 3rd entry (e.g. "indent") would silently never run
        return { "lsp", "treesitter" }
      end,
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

      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (" 󰦸 ... %d "):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end
      -- TODO: figure out how to make folds include last line
      opts.enable_get_fold_virt_text = true
      opts.fold_virt_text_handler = handler

      require("ufo").setup(opts)

      -- required by ufo: native zR/zM don't reliably track fold state once
      -- foldmethod becomes "manual" (what ufo sets under the hood)
      vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open All Folds" })
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close All Folds" })
      vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { desc = "Open Folds Except Kinds" })
      vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { desc = "Close Folds With" })
    end,
  },
  -- Folding preview, by default h and l keys are used.
  -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
  -- On second press the preview will be closed and fold will be opened.
  -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
  -- { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
}
