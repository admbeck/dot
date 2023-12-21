return {
  { -- ChatGPT.nvim: chatGPT UI
    "jackMort/ChatGPT.nvim",
    cmd = { "ChatGPTActAs", "ChatGPT", "ChatGPTEditWithInstructions", "ChatGPTRun" },
    keys = {
      { "<leader>hc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
      {
        "<leader>he",
        "<cmd>ChatGPTEditWithInstruction<CR>",
        desc = "Edit with instruction",
        mode = { "n", "v" },
      },
      {
        "<leader>hg",
        "<cmd>ChatGPTRun grammar_correction<CR>",
        desc = "Grammar Correction",
        mode = { "n", "v" },
      },
      { "<leader>ht", "<cmd>ChatGPTRun translate<CR>", desc = "Translate", mode = { "n", "v" } },
      { "<leader>hk", "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords", mode = { "n", "v" } },
      { "<leader>hd", "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring", mode = { "n", "v" } },
      { "<leader>ha", "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests", mode = { "n", "v" } },
      { "<leader>ho", "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code", mode = { "n", "v" } },
      { "<leader>hs", "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize", mode = { "n", "v" } },
      { "<leader>hf", "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs", mode = { "n", "v" } },
      { "<leader>hx", "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code", mode = { "n", "v" } },
      { "<leader>hr", "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit", mode = { "n", "v" } },
      {
        "<leader>hl",
        "<cmd>ChatGPTRun code_readability_analysis<CR>",
        desc = "Code Readability Analysis",
        mode = { "n", "v" },
      },
    },
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "cat " .. os.getenv("SECRETPATH") .. "/chatgpt-key",
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  { -- glow.nvim: markdown previewer
    "ellisonleao/glow.nvim",
    cmd = "Glow",
    opts = {
      width_ratio = 0.9,
      height_ratio = 0.9,
    },
  },
  { -- venn.nvim: venn diagram drawer
    "jbyuki/venn.nvim",
    keys = {
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
  },
  { -- knap: latex/markdown previewer
    "frabjous/knap",
    keys = {
      {
        "<F5>",
        function()
          require("knap").process_once()
        end,
        desc = "Process document, refresh view",
      },
      {
        "<F6>",
        function()
          require("knap").close_viewer()
        end,
        desc = "Close the viewer",
      },
      {
        "<F7>",
        function()
          require("knap").toggle_autopreviewing()
        end,
        desc = "Toggle auto-processing",
      },
      {
        "<F8>",
        function()
          require("knap").forward_jump()
        end,
        desc = "Forward search",
      },
    },
    config = function()
      -- zathura
      local gknapsettings = {
        texoutputtext = "pdf",
        textopdfviewerlaunch = "zathura --synctex-editor-command 'nvim --headless -es --cmd \"lua require('\"'\"'knaphelper'\"'\"').relayjump('\"'\"'%servername%'\"'\"','\"'\"'%{input}'\"'\"',%{line},0)\"' %outputfile%",
        textopdfviewerrefresh = "none",
        textopdfforwardjump = "zathura --synctex-forward=%line%:%column%:%srcfile% %outputfile%",
        htmltohtml = 'A="/tmp/$(basename %outputfile%" ; B="${A%.html}-preview.html" ; sed \'s/<\\/head>/<meta http-equiv="refresh" content="1" ><\\/head>/\' "$A" > "$B"',
        htmltohtmlviewerlaunch = 'A="/tmp/$(%outputfile%" ; B="${A%.html}-preview.html" ; firefox "$B"',
        htmltohtmlviewerrefresh = "none",
        mdtohtml = 'A="/tmp/$(basename %outputfile%)" ; B="${A%.html}-preview.html" ; pandoc --standalone %docroot% -o "$A" && sed \'s/<\\/head>/<meta http-equiv="refresh" content="1" ><\\/head>/\' "$A" > "$B" ',
        mdtohtmlviewerlaunch = 'A="/tmp/$(basename %outputfile%)" ; firefox "${A%.html}-preview.html"',
      }
      vim.g.knap_settings = gknapsettings
    end,
  },
}
