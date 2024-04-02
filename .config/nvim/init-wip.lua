-- Init setup for neovim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

-- ======================= Start: plugins =======================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- ======================= End: plugins   =======================

-- Make sure mapleader and maplocalleader is before requires
-- leaderkey
vim.g.mapleader = ';'

-- Startup Requires
require("lazy").setup({
	-- color themse
	{"neanias/everforest-nvim", branch = "main"},
	"NLKNguyen/papercolor-theme",
	-- styling
	"preservim/nerdtree",
	-- language styling
	"pangloss/vim-javascript",
	{"fatih/vim-go", build = "GoUpdateBinaries"},
	"jparise/vim-graphql",
	-- misc
	"junegunn/vim-easy-align",
	"osyo-manga/vim-over",
	"tmsvg/pear-tree",
	{"junegunn/fzf", dir = "~/.fzf", build = "./install -all"},
	"junegunn/fzf.vim",
	"tpope/vim-fugitive",
	"farmergreg/vim-lastplace",
	"tpope/vim-surround",
	"vim-test/vim-test",
	"nvim-lua/plenary.nvim",
	"nvim-pack/nvim-spectre",
  "nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{"lukas-reineke/indent-blankline.nvim", main = "ibl"},
	{"nvim-treesitter/nvim-treesitter", build = "TSUpdate"},
	{"autozimu/LanguageClient-neovim", branch = "next", build = "bash install.sh"},
	-- disabled
	{"yegappan/mru", enabled = false},
	{"vim-airline/vim-airline", enabled = false},
	{"vim-airline/vim-airline-themes", enabled = false},

}, opts) 

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
  vim.keymap.set("n", "i", api.tree.change_root_to_node, opts("In"))
end

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    side = "right",
    width = 40,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach,
})

require("mystatusline")
--

-- Auto commands
-- autocmd BufEnter * silent! lcd %:p:h
-- " open all folds
-- autocmd BufReadPost,FileReadPost * normal zR
-- " disable foldexpr in vimrc
-- autocmd BufEnter * if @% == '.vimrc' | set foldexpr=0 | else | set foldexpr=nvim_treesitter#foldexpr() | endif

-- vim options
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
-- vim.opt.guifont = 'Meslo LG S for Powerline:h15'
vim.opt.guioptions = ''
vim.opt.shell = 'zsh'
vim.opt.mps:append('<:>')
vim.opt.guicursor:append('a:blinkwait10-blinkon450-blinkoff40')
vim.opt.completeopt:remove('preview')

vim.cmd.colorscheme('everforest')

-- autocmds
-- reload config on save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = "**/.config/nvim/**/*.lua",
  callback = function()
    local filepath = vim.fn.expand("%")

    dofile(filepath)
    vim.notify("Configuration reloaded \n" ..      filepath, nil)
  end,
  group = mygroup,
  desc = "Reload config on save",
})

-- keymaps
vim.keymap.set({
  '', 'i', 'c',
}, '<c-space>', '<esc>', {desc = 'Escape'})

vim.keymap.set('n', '<leader>st', ToggleSectionB, {desc = 'Status Toggle'})
vim.keymap.set('n', '<leader>rl', '<cmd>luafile ~/.config/nvim/init.lua<cr>', {desc = 'Reload Nvim'})

vim.keymap.set('i', '<c-s>', '<esc><cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('', '<c-s>', '<cmd>write<cr>', {desc = 'Save'})

vim.keymap.set('n', '\'', ':call append(line(\'.\')-1, \'\')<cr>', {desc = 'Insert empty line above'}) 

vim.keymap.set('', '<c-j>', '_', {desc = 'Start of line'})
vim.keymap.set('i', '<c-j>', '<c-o>I', {desc = 'Start of line i'})

vim.keymap.set('', '<c-k>', 'g_', {desc = 'End of line'})
vim.keymap.set('i', '<c-k>', '<c-o>A', {desc = 'End of line i'})

vim.keymap.set('i', '<c-d>', '<left>', {desc = 'Input mode cursor left'})
vim.keymap.set('i', '<c-f>', '<right>', {desc = 'Input mode cursor right'})
vim.keymap.set('i', '<c-e>', '<BS>', {desc = 'Input mode delete'})

vim.keymap.set('n', 'f', '/', {desc = 'f for search'})

-- NvimTree keymaps
vim.keymap.set('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', {desc = 'Toggle NvimTree'})
vim.keymap.set('n', '<leader>f', '<cmd>NvimTreeFindFileToggle<cr>', {desc = 'Refresh NvimTree'})

-- Fugitive keymaps
vim.keymap.set('n', '<c-g>', '<cmd>Git<cr>', {desc = 'Git'})
