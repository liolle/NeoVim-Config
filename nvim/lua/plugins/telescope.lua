return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				hidden = true,
				no_ignore = true,
				file_ignore_patterns = {
					".git/",
					"node_modules/",
					-- .NET8
					"bin/Debug/net8.0/",
					"obj/Debug/net8.0/",
					".nuget",
					".dll",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
					no_ignore = true,
					file_ignore_patterns = {
						".git/",
						"node_modules/",
						-- .NET8
						"bin/Debug/net8.0/",
						"obj/Debug/net8.0/",
						".nuget",
						".dll",
					},
				},
			},
		})
	end,
}
