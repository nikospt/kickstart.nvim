local M = {}

local i = require("neogen.types.template").item
local py_annotation = {
	{ nil,         '"""',               { type = { "func" } } },
	{ nil,         '$1',                { type = { "func" } } },
	{ i.Parameter, ":param %s: $1|any", },
	{ i.Tparam,    ":param %s: $1|any", },
	{ i.Return,    ":return: $1|any" },
	{ nil,         '"""',               { type = { "func" } } },
}

function M.setup()
	require("neogen").setup({
		-- Enables placeholders when inserting annotation
		enable_placeholders = true,
		snippet_engine = 'luasnip',

		-- Placeholders used during annotation expansion
		placeholders_text = {
			["description"] = "[TODO:description]",
			["tparam"] = "[TODO:tparam]",
			["parameter"] = "[TODO:parameter]",
			["return"] = "[TODO:return]",
			["class"] = "[TODO:class]",
			["throw"] = "[TODO:throw]",
			["varargs"] = "[TODO:varargs]",
			["type"] = "[TODO:type]",
			["attribute"] = "[TODO:attribute]",
			["args"] = "[TODO:args]",
			["kwargs"] = "[TODO:kwargs]",
		},

		-- Placeholders highlights to use. If you don't want custom highlight, pass "None"
		placeholders_hl = "DiagnosticHint",
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
