  return {
   "rebelot/kanagawa.nvim",
   name = "kanagawa",
   priority = 1000,
   lazy = false,

   config = function()
     require('kanagawa').setup({
       theme = 'wave',
       colors = {
         theme = { all = { ui = { bg_gutter = 'none' } }}
       }
     })
     vim.cmd("colorscheme kanagawa-wave")
   end
  }
  -- return {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd("colorscheme catppuccin")
  --   end
  -- }
