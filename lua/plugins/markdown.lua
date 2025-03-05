return {
  {
    --obsidian
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Walkin",
          path = "~/WalkIn/",
        },
      },
    },
    ui = { enable = true },
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = true,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },
  {

  }
}
