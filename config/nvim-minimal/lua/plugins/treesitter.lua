  return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = {
            "vim",
            "vimdoc",
            "html",
            "css",
            "hcl",
            "terraform",
            "python",
            "javascript",
            "typescript",
            "json",
            "nginx",
            "yaml"
          },

          sync_install = false,
          highlight = { 
            enable = false,
            additional_vim_regex_highlighting = false,
            disable = { "terraform", "lua" }, 
          },
          indent = { enable = true },
        })
    end
  }
