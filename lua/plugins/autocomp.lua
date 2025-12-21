return {
	{
		'williamboman/mason.nvim',
		version = "1.11.0",
		config = function()
			require('mason').setup({
				ensure_installed = { 
					'clangd', 
					'codelldb',
					'jdtls'
				},
			})
		end
	},
	{
		'williamboman/mason-lspconfig.nvim',
		version = "1.32.0",
		config = function()
			require('mason-lspconfig').setup({
				ensure_installed = { 
					'clangd',
					'jdtls'
				}, -- Lista de servidores a instalar
			})
		end
	},
	{
		'neovim/nvim-lspconfig',
		config = function()
			local mason_lspconfig = require('mason-lspconfig')

			mason_lspconfig.setup_handlers({
				function(server_name)
					vim.lsp.enable(server_name)
				end,
			})

			vim.lsp.config('clangd',{
				cmd = { 
					"clangd", 
					"--compile-commands-dir=build/Debug",
					"--enable-config"
				},
				filetypes = {"c", "cpp", "ipp"}
			})

			vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#FF5555", bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#FFAA00", bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#55FFFF", bg = "NONE" })
			vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#55FF55", bg = "NONE" })

			local signs = {
				Error = "",
				Warn  = "",
				Hint  = "",
				Info  = ""
			}

			-- Configuración de diagnóstico
			vim.diagnostic.config({
				virtual_text = true, -- Muestra los errores como texto virtual en las líneas
        signs = {
					active = true,
					text = {
          	[vim.diagnostic.severity.ERROR] = "",
          	[vim.diagnostic.severity.WARN] = "",
          	[vim.diagnostic.severity.INFO] = "",
          	[vim.diagnostic.severity.HINT] = "",
					},
        }, -- Muestra los signos (íconos) para los errores
				update_in_insert = true,  -- Actualiza los diagnósticos mientras se escribe
				underline = true,     -- Subraya las líneas con errores
				severity_sort = true, -- Ordena los diagnósticos por severidad
			})

		end
	},
	{
		'hrsh7th/nvim-cmp',

		dependencies = {
			{
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer',
				'hrsh7th/cmp-path',
				'hrsh7th/cmp-cmdline',
				'L3MON4D3/LuaSnip',
				'saadparwaiz1/cmp_luasnip'
			},
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require "nvim-autopairs.completion.cmp"
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
			{
				-- snippet plugin
				"L3MON4D3/LuaSnip",
				dependencies = "rafamadriz/friendly-snippets",
				opts = { history = true, updateevents = "TextChanged,TextChangedI" },
				config = function(_, opts)
					require("luasnip").config.set_config(opts)
					require "configs.luasnip"
				end,
			},
		},

		config = function()
			require('configs.cmp') 
		end,
	},
	-- Java
	{
		'mfussenegger/nvim-jdtls',
	},
	-- Rust
	{
		'mrcjkb/rustaceanvim',
		version = '^6', -- Recommended
		lazy = false, -- This plugin is already lazy
		ft = "rust",
		config = function ()
			local mason_registry = require('mason-registry')
			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
			-- If you are on Linux, replace the line above with the line below:
			-- local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
			local cfg = require('rustaceanvim.config')

			vim.g.rustaceanvim = {
				dap = {
					adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}
		end
	}
}
