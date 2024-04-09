-- they were here, moved to vimSetup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.termguicolors = true

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
-- Lazy Plugin Manager
-- Has to live here, autoload does not work for Lazy
require("lazy").setup({
	-- color themse
	{"neanias/everforest-nvim", branch = "main"},
	"NLKNguyen/papercolor-theme",
	-- editor
	{"zbirenbaum/copilot.lua"},
	"neovim/nvim-lspconfig",
	"junegunn/vim-easy-align",
	"osyo-manga/vim-over",
	"tmsvg/pear-tree",
	"farmergreg/vim-lastplace",
	"tpope/vim-surround",
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	{"lukas-reineke/indent-blankline.nvim", main = "ibl"},
	{"nvim-treesitter/nvim-treesitter", build = "TSUpdate"},
	"nvim-treesitter/nvim-treesitter-textobjects",
	'kevinhwang91/nvim-bqf',
	-- tools
	{"junegunn/fzf", dir = "~/.fzf", build = "./install -all"},
	"junegunn/fzf.vim",
	"tpope/vim-fugitive",
	-- "nvim-lua/plenary.nvim", -- needed for spectre
	{"nvim-pack/nvim-spectre", dependencies = "nvim-lua/plenary.nvim"},
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
	-- disabled
	{"preservim/nerdtree", enabled = false},
	{"vim-test/vim-test", enabled = false},
	{"yegappan/mru", enabled = false},
	{"vim-airline/vim-airline", enabled = false},
	{"vim-airline/vim-airline-themes", enabled = false},
	{"fatih/vim-go", build = "GoUpdateBinaries", enabled = false},
 	{"autozimu/LanguageClient-neovim", branch = "next", build = "bash install.sh", enabled = false},
	{"pangloss/vim-javascript", enabled = false},
	{"jparise/vim-graphql", enabled = false},
}) -- can add }, opts)

require("pluginSetup")
require("vimSetup")
require("lsps")
Commentator = require("commentator")
require('keymaps')

-- autocmds
-- reload config on save
vim.api.nvim_create_autocmd('BufWritePost', {
	-- resourcing is not supported with lazy.nvim :(
  -- pattern = "**/.config/nvim/**/*.lua",
	pattern = "*.lua",
  callback = function()
    local filepath = vim.fn.expand("%")
    dofile(filepath)

		-- write via <c-s> is silent!
    -- vim.notify("[" .. filepath .. "]: Configuration reloaded", nil)
  end,
  -- group = mygroup,
  desc = "Reload config on save",
})
