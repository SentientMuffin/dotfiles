-- Setup language servers.
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lspconfig.tsserver.setup {
	cmd = {"typescript-language-server", "--stdio"},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = util.root_pattern("tsconfig.json", "package.json", "jsconfig.json", ".git"),
	single_file_support = true,
}

lspconfig.gopls.setup {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
}

lspconfig.lua_ls.setup {
	root_dir = util.root_pattern(".git", ".zshrc"),
	settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
    },
  },
}

-- Setup language client.
-- typescript lsp
-- vim.api.nvim_create_autocmd('BufEnter', {
	-- pattern = {'*.ts', '*.tsx'},
	-- callback = function()
		-- vim.lsp.start({
			 -- name = 'tsserver',
			 -- cmd = {'typescript-language-server', '--stdio'},
			 -- root_dir = vim.fs.dirname(vim.fs.find({
				 -- '.git',
				 -- '.zshrc',
			 -- }, { upward = true })[1]),
		-- })
	-- end,
-- })

-- golang lsp
-- vim.api.nvim_create_autocmd('BufEnter', {
	-- pattern = {'*.go'},
	-- callback = function()
		-- vim.lsp.start({
			 -- name = 'gopls',
			 -- cmd = {'gopls'},
			 -- root_dir = vim.fs.dirname(vim.fs.find({
				 -- '.git',
				 -- '.zshrc',
				 -- 'go.work',
				 -- 'go.mod',
			 -- }, { upward = true })[1]),
		-- })
	-- end,
-- })

-- lua lsp
-- this will double create?
-- vim.api.nvim_create_autocmd('BufEnter', {
	-- pattern = {'*.lua'},
	-- callback = function()
		-- vim.lsp.start({
			-- name = 'lua_ls',
			-- cmd = {'lua-language-server'},
			-- -- root_dir = vim.fs.dirname(vim.fs.find({
			  -- -- '.git',
				-- -- '.vimrc',
			-- -- }, { upward = true })[1]),
		-- })
	-- end,
-- })

-- keymap
local lsp = vim.lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
		vim.keymap.set('n', '<c-i>', lsp.buf.hover, {
			buffer = args.buf,
			desc = 'Open hover quickfix window',
		})
		vim.keymap.set('n', 'gr', lsp.buf.references, {
			buffer = args.buf,
			desc = 'Find references of symbol under cursor',
		})
		vim.keymap.set('n', 'gd', lsp.buf.definition, {
			buffer = args.buf,
			desc = 'Find definition of symbol under cursor',
		})
		vim.keymap.set('n', '<leader>i', lsp.buf.code_action, {
			buffer = args.buf,
			desc = 'Code action',
		})
		-- vim.notify('LSP attached!')
  end,
})
