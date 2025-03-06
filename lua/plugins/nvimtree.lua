return {	
	{
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    opts = function()
      return require "configs.nvimtree"
    end,
  },
	{ "nvim-tree/nvim-web-devicons", opts = {} },
}
