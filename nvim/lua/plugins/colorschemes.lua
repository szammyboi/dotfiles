return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require('kanagawa').setup({
				transparent=true,
				compile=true
			})
		end,
		build = function()
			vim.cmd("KanagawaCompile")
		end
	},
	{
		"szammyboi/dune.nvim",
		dir = "~/dev/colorschemes/dune.nvim/",
		config = function()
			require("dune").setup({
				transparent=true,
				compile=true
			})

			vim.api.nvim_create_user_command("ReloadDune", function() 
				vim.cmd("Lazy reload dune.nvim")
				vim.defer_fn(function() 
					vim.cmd("DuneCompile")
				end, 1000)
			end, {})
		end,
		build = function()
			vim.cmd("Compile")
		end

	}
}
