local M = {}

local function load(plugin)
  table.insert(M, plugin)
end

local externalPlugins = require("externalPlugins")

-- themes
load(externalPlugins.everforest)
load("rebelot/kanagawa.nvim")
load("NLKNguyen/papercolor-theme")
load(externalPlugins.eldritch)
load(externalPlugins.tokyonight)

-- Plugins to modify UI
load("mhinz/vim-startify")

-- Editing plugins
load(externalPlugins.cmp)
load(externalPlugins.flash)

-- AI plugins
-- load("zbirenbaum/copilot.lua")
load(externalPlugins.windsurf)
-- Claude Code for NVIM
load(externalPlugins.claudeCode)


load("neovim/nvim-lspconfig")
load("junegunn/vim-easy-align")
load("osyo-manga/vim-over")
load("yioneko/nvim-vtsls")
load(externalPlugins.typescriptTools)
load("tmsvg/pear-tree")
load("farmergreg/vim-lastplace")
load("tpope/vim-surround")
-- load("t9md/vim-choosewin")
load(externalPlugins.yazi)
load({"lukas-reineke/indent-blankline.nvim", main = "ibl"})
load({"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"})
load("nvim-treesitter/nvim-treesitter-textobjects")
load("kevinhwang91/nvim-bqf")

-- Tools
load(externalPlugins.nvimWindow)
load(externalPlugins.vimChooseWin)
load({"junegunn/fzf", build = "fzf#install"})
load("junegunn/fzf.vim")
load("tpope/vim-fugitive")
load(externalPlugins.grugFar)
load(externalPlugins.diffView)

return M
