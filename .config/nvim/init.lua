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
-- vim.g.mapleader = ';'
-- map leader to backspace for piantor_pro keyboard
-- vim.g.mapleader = vim.api.nvim_replace_termcodes('<space>', true, true, true)
-- vim.g.mapleader = ' ';
vim.g.mapleader = ';';

-- Startup Requires
-- Lazy Plugin Manager
-- Has to live here, autoload does not work for Lazy
require("lazy").setup({
	-- looks are everything
  'mhinz/vim-startify',
	{"neanias/everforest-nvim", branch = "main"},
	"NLKNguyen/papercolor-theme",
	-- editor
  "ggandor/leap.nvim",
	{"zbirenbaum/copilot.lua"},
	"neovim/nvim-lspconfig",
	"junegunn/vim-easy-align",
	"osyo-manga/vim-over",
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  },
	"tmsvg/pear-tree",
	"farmergreg/vim-lastplace",
	"tpope/vim-surround",
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>f",
        function()
          require("yazi").yazi()
        end,
        desc = "Open the file manager",
      },
      {
        -- Open in the current working directory
        "<c-f>",
        function()
          -- require("yazi").yazi(nil, vim.fn.getcwd())
          require("yazi").yazi(nil, vim.fn.expand('%'))
        end,
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- Open in the current git project root
        "<leader>f",
        function()
          local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
          if vim.v.shell_error ~= 0 then
            root = "%"
          end
          require("yazi").yazi(nil, root)
        end,
        desc = "Open the file manager in current git root" ,
      },
    },
    opts = {
      open_for_directories = false,
    },
  },
  "nvim-tree/nvim-web-devicons",
	{"lukas-reineke/indent-blankline.nvim", main = "ibl"},
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
	"nvim-treesitter/nvim-treesitter-textobjects",
	'kevinhwang91/nvim-bqf',
	-- tools
	{"junegunn/fzf", dir = "~/.fzf", build = "./install -all"},
	"junegunn/fzf.vim",
	"tpope/vim-fugitive",
  'MagicDuck/grug-far.nvim',
	{"nvim-pack/nvim-spectre", dependencies = "nvim-lua/plenary.nvim"},
	-- disabled
	{
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
    },
    enabled = false,
  },
	{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons', enabled = false},
  {'karb94/neoscroll.nvim', enabled = false},
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
