--[[ CONFIGURATION
     neovim options and settings
]]
-- Deactivate inactive plugins
vim.g.did_install_default_menus = 1

-- leader key
vim.g.mapleader = ","

-- allow custom markdown
vim.g.markdown_recommended_style = 0

-- set window title
vim.opt.title = true

-- enable mouse support
vim.opt.mouse = "a"

-- systemwide clipboard support
vim.opt.clipboard = "unnamed,unnamedplus"

-- enable ruler and realtive numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- enable syntax highlighting
vim.opt.syntax = "enable"

-- turn off highlights when searching
vim.opt.hlsearch = false

-- maximum column to perform a search in
vim.bo.synmaxcol = 500

-- set concealement behavior
vim.wo.conceallevel = 2

-- splitting below and to the right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- enable incremental search
vim.opt.incsearch = true

-- minimum lines to keep above and below cursor when scrolling
vim.opt.scrolloff = 3

-- set spellfile for spelling
vim.opt.spelllang = "en_us,ru"
vim.opt.spellfile = "/home/beck/.config/nvim/spell/en.utf.add,     \z
           /home/beck/.config/nvim/spell/ru.utf.add"

-- change tabs to 4 spaces
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto-completion
vim.opt.wildmode = "longest,list,full"
vim.opt.completeopt = ""
vim.opt.wildmenu = true

-- settings for popup menu
vim.opt.pumheight = 15
if vim.opt.pumblend ~= nil then
  vim.opt.pumblend = 5
end

-- use back space to delete
vim.opt.backspace = "indent,eol,start"

-- do not use visual or error bells
vim.opt.visualbell = false
vim.opt.errorbells = false

-- code folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- disable auto-commenting on <CR>
local no_comments = vim.api.nvim_create_augroup("no_comments", {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  group = no_comments,
  desc = "remove automatic comment creation on new line",
  callback = function()
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("c", "")
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("r", "")
    vim.bo.formatoptions = vim.bo.formatoptions:gsub("o", "")
    end
})

-- ensure files are read as what I want
local reading_files = vim.api.nvim_create_augroup("reading_files", {clear = true})
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"/tmp/calcurse*", "~/.calcurse/notes"},
  group = reading_files,
  desc = "proper markdown identification",
  callback = function()
    vim.bo.filetype = "markdown"
    end
})
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = {"*.ms", "*.me", "*.mom", "*.man"},
  group = reading_files,
  desc = "proper groff identification",
  callback = function()
    vim.bo.filetype = "groff"
    end
})
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
  pattern = "*.tex",
  group = reading_files,
  desc = "proper latex identification",
  callback = function()
    vim.bo.filetype = "tex"
    end
})

-- autocompletion
vim.opt.completeopt = {"menu", "menuone", "noselect"}
vim.opt.omnifunc = "syntaxcomplete#Complete"

-- enables 24-bit RGB color in the TUI
if vim.o.termguicolors ~= nil then
  vim.o.termguicolors = true
end
