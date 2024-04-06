-- Setup language servers.
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

lspconfig.tsserver.setup {}
lspconfig.gopls.setup {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	single_file_support = true,
}

-- Setup language client.
vim.api.nvim_create_autocmd('BufEnter', {
	pattern = {'*.ts', '*.tsx'},
	callback = function()
		vim.lsp.start({
			 name = 'tsserver',
			 cmd = {'typescript-language-server', '--stdio'},
			 root_dir = vim.fs.dirname(vim.fs.find({
				 '.git',
				 '.zshrc',
			 }, { upward = true })[1]),
		})
	end,
})

vim.api.nvim_create_autocmd('BufEnter', {
	pattern = {'*.go'},
	callback = function()
		vim.lsp.start({
			 name = 'gopls',
			 cmd = {'gopls'},
			 root_dir = vim.fs.dirname(vim.fs.find({
				 '.git',
				 '.zshrc',
				 'go.work',
				 'go.mod',
			 }, { upward = true })[1]),
		})
	end,
})

-- keymap
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
		vim.keymap.set('n', '<c-i>', vim.lsp.buf.hover, { buffer = args.buf })
		vim.notify('LSP attached!')
  end,
})
