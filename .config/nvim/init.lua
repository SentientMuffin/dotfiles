vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
-- vim.g.mapleader = ';';
vim.keymap.set({''}, ' ', '<nop>', {desc = 'remove default behaviour of <space>'});
vim.g.mapleader = ';';
-- vim.g.maplocalleader = '^';

-- Startup Requires
-- Lazy Plugin Manager
-- Has to live here, autoload does not work for Lazy
require("lazy").setup({
	-- looks are everything
  'mhinz/vim-startify',
	{
    "neanias/everforest-nvim",
    branch = "main",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup({
        -- Your config here
        background = "hard",
      })
    end,
  },
  "rebelot/kanagawa.nvim",
	"NLKNguyen/papercolor-theme",
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
	-- editor
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/vim-vsnip", "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp" },
  },
  -- "ggandor/leap.nvim",
  {
    "folke/flash.nvim",
    lazy = false,
    opts = {
      search = {
        wrap = false,
      },
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    -- stylua: ignore
    keys = {
      -- { "<a-f>",     mode = { "n" }, function() require("flash").jump() end,              desc = "Flash" },
      -- { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      -- { "f",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      -- { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      -- { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
	{"zbirenbaum/copilot.lua"},
	"neovim/nvim-lspconfig",
	"junegunn/vim-easy-align",
	"osyo-manga/vim-over",
  "yioneko/nvim-vtsls",
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
      -- {
        -- "<leader>f",
        -- function()
          -- require("yazi").yazi()
        -- end,
        -- desc = "Open the file manager",
      -- },
      {
        -- Open in the current working directory
        -- "<leader>f",
        "<c-d>",
        function()
          -- require("yazi").yazi(nil, vim.fn.getcwd())
          require("yazi").yazi(nil, vim.fn.expand('%'))
        end,
        desc = "Open the file manager in nvim's working directory" ,
      },
      {
        -- Open in the current git project root
        "<leader>g",
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
  {
    -- grugfar
    'MagicDuck/grug-far.nvim',
    config = function()
      local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
      if vim.v.shell_error ~= 0 then
        root = "%"
      end
      -- doesn't work ???
      -- vim.g.maplocalleader = ' ';
      require('grug-far').setup({
        transient = true,
        startInInsertMode = true,
        searchOnInsertLeave = true,
        prefills = {
          paths = root,
          flags = '--hidden',
        },
        keymaps = {
          replace = { n = '<localleader>r' },
          qflist = { n = '<leader>q' },
          syncLocations = { n = '<localleader>s' },
          syncLine = { n = '<localleader>l' },
          close = { n = '<c-space>' },
          historyOpen = { n = '<localleader>t' },
          historyAdd = { n = '<localleader>a' },
          refresh = { n = '<localleader>f' },
          -- openLocation = { n = '<tab>' },
          openNextLocation = { n = '<down>' },
          openPrevLocation = { n = '<up>' },
          gotoLocation = { n = '<enter>' },
          pickHistoryEntry = { n = '<enter>' },
          abort = { n = '<localleader>b' },
          help = { n = 'g?' },
          toggleShowCommand = { n = '<leader>p' },
          swapEngine = { n = '<localleader>e' },
          previewLocation = { n = '<localleader>i' },
        },
        -- windowCreationCommand = 'tabnew % | vsplit',
        windowCreationCommand = 'only | vsplit',
      })
    end
  },
	-- disabled
})

require("pluginSetup")
require("vimSetup")
require("lsps")
Commentator = require("commentator")
require('keymaps')

-- Sets colors to line numbers Above, Current and Below  in this order
function LineNumberColors()
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#51B3EC', bold=true })
    vim.api.nvim_set_hl(0, 'LineNr', { fg='white', bold=true })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#FB508F', bold=true })
end

LineNumberColors()

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
