-- Check if running in VSCode
if vim.g.vscode then
  require("vscode_config.config.lazy")
else
  require("config.lazy")
end
