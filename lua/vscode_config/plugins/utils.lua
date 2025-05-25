return {
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify",
    vscode = true,
    opts = {
      mapping = {
        startStopRecording = "q",
        playMacro = "Q",
        switchSlot = "<C-Q>",
        editMacro = "cq",
        deleteAllMacros = "dq",
        yankMacro = "yq",
        -- ⚠️ this should be a string you don't use in insert mode during a macro
        addBreakPoint = "<leader>|",
      },
    },
  },
}
--
