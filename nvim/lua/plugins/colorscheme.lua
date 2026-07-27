return {
	"sainnhe/gruvbox-material",
	name = "gruvbox-material",
	-- Must load eagerly and ahead of everything else, or other non-lazy plugins
	-- draw with the default colorscheme first.
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruvbox-material")
	end,
}
