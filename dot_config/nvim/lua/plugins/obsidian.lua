return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	event = "VeryLazy",
	ft = "markdown",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian",
			},
			-- {
			-- 	name = "work",
			-- 	path = "~/obsidian_work/",
			-- },
		},
		ui = {
			enable = false,
		},
	},
	config = function(_, opts)
		require("obsidian").setup(opts) -- The setup happens HERE
	end,
}
