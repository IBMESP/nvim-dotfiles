return {
	-- colorscheme
  { 
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
    	vim.o.background = "dark" -- Establece el fondo oscuro
    	require("gruvbox").setup({
      	contrast = "hard", -- Opciones: 'hard', 'soft' o vacío para el contraste predeterminado
      	overrides = {},    -- Personaliza grupos de resaltado si es necesario
    	})
      vim.cmd("colorscheme gruvbox")
  	end,
		priority = 1000,
  },

	-- nvim-tree
	{
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
	{ "nvim-tree/nvim-web-devicons", opts = {} },

	-- indent-blankline 
	{
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
	},

	-- wich-key 
	{
  	"folke/which-key.nvim",
  	event = "VeryLazy",
  	opts = {
    	-- your configuration comes here
    	-- or leave it empty to use the default settings
    	-- refer to the configuration section below
  	},
  	keys = {
    	{
      	"<leader>?",
      	function()
        require("which-key").show({ global = false })
      	end,
      	desc = "Buffer Local Keymaps (which-key)",
    	},
  	},
	},
	
	-- gitsigns
	{
		"lewis6991/gitsigns.nvim",

		config = function ()
			require("gitsigns").setup({})	
			vim.cmd "set statusline+=%{get(b:,'gitsigns_status','')}"
		end
	},

	-- lualine
	{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			return require "configs.lualine"
		end,
	},
}
