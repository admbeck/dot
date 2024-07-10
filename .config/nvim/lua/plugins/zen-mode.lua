return { -- zen-mode.nvim: zenmode
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    {
      "<leader>zz",
      "<cmd>ZenMode<CR>",
      desc = "Toggle Zenmode",
    },
    {
      "<leader>zp",
      "<cmd>set bg=light | set linebreak | lua require('zen-mode').toggle({window={width=.60,height=.80}})<CR>",
      desc = "Readable prose",
    },
  },
  opts = {
    window = {
      backdrop = 1,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      },
    },
  },
  init = function()
    local zenmodedefault = vim.api.nvim_create_augroup("zenmodedefault", { clear = true })
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = "/tmp/neomutt*",
      group = zenmodedefault,
      callback = function()
        vim.cmd([[set bg=light]])
        require("zen-mode").toggle()
        vim.keymap.set("", "ZZ", ":ZenMode|x!<CR>")
        vim.keymap.set("", "ZQ", ":ZenMode|q!<CR>")
      end,
    })
  end,
}
