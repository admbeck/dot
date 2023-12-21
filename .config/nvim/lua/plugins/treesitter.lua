return { -- nvim-treesitter: context-aware highlighting
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "comment",
        "cpp",
        "css",
        "csv",
        "dockerfile",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "htmldjango",
        "javascript",
        "json",
        "latex",
        "lua",
        "markdown",
        "markdown_inline",
        "perl",
        "python",
        "regex",
        "toml",
        "typescript",
        "vim",
        "yaml",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      highlight = {
        enable = true,
        -- "false" will disable the whole extension
        disable = {
          -- "markdown",
          -- "markdown_inline",
        },
      },
    })
  end,
}
