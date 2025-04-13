local DEFAULT_SETTINGS = {
	-- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
	-- This setting has no relation with the `automatic_installation` setting.
	---@type string[]
	ensure_installed = {
		"lua_ls",
		"ts_ls",
		"eslint",
		"gopls",
		"omnisharp",
	},

	-- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
	-- This setting has no relation with the `ensure_installed` setting.
	-- Can either be:
	--   - false: Servers are not automatically installed.
	--   - true: All servers set up via lspconfig are automatically installed.
	--   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
	--       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
	---@type boolean
	automatic_installation = true,

	-- See `:h mason-lspconfig.setup_handlers()`
	---@type table<string, fun(server_name: string)>?
	handlers = nil,
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup(DEFAULT_SETTINGS)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local omnisharp_bin = vim.fn.expand("~") .. "/.local/share/nvim/mason/bin/omnisharp"
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.gopls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.omnisharp.setup({
				cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
			})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<space>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
}
