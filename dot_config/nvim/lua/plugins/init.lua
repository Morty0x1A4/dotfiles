return {
	{
		"stevearc/conform.nvim",
		-- event = 'BufWritePre', -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			actions = {
				open_file = {
					quit_on_open = true, -- Closes the tree when opening a file
				},
			},
		},
	},
	{
		"echasnovski/mini.nvim",
		version = false, -- Important: use latest version
		event = "VeryLazy",
		config = function()
			require("mini.surround").setup()
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		opts = {},
	},
	require("plugins.obsidian"),
	-- test new blink
	-- { import = "nvchad.blink.lazyspec" },

	--{
	-- "nvim-treesitter/nvim-treesitter",
	-- 	opts = {
	-- 		ensure_installed = {
	-- 			"vim", "lua", "vimdoc",
	--      "html", "css"
	-- 		},
	-- 	},
	-- },
}
