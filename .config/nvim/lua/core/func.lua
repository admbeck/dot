--[[ FUNCTIONS
     funcitons used in other config files
]]
-- turn on code mode
  local hidecoding = 0
  function _G.ToggleCoding()
    if hidecoding == 0 then
      hidecoding = 1
      vim.wo.cursorline = true
      vim.wo.colorcolumn = '80'
    else
      hidecoding = 0
      vim.wo.cursorline = false
      vim.wo.colorcolumn = ""
    end
  end

-- bottom statusbar toggle
  local hidden_all = 0
  function _G.ToggleHiddenAll()
    if hidden_all == 0 then
      hidden_all = 1
      vim.opt.laststatus = 0
    else
      hidden_all = 0
      vim.opt.laststatus = 3
    end
  end
