require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node

ls.add_snippets(nil, {
	python = {
		snip({
			trig = "import",
			namr = "Import python modules",
			dscr = "Import numpy and matplotlib",
		}, {
			-- Separate by commas for new line
			text("import numpy", "import matplotlib")
		}),
	},
})
