return {
  { -- startup screen
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require"alpha"
      -- default theme
      -- alpha.setup(require"alpha.themes.startify".config)
      -- dashboard theme
      local dashboard = require"alpha.themes.dashboard"
      local logo = [[
⠀⠀⣀⣤⣶⠾⠿⠿⠿⠿⢶⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣤⠾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠻⠷⣶⣤⣤⣤⣀⣀⣀⣀⣀
⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠉⠉⠉⠉
⠀⠀⣠⡾⢛⣽⣿⣿⣏⠙⠛⠻⠷⣦⣤⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⡀
⢠⣾⣋⡀⢸⣿⣿⣿⣿⠀⠀⢀⣀⣤⣽⡿⠿⠛⠿⠿⠷⠾⠿⠿⠛⠋
⠻⠛⠛⠻⣶⣽⣿⣿⣿⡶⠿⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣠⣿⡏⠻⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣶⠶⢶⣤⠀
⠀⠀⠀⠀⢹⣯⠁⠀⠈⠛⢷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠸⠧⠀⠀⢹⡇
⠀⠀⠀⠀⠈⣿⠀⠀⠀⠀⠀⠉⠻⠷⣦⣤⣤⣀⣀⣀⣀⣠⣤⡶⠟⠀
⠀⠀⠀⠀⠀⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀
]]
        dashboard.section.header.val = vim.split(logo, "\n")
        dashboard.section.buttons.val = {
          dashboard.button( "e", "  new" ,     ":ene <BAR> startinsert <CR>"),
          dashboard.button( "f", "󱁴  find",     ":cd $HOME | Telescope find_files<CR>"),
          dashboard.button( "w", "  word",     ":Telescope live_grep<CR>"),
          dashboard.button( "r", "  recent",   ":Telescope oldfiles<CR>"),
          dashboard.button( "g", "  branch",   ":Flog<CR>"),
          dashboard.button( "t", "  todo",     ":TodoTelescope keywords=TODO,FIX,BUG,FIXIT,ISSUE,FIXME,ERROR,WARNING,INFO,HINT,TEST,HACK,PERF,NOTE<CR>"),
          dashboard.button( "m", "󱌣  mason",    ":Mason<CR>"),
          dashboard.button( "s", "  settings",   ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
          dashboard.button( "q", "󰩈  quit",     ":qa<CR>"),
        }

      alpha.setup(dashboard.config)

      -- Disable folding on alpha buffer
      vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
  },
}
