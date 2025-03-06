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
