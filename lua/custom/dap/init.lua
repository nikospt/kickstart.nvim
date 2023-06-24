local dap = require "dap"
dap.configurations.python = {
	{
		name = "current file",
		type = "python",
		request = "launch",
		program = "${file}",
		cwd = '${workspaceFolder}',
		stopOnEntry = true,
	},
}
local dap_configs = require 'custom.dap.configs'
for k, v in pairs(dap_configs.python) do
  table.insert(dap.configurations.python, v)
end
dap.adapters.python = {
	type = "executable",
	command = "python3",
	args = { "-m", "debugpy.adapter", },
}