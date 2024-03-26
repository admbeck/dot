return { -- mkdnflow.nvim: vimwiki substitute
  "jakewvincent/mkdnflow.nvim",
  -- enabled = false,
  requires = {
    "hrsh7th/nvim-cmp",
  },
  ft = { "md", "rmd", "markdown" },
  config = function()
    local cmp = require("cmp")
    local cmp_config = cmp.get_config()
    table.insert(cmp_config.sources, {
      group_index = 1,
      name = "mkdnflow",
    })
    cmp.setup(cmp.get_config())

    local wk = require("which-key")
    wk.register({
      w = {
        name = "Wiki",
        p = "Create link from clipboard",
        n = "Update numbering",
        f = "Fold section",
        F = "Unfold section",
        i = {
          name = "Insert into table",
          r = "New Row ▼",
          R = "New Row ▲",
          c = "New Column ►",
          C = "New Column ◄",
        },
      },
    }, { prefix = "<leader>" })

    -- autosave markdown files
    vim.api.nvim_create_autocmd("FileType", {pattern = "markdown", command = "set awa"})

    require("mkdnflow").setup({
      modules = {
        folds = false,
        conceal = false,
        cmp = true,
      },
      perspective = {
        priority = "current",
        fallback = "first",
      },
      links = {
        transform_explicit = function(text)
          text = text:gsub("[ /]", "-")
          text = text:gsub("[:/]", "-")
          text = text:lower()
          return text
        end,
      },
      new_file_template = {
        use_template = true,
        template = "# {{title}}",
        placeholders = {
          before = {
            title = "link_title",
          },
        },
      },
      mappings = {
        MkdnFoldSection = { "n", "<leader>wf" },
        MkdnUnfoldSection = { "n", "<leader>wF" },
        MkdnUpdateNumbering = { "n", "<leader>wn" },
        MkdnTableNewRowBelow = { "n", "<leader>wir" },
        MkdnTableNewRowAbove = { "n", "<leader>wiR" },
        MkdnTableNewColAfter = { "n", "<leader>wic" },
        MkdnTableNewColBefore = { "n", "<leader>wiC" },
        MkdnCreateLinkFromClipboard = { { "n", "v" }, "<leader>wp" },
      },
    })
  end,
}
