require("formatter").setup({
	filetype = {
		html = { require("formatter.filetypes.html").prettier },
		css = { require("formatter.filetypes.css").prettier },
		javascript = { require("formatter.filetypes.javascript").prettier },
		javascriptreact = { require("formatter.filetypes.javascript").prettier },
		typescript = { require("formatter.filetypes.typescript").prettier },
		typescriptreact = { require("formatter.filetypes.typescript").prettier },
		python = { require("formatter.filetypes.python").black },
		rust = { require("formatter.filetypes.rust").rustfmt },
		sh = { require("formatter.filetypes.sh").shfmt },
		go = { require("formatter.filetypes.go").gofmt },
		json = { require("formatter.filetypes.json").jq },
		php = { require("formatter.filetypes.php").phpcbf },
		lua = { require("formatter.filetypes.lua").stylua },
		markdown = { require("formatter.filetypes.markdown").prettier },
		blade = { require("formatter.filetypes.html").prettier },
	},
})
