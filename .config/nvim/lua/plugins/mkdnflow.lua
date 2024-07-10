return { -- mkdnflow.nvim: vimwiki substitute
  "jakewvincent/mkdnflow.nvim",
  -- enabled = false,
  requires = {
    "hrsh7th/nvim-cmp",
  },
  ft = { "md", "rmd", "markdown" },
  keys = {
    {
      "<leader>w",
      "",
      desc = "Wiki",
    },
    {
      "<leader>wp",
      "<cmd>MkdnCreateLinkFromClipboard<CR>",
      desc = "Create link from clipboard",
    },
    {
      "<leader>wn",
      "<cmd>MkdnUpdateNumbering<CR>",
      desc = "Update numbering",
    },
    {
      "<leader>wf",
      "<cmd>MkdnFoldSection<CR>",
      desc = "Fold section",
    },
    {
      "<leader>wF",
      "<cmd>MkdnUnfoldSection<CR>",
      desc = "Unfold section",
    },
    {
      "<leader>wi",
      "",
      desc = "Insert into table",
    },
    {
      "<leader>wir",
      "<cmd>MkdnTableNewRowBelow<CR>",
      desc = "New Row ▼",
    },
    {
      "<leader>wiR",
      "<cmd>MkdnTableNewRowAbove<CR>",
      desc = "New Row ▲",
    },
    {
      "<leader>wic",
      "<cmd>MkdnTableNewColAfter<CR>",
      desc = "New Column ►",
    },
    {
      "<leader>wiC",
      "<cmd>MkdnTableNewColBefore<CR>",
      desc = "New Column ◄",
    },
  },
  config = function()
    local cmp = require("cmp")
    local cmp_config = cmp.get_config()
    table.insert(cmp_config.sources, {
      group_index = 1,
      name = "mkdnflow",
    })
    cmp.setup(cmp.get_config())

    -- autosave markdown files
    vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
    vim.api.nvim_create_autocmd("BufLeave", { pattern = "*.md", command = "silent! wall" })

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
