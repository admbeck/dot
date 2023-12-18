--[[ KEYBINDINGS
   maps and remaps for vanilla
]]
-- rebind spellcheck to <leader>o for "orthography"
vim.keymap.set("", "<leader>o", ":setlocal spell<CR>",
{ desc = "Turn on spellcheck" })

-- check file in spellcheck:
vim.keymap.set("", "<leader>s", ":!clear && spellcheck -x %<CR>")

-- resizing windows with alt+h,j,k,l
vim.keymap.set("n", "<M-C-h>", "<C-w><", { desc = "Move left" })
vim.keymap.set("n", "<M-C-l>", "<C-w>>", { desc = "Move right" })
vim.keymap.set("n", "<M-C-j>", "<C-W>-", { desc = "Move down" })
vim.keymap.set("n", "<M-C-k>", "<C-W>+", { desc = "Move up" })

-- fast window switching
vim.keymap.set("n", "<M-h>", "<C-w>h", { desc = "Switch left" })
vim.keymap.set("n", "<M-l>", "<C-w>l", { desc = "Switch right" })
vim.keymap.set("n", "<M-j>", "<C-w>j", { desc = "Switch down" })
vim.keymap.set("n", "<M-k>", "<C-w>k", { desc = "Switch up" })

-- fast tabs switching
vim.keymap.set("n", "<C-h>", ":tabprevious<CR>",
{ silent = true, desc = "Switch to previous tab" })
vim.keymap.set("n", "<C-l>", ":tabnext<CR>",
{ silent = true, desc = "Switch to next tab" })
-- fast buffer switching
vim.keymap.set("n", "<C-j>", ":bprevious<CR>",
{ silent = true, desc = "Switch to previous buffer" })
vim.keymap.set("n", "<C-k>", ":bnext<CR>",
{ silent = true, desc = "Switch to next buffer" })

-- Bibliography in split view
vim.keymap.set("", "<leader>cb", ":vsp<space>$BIB<CR>",
{ desc = "Open bibliography" })
vim.keymap.set("", "<leader>cr", ":vsp<space>$REFER<CR>",
{ desc = "Open reference page" })

-- Toggle background transparency
vim.keymap.set("", "<leader>zr", ":hi Normal ctermbg=none guibg=none<CR>",
{ desc = "Toggle background transparency" })

-- when completion menu is shown, use <cr> to select an item
-- and do not add an annoying newline. Otherwise, <enter> is what it is.
vim.keymap.set("i", "<cr>", function()
  return vim.fn.pumvisible() == 1 and "<C-Y>" or "<cr>"
  end, {expr = true})
-- use <esc> to close auto-completion menu
vim.keymap.set("i", "<esc>", function()
  return vim.fn.pumvisible() == 1 and "<C-e>" or "<esc>"
  end, {expr = true})
-- use <tab> and Shift + <tab> to navigate down the completion menu.
vim.keymap.set("i", "<tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<tab>"
  end, {expr = true})
vim.keymap.set("i", "<S-tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-tab>"
  end, {expr = true})

-- toggle code mode
-- ToggleCoding()
vim.keymap.set("n", "<leader>zc", ":lua ToggleCoding()<CR>",
{ desc = "Toggle code mode" })

-- toggle statusline
-- ToggleHiddenAll()
vim.keymap.set("n", "<leader>zh", ":lua ToggleHiddenAll()<CR>",
{ desc = "Toggle statusline" })

-- compile document, be it groff/LaTeX/markdown/etc.
vim.keymap.set("", "<leader>cd", ":w! | !compiler '%:p'<CR>",
{ desc = "Compile document" })

-- open corresponding .pdf/.html or preview
vim.keymap.set("", "<leader>cp", ":!opout '%:p'<CR>",
{ desc = "Open compiled document" })
