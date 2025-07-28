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
	-- Lua
	{
	  "folke/persistence.nvim",
	  event = "BufReadPre", -- this will only start session saving when an actual file was opened
	  opts = {
		-- add any custom options here
	  }
	},
	{
	  'rmagatti/auto-session',
	  lazy = false,

	  ---enables autocomplete for opts
	  ---@module "auto-session"
	  ---@type AutoSession.Config
	  opts = {
		suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		-- log_level = 'debug',
	  }
	},
	{
		'stevearc/conform.nvim',
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
				c = { 'clang_format' },
			},
			formatters = {
				clang_format = {
					prepend_args = { '--style=file', '--fallback-style=LLVM' },
				},
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		}
	}	
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
