local M = {}

-- Debugger installation location
--local install_path = fn.stdpath('data')
--local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = "~\netcoredbg\netcoredbg.exe"

function M.setup()
  local dap = require "dap"

  -- Adapter configuration
  dap.adapters.coreclr = {
    type = "executable",
    command = "c:/users/zbook/netcoredbg/netcoredbg",
    args = { "--interpreter=cli" },
  }

  -- Configuration
  dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end,
    },
  }

end

return M
