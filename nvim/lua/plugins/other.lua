return {
	{
		'numToStr/Comment.nvim',
		event = 'VeryLazy',
		config = function()
			require('Comment').setup()
		end
	},
	{
		'sontungexpt/better-diagnostic-virtual-text',
		config = function(_)
			require('better-diagnostic-virtual-text').setup(opts)
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		config = true
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim"
		},
		opts = { lsp = { auto_attach = true } },
		keys = {
			{ "<leader>o", function() require("nvim-navbuddy").open() end, desc = "NavBuddy Outline" }
		}
	},
	{ "rktjmp/lush.nvim" }
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	keys = {
	-- 		{
	-- 			"<leader>?",
	-- 			function()
	-- 				require("which-key").show({ global = false })
	-- 			end,
	-- 			desc = "Buffer Local Keymaps (which-key)",
	-- 		},
	-- 	},
	-- }
	-- {
	-- 	'mawkler/hml.nvim',
	-- 	opts = {}
	-- }
}
