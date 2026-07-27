-- NOTE: the `ft = "yaml"` trigger is inherited from the original config. In
-- practice telescope still loads at startup because neogit lists it as a
-- dependency, which is what makes the <C-p>/<C-f>/<C-w>/<C-c> mappings in
-- `lua/config/mappings.lua` work in every filetype.
--
-- The old `lua/plugins/telescope.lua` also held an unused `setup()` (smart
-- path_display, prompt at top, <C-j>/<C-k> to move the selection, and the fzf
-- extension). It was never required, so telescope has always run on defaults;
-- that config is intentionally not carried over here. See the summary if you
-- want it enabled.
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	ft = "yaml",
	dependencies = {
		"nvim-lua/popup.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	},
}
