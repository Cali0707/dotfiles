return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
      		"saadparwaiz1/cmp_luasnip",
      		"hrsh7th/cmp-buffer",
      		"hrsh7th/cmp-path",
      		"hrsh7th/cmp-cmdline",
    	},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					},
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, {"i", "s", }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, {"i", "s"} ),
				},
				sources = cmp.config.sources {
					{ name = "nvim_lsp_signature_help" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				},
			}

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end
	},
	{
		"L3MON4D3/LuaSnip",
    	dependencies = {
      		"rafamadriz/friendly-snippets",
      		config = function()
        		require("luasnip.loaders.from_vscode").lazy_load()
      		end,
    	},
		config = {
			history = true,
			delete_check_events = "TextChanged",
		},

		keys = {
			{
				"<tab>",
				function()
					return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
				end,
				expr = true, remap = true, silent = true, mode = "i"
			},
			{
				"<tab>",
				function()
					require("luasnip").jump(1)
				end,
				mode = "s"
			},
			{
				"<s-tab>",
				function()
					require("luasnip").jump(-1)
				end,
				mode = { "i", "s" }
			}
		},
	},
}

		
			

