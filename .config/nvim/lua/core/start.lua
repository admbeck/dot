--[[ STARTUP OPTIONS
   settings for optimizing startup
]]
-- turn on providers manually to save time
vim.g.python_host_skip_check = 1
if vim.fn.executable('python2') == 1 then
  vim.g.python_host_prog = vim.fn.exepath('python2')
else
  vim.g.loaded_python_provider = 0
end

vim.g.python3_host_skip_check = 1
if vim.fn.executable('python3') == 1 then
  vim.g.python3_host_prog = vim.fn.exepath('python3')
else
  vim.g.loaded_python3_provider = 0
end

if vim.fn.executable('neovim-node-host') == 1 then
  vim.g.node_host_prog = vim.fn.exepath('neovim-node-host')
else
  vim.g.loaded_node_provider = 0
end

if vim.fn.executable('neovim-ruby-host') == 1 then
  vim.g.ruby_host_prog = vim.fn.exepath('neovim-ruby-host')
else
  vim.g.loaded_ruby_provider = 0
end

if vim.fn.executable('perl') == 1 then
  vim.g.perl_host_prog = vim.fn.exepath('perl')
else
  vim.g.loaded_perl_provider = 0
end
