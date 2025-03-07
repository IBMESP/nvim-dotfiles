return {
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
  }
}


