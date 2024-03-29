return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "bash" })
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "shellharden", "shfmt" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {},
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		opts = function(_, opts)
			if type(opts.sources) == "table" then
				local nls = require("null-ls")
				vim.list_extend(opts.sources, {
					nls.builtins.formatting.shellharden,
					nls.builtins.formatting.shfmt,
				})
			end
		end,
	},
}
