return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				ensure_installed = { "lua", "c_sharp", "javascript", "python" },
				highlight = { enabled = true },
				indent = { enabled = true },
			})
		end,
	},
}
