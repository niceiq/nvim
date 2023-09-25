local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local masondap_status_ok, mason_nvim_dap = pcall(require, "mason-nvim-dap")
if not masondap_status_ok then
	return
end

mason_nvim_dap.setup()
mason_nvim_dap.setup()

-- Dap Config
require('dap').set_log_level('INFO') -- Helps when configuring DAP, see logs with :DapShowLog

dap.configurations = {
    c = {
      {
        name = "Launch file", -- Human readable name
        type = "codelldb", -- Which adapter to use
        request = "launch", -- Whether to "launch" or "attach" to program
        program = function ()
          return vim.fn.input('executablePath to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}", 
        stopOnEntry = false,
      },
    }
}

dap.adapters.codelldb = { -- C/C++/Rust
  type = "server",
  port = "${port}",
  executable = {
    command = "/home/iq/.local/share/nvim/mason/bin/codelldb",
    args = {"--port", "${port}"},
  },
}

-- Icons
vim.fn.sign_define('DapBreakpoint', { text = ''})

dap.configurations.cpp = dap.configurations.c -- Copying settings for both C and C++

-- Dap Ui Config
local dap_ui_status_ok, dap_ui = pcall(require, "dapui")
if not (dap_status_ok and dap_ui_status_ok) then
  return
end

-- Auto-open
dap_ui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  }
})

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function ()
  dap_ui.close()
end
dap.listeners.after.event_exited["dapui_config"] = function ()
  dap_ui.close()
end

