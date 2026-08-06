return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  opts = {
    terminal_cmd = "~/.local/bin/claude",
  },
  keys = {
    { "<leader>a", "", desc = "+ai", mode = { "n", "v" } },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Session" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Session" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add Current Buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send Selection" },
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", desc = "Add File (tree)", ft = { "NvimTree", "neo-tree", "oil" } },
    {
      "<leader>ay",
      function()
        local function yank_reference()
          local ok, claudecode = pcall(require, "claudecode")
          if not ok then
            return
          end

          local file_path = vim.api.nvim_buf_get_name(0)
          if file_path == "" then
            vim.notify("Copy Reference: buffer has no file", vim.log.levels.WARN)
            return
          end

          local path_ok, formatted_path = pcall(claudecode._format_path_for_at_mention, file_path)
          if not path_ok then
            vim.notify("Copy Reference failed: " .. tostring(formatted_path), vim.log.levels.ERROR)
            return
          end

          local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
          local range = (start_line == end_line) and tostring(start_line) or (start_line .. "-" .. end_line)

          local reference = "@" .. formatted_path .. "#" .. range
          vim.fn.setreg("+", reference)
          vim.notify("Copied " .. reference, vim.log.levels.INFO)
        end

        -- Marks ('<, '>) are only valid once visual mode is actually left, so
        -- exit it first and defer, mirroring claudecode.nvim's own
        -- exit_visual_and_schedule pattern for ClaudeCodeSend.
        local mode = vim.fn.mode()
        if mode == "v" or mode == "V" or mode == "\22" then
          local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
          vim.api.nvim_feedkeys(esc, "i", true)
          vim.schedule(yank_reference)
        else
          yank_reference()
        end
      end,
      mode = "v",
      desc = "Copy Reference",
    },
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Reject Diff" },
  },
}
