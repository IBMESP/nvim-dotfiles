-- Eliminar autocmds de netrw si ya se cargaron antes
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("silent! autocmd! FileExplorer")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd("enew") -- Abre un buffer vacío al iniciar sin archivos
    end
  end,
})

require("configs.lazy")

require("options")
require("mappings")

