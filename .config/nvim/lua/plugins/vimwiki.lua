return { -- local wiki
  "vimwiki/vimwiki",
  -- enabled = false,
  cmd = {
    "VimwikiIndex",
    "VimwikiTabIndex",
    "VimwikiMakeDiaryNote",
    "VimwikiTabMakeDiaryNote",
  },
  keys = {
    {
      "<leader>wz",
      "<Plug>VimwikiSplitLink",
      desc = "Open link in horizontal split",
    },
    {
      "<leader>wv",
      "<Plug>VimwikiVSplitLink",
      desc = "Open link in vertical split",
    },
    {
      "<leader>wl",
      "<Plug>VimwikiTabnewLink",
      desc = "Open link in new tab",
    },
    {
      "<leader>wu",
      "<cmd>call vimwiki#base#linkify()<CR>",
      desc = "Extract webpage title to markdown link"
    },
    {
      "<leader>ww",
      "<cmd>VimwikiIndex<CR>",
      desc = "Open vinwiki"
    },
  },
  init = function()
    local WIKIPATH = os.getenv("WIKIPATH")

    vim.g.vimwiki_ext2syntax = {
      [".md"]       = "markdown",
      [".Rmd"]      = "markdown",
      [".rmd"]      = "markdown",
      [".wiki"]     = "markdown",
      [".mdown"]    = "markdown",
      [".markdown"] = "markdown",
    }

    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_hl_headers = 1
    vim.g.vimwiki_hl_cb_checked = 1
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_folding = "expr"
    vim.g.vimwiki_conceal_pre = 1
    vim.g.vimwiki_auto_header = 1
    vim.g.vimwiki_toc_header = "contents"
    vim.g.vimwiki_root = WIKIPATH
    vim.g.vimwiki_filetypes = { "markdown" }
    vim.g.vimwiki_table_mappings = 0

    vim.g.vimwiki_list = {
      { -- MAIN
        name = "main",
        path = WIKIPATH,
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1
      },
      { -- EDUCATION
        name = "education",
        path = WIKIPATH .. "/edu",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1
      },
      { -- PERSONAL
        name = "personal",
        path = WIKIPATH .. "/personal",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1
      },
      { -- GAMES
        name = "games",
        path = WIKIPATH .. "/games",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- CREATIVE WRITING
        name = "campfire",
        path = WIKIPATH .. "/campfire",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- WORK
        name = "work",
        path = WIKIPATH .. "/work",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- TECH
        name = "tech",
        path = WIKIPATH .. "/tech",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- LINUX
        name = "linux",
        path = WIKIPATH .. "/tech/os/linux",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- WINDOWS
        name = "windows",
        path = WIKIPATH .. "/tech/os/windows",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- MAC
        name = "mac",
        path = WIKIPATH .. "/tech/os/mac",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- NETWORKS
        name = "networks",
        path = WIKIPATH .. "/tech/networks",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- CLOUD
        name = "cloud",
        path = WIKIPATH .. "/tech/cloud/",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      },
      { -- CODE
        name = "code",
        path = WIKIPATH .. "/tech/code",
        syntax = "markdown",
        ext = ".md",
        template_path = WIKIPATH .. "/template",
        template_default = "default",
        custom_wiki2html = "vimwiki_markdown",
        template_ext = ".tpl",
        links_space_char = "_",
        auto_diary_index = 1,
        auto_generate_link = 1,
        auto_generate_tags = 1,
      }
    }
  end
}
