return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  lazy = false,
  priority = 1000,
  config = function()
    local bonsai = {
          [[                                     &                            ]],
          [[                                 &&&&&&&                          ]],
          [[                               & &&&&&&&&                         ]],
          [[                              & &&&&&&&&&                         ]],
          [[                             && &&/&&&&~|\ &                      ]],
          [[                     &&      &   &  &&&&||/&&&&                   ]],
          [[                     && &&       &&//~ &/|\&&                     ]],
          [[                    & &&&&|     \| \|   |/ &                      ]],
          [[                       &  &_&&\|\ \_|/|/~                         ]],
          [[                       &  &&   \__|/|/~     &&&                   ]],
          [[                            &    /|/|\     &&&&                   ]],
          [[            & &               \| ||/~/     /&&&&                  ]],
          [[          &  && &&            _//|/  /_/___/&&&&&&                ]],
          [[            &&&&&_&|         &/|/~            &&&                 ]],
          [[             & &&&&\| &  &   \/~/~           &                    ]],
          [[                   &&&_&& &&&/~~||                                ]],
          [[                     & \__    \ /~\|                              ]],
          [[                        /|\_\__   \/~                             ]],
          [[                        \__      ///~                             ]],
          [[                   :___________./~~~\.___________:                ]],
          [[                    \                           /                 ]],
          [[                     \_________________________/                  ]],
          [[                     (_)                     (_)                  ]],
          [[                               ネオビム                           ]],
          [[                                                                  ]],

    }

    require('dashboard').setup {
      -- config
      theme = 'hyper',
      config = {
        header = bonsai, --your header
        packages = { enable = false },
        shortcut = {
        {
          desc = ' dotfiles',
          group = 'DiagnosticHint',
          -- action = 'Telescope dotfiles',
          action = function()
            vim.fn.chdir("~/dotfiles")
            vim.cmd("Telescope find_files")
            -- vim.notify("Now in: " .. vim.fn.getcwd())
          end,
          key = 'd',
        },
        {
          desc = ' Search CWD',
          group = 'DiagnosticHint',
          action = function()
            vim.cmd("Telescope find_files")
            -- vim.notify("Now in: " .. vim.fn.getcwd())
          end,
          key = 'f',
        },
        },
        project = { enable = false },
        mru = { enable = true, limit = 10, icon = ' ', label = 'Recent', cwd_only = false },
        footer = {},
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
