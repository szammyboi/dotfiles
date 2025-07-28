return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true, additional_vim_regex_highlighting=false },
			indent = { enable = true },
			ensure_installed = {
				"html",
				"css",
				"javascript",
				"markdown",
				"tsx",
				"typescript",
				"json",
				"astro",
				"svelte",
				"lua",
				"bash",
				"c",
				"cpp",
				"c_sharp",
				"python",
				"java",
				"go",
				"gosum",
				"gomod",
				"gotmpl",
				"elixir",
				"heex",
				"eex",
				"swift",
				"markdown_inline"
			}
		},
		config = function(self, opts)
			require('nvim-treesitter.configs').setup(opts)
			vim.treesitter.language.register("markdown", "mdx")
		end
	},
	{
	  "davidmh/mdx.nvim",
	  config = true,
	  dependencies = {"nvim-treesitter/nvim-treesitter"}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
--				"astro",
				"lua_ls",
				"clangd",
				"glsl_analyzer",
				"svelte",
				"ts_ls",
				"markdown_oxide",
				"omnisharp",
				"jdtls",
				"ltex",
				"pyright",
				"gopls",
				"lexical",

				"astro",
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
			},
			automatic_installation = true
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			local lspconfig = require('lspconfig')
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename);

			lspconfig.astro.setup({
			   capabilities = capabilities,
			   on_attach = on_attach,
			   filetypes = { "astro" },
			})

			lspconfig.lexical.setup {
				  cmd = { "/Users/szammy/.config/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
				  root_dir = function(fname)
					return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.cwd()
				  end,
				  filetypes = { "elixir", "eelixir", "heex" },
				  -- optional settings
				  settings = {},
				on_attach = function(client, bufnr)
    print("Lexical attached with capabilities:")
    print(vim.inspect(client.server_capabilities))
  end,
			}

			lspconfig.clangd.setup({
				cmd = {
					"clangd",
					"--completion-style=detailed",
					"--clang-tidy",
					"--all-scopes-completion",
					"--header-insertion=never",
				}
			})
			lspconfig.sourcekit.setup({
				capabilities = {
					workspace = {
						didChangeWatchedFiles = {
							dynamicRegistration = true,
						},
					},
				},
			})
		end
	},
	{
		"wojciech-kulik/xcodebuild.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"MunifTanjim/nui.nvim",
			"folke/snacks.nvim", -- (optional) to show previews
			"nvim-tree/nvim-tree.lua", -- (optional) to manage project files
			"stevearc/oil.nvim", -- (optional) to manage project files
			"nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
		},
		config = function()
			require("xcodebuild").setup({
				-- put some options here or leave it empty to use default settings
			})
		end,
	}
}
