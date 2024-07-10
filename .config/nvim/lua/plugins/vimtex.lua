return { -- vimtex: LaTeX syntax highlighting, TOC etc.
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = "0"
    vim.wo.conceallevel = 1
    vim.g.tex_conceal = "abdmg"
  end,
}
