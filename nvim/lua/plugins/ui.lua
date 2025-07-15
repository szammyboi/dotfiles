return {
	{ "nvim-tree/nvim-web-devicons", opts = {} },
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup {
				cursorline = {
					enable = true,
					timeout = 500,
					number = true,
				},
				cursorword = {
					enable = true,
					min_length = 2,
					hl = { underline = true },
				},
			}
		end, 
	},
	{
		"windwp/windline.nvim",
		event = 'VeryLazy',
		config = function()
			require('wlsample.bubble')
		end,
	},
	{
		"willothy/nvim-cokeline",
		dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim"
		},
		config = true
	},
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = {
			"folke/snacks.nvim"
		},
		keys = {
			{
				"<leader>n",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
			{
				"<leader>cw",
				"<cmd>Yazi cwd<cr>",
				desc = "Open the file manager in nvim's working directory",
			},
			{
				"<c-up>",
				"<cmd>Yazi toggle<cr>",
				desc = "Resume the last yazi session",
			},
		},
		opts = {
			open_for_directories = true,
			keymaps = {
				show_help = "<f1>",
			},
		},
		init = function()
			vim.g.loaded_netrwPlugin = 1
		end,
	},
	{
		'nvim-telescope/telescope.nvim', 
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		end
	},
	{
		"saghen/blink.cmp",
		version = "1.*",
		opts = {
			completion = {
				accept = { auto_brackets = { enabled = true } }
			},
			signature = { enabled = true },
			keymap = {
				preset = "super-tab"
			},
			sources = {
				default = { 'lsp', 'path', 'snippets' },
			},
		}
	},
	{
		"gelguy/wilder.nvim",
		config = function()
			local wilder = require("wilder")
			wilder.setup({ modes = { ":", "/", "?" } })
			wilder.set_option(
				"renderer",
				wilder.wildmenu_renderer({
					highlighter = wilder.basic_highlighter(),
				})
			)
		end,
  }
}
