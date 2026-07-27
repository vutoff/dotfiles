return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			css = { "prettier" },
			go = { "gofmt", "goimports" },
			graphql = { "prettier" },
			javascript = { "prettier" },
			json = { "prettier" },
			lua = { "stylua" },
			markdown = { "prettier" },
			python = function(bufnr)
				if require("conform").get_formatter_info("ruff_format", bufnr).available then
					return { "ruff_format" }
				else
					return { "black", "isort" }
				end
			end,
			sql = { "sqlfluff" },
			scss = { "prettier" },
			toml = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			-- yaml = { 'prettier' },
			zsh = { "beautysh" },
		},
		format_on_save = {
			timeout_ms = 1000,
		},
	},
}
