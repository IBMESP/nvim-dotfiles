return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
      	ensure_installed = { 
					'clangd', 
					'codelldb', 
				},
			})
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { 
					'clangd', 
				}, -- Lista de servidores a instalar
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({})
        end,
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
    	},
    
		

    config = function()
    	require('configs.cmp') 
    end,
  },
}
