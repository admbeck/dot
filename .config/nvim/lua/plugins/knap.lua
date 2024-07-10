return { -- knap: latex/markdown previewer
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
}
