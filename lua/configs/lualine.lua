local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed
    }
  end
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    --component_separators = { left = '', right = ''},
    component_separators = { left = '', right =''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },

  sections = {
    lualine_a = { 
			{
				'mode', 
				fmt = function(str) 
					return " " .. str 
				end
			} 
		},
    lualine_b = { 
			{
				'filetype', 
				icon_only = true, 
				separator = '', 
				padding = { left = 1, right = 0 }
			}, 
			'filename' 
		},
    lualine_c = {
			{ 
				'branch',
				separator = '', 
				padding = { left = 1, right = 0 }
			}, 
			{'diff', source = diff_source}},
    lualine_x = {
			{
				'diagnostics',
				symbols = {
  				error = " ",
  				warn  = " ",
  				hint  = " ",
  				info  = " "
				}
			}
		},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
