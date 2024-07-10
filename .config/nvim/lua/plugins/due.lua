return { -- due.nvim: provides you due for the date string in <2035-01-10>
  "Nfrid/due.nvim",
  event = "VeryLazy",
  config = function()
    local autodue = vim.api.nvim_create_augroup("autodue", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWritePre" }, {
      pattern = "*",
      group = autodue,
      desc = "autorecount due",
      callback = function()
        require("due_nvim").redraw(0)
      end,
    })

    require("due_nvim").setup()
  end,
}
