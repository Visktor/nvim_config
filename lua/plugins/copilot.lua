return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        opts = {
          enabled = false,
        },
        config = function()
          require("copilot").setup({
            enabled = false,
          })
        end,
      },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      auto_insert_mode = true,
      question_header = "  " .. "Visktor" .. " ",
      answer_header = "  Copilot ",
      window = {
        width = 0.4,
      },
      mappings = {
        submit_prompt = {
          normal = "<Leader>s",
          insert = "<C-s>",
        },
      },
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<M-c>",
          clear_suggestion = "<M-x>",
          accept_word = "<M-b>",
        },
        ignore_filetypes = { "md", "markdown" },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,
        },
      })
    end,
  },
}
