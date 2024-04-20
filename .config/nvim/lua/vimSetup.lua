-- global vars for plugins
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.pear_tree_repeatable_expand = 0
vim.g.surround_no_mapping = 1

-- vim options
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shell = 'bash'
vim.opt.mps:append('<:>')
vim.opt.clipboard:append('unnamedplus')
vim.opt.guicursor:append('a:blinkwait10-blinkon450-blinkoff40')
vim.opt.completeopt:remove('preview')
vim.cmd.colorscheme('everforest')
vim.wo.fillchars='eob: '
-- vim.opt.guifont = 'Meslo LG S for Powerline:h15'

