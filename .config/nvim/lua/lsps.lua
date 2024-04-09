-- Setup language servers.
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local autocmd = vim.api.nvim_create_autocmd

lspconfig.tsserver.setup {
	cmd = {"typescript-language-server", "--stdio"},
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = util.root_pattern(".git"), -- for currrent work, it will always be a git repo
	single_file_support = false,
}

lspconfig.gopls.setup {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.mod", ".git"), -- for current work, it will always be a git repo
	single_file_support = false,
}
-- auto formatting on save
-- source: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#imports-and-formatting 
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

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
		vim.keymap.set('n', '<leader>se', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', {desc = 'Show error/diagnostic from lsp'})
		-- vim.notify('LSP attached!')
  end,
})
