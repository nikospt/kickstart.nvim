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
dap.adapters.python = {
	type = "executable",
	command = "python3",
	args = { "-m", "debugpy.adapter", },
}
