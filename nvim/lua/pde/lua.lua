if not require("config").pde.lua then
	return {}
end

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "lua", "luadoc", "luap" })
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function(_, opts)
			vim.list_extend(opts.ensure_installed, { "stylua" })
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		opts = function(_, opts)
			local nls = require("null-ls")
			table.insert(opts.sources, nls.builtins.formatting.stylua)
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/neodev.nvim",
			opts = {},
		},
		opts = {
			servers = {
				lua_ls = {
					settings = {
						Lua = {
							workspace = {
								checkThirdParty = false,
							},
							completion = { callSnippet = "replace" },
							telemetry = { enable = false },
							hint = {
								enable = false,
							},
						},
					},
				},
			},
			setup = {
				lua_ls = function(_, _)
					local lsp_utils = require("base.lsp.utils")
					lsp_utils.on_attach(function(client, buffer)
						if client.name == "lua_ls" then
							vim.keymap.set("n", "<leader>dX", function()
								require("osv").run_this()
							end, { buffer = buffer, desc = "OSV run" })
							vim.keymap.set("n", "<leader>dL", function()
								require("osv").launch({ port = 8086 })
							end, { buffer = buffer, desc = "OSV Launch" })
						end
					end)
				end,
			},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "jbyuki/one-small-step-for-vimkind" },
		},
		opts = {
			setup = {
				osv = function(_, _)
					local dap = require("dap")
					dap.configurations.lua = {
						{
							type = "nlua",
							request = "attach",
							name = "Attaching to running Neovim instance",
							host = function()
								local value = vim.fn.input("Hot [127.0.0.1]: ")
								if value ~= "" then
									return value
								end
								return "127.0.0.1"
							end,
							port = function()
								local val = tonumber(vim.fn.input("Port: ", "8086"))
								assert(val, "Please provide a port number")
								return val
							end,
						},
					}

					dap.adapters.lua = function(callback, config)
						callback({ type = "server", host = config.host, port = config.port })
					end
				end,
			},
		},
	},
}
