vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.fillchars:append({ eob = " " })

vim.opt.conceallevel = 2

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

--vim.opt.encoding = "utf-8"
--vim.opt.fileencoding = "utf-8"
