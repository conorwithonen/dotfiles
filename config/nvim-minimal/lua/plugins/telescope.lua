  return {
    {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>o', builtin.buffers, {})
    end
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      -- This is your opts table
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                -- even more opts
              }
            }
          }
        })
        require("telescope").load_extension("ui-select")
      end
    },
  }
