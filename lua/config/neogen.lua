local M = {}

local i = require("neogen.types.template").item
local py_annotation = {
	{ nil,         '"""',            { type = { "func" } } },
	{ nil,         '<description>',  { type = { "func" } } },
	{ i.Parameter, ":param %s:$1", },
	{ i.Return,    ":return:$1|any" },
	{ nil,         '"""',            { type = { "func" } } },
}

function M.setup()
	require("neogen").setup({
		enabled = true,
		languages = {
			python = {
				template = {
					annotation_convention = 'my_annotation',
					my_annotation = py_annotation
				}
			}
		}
	})
end

return M
