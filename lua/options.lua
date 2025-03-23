vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.fillchars:append({ eob = " " })

vim.opt.conceallevel = 2

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.termguicolors = true

-- Desactiva netrw para evitar que interfiera
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

vim.opt.clipboard = "unnamedplus"

-- Configuración del portapapeles para Wayland con wl-clipboard
--[[vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy',
    ['*'] = 'wl-copy',
  },
  paste = {
    ['+'] = 'wl-paste',
    ['*'] = 'wl-paste',
  },
  cache_enabled = 0,
}]]
