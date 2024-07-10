return { -- venn.nvim: venn diagram drawer
  "jbyuki/venn.nvim",
  keys = {
    {
      "<leader>v",
      "",
      desc = "Venn",
    },
    {
      "<leader>vn",
      function()
        Toggle_venn_diag()
      end,
      noremap = true,
      desc = "Toggle venn mode",
    },
  },
  config = function()
    function _G.Toggle_venn_diag()
      local venn_enabled = vim.inspect(vim.b.venn_enabled)
      if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd([[setlocal ve=all]])
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", { noremap = true, desc = "Venn down" })
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", { noremap = true, desc = "Venn up" })
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", { noremap = true, desc = "Venn right" })
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", { noremap = true, desc = "Venn left" })
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", { noremap = true, desc = "Draw box" })
      else
        vim.cmd([[setlocal ve=]])
        vim.cmd([[mapclear <buffer>]])
        vim.b.venn_enabled = nil
      end
    end
  end,
}
