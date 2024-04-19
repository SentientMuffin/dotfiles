-- Setup language servers.
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local autocmd = vim.api.nvim_create_autocmd

-- vim.lsp.log.set_level(vim.log.levels.DEBUG)
-- vim.lsp.set_log_level(vim.log.levels.DEBUG)

-- lspconfig.tsserver.setup {}
-- lspconfig.tsserver.setup {
	-- cmd = {"typescript-language-server", "--stdio"},
	-- filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	-- init_options = {
		-- hostInfo = "neovim",
	-- },
	-- root_dir = util.root_pattern(".git"), -- for currrent work, it will always be a git repo
  -- single_file_support = false,
-- }
require("typescript-tools").setup {
	cmd = {"typescript-language-server", "--stdio"},
	init_options = {
		hostInfo = "neovim",
	},
	root_dir = util.root_pattern(".git"), -- for currrent work, it will always be a git repo
  single_file_support = true,
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = {},
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    -- locale of all tsserver messages, supported locales you can find here:
    -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    tsserver_locale = "en",
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = false,
    include_completions_with_insert_text = false,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
  },
}

lspconfig.gopls.setup {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_dir = util.root_pattern("go.mod", ".git"), -- for current work, it will always be a git repo
	single_file_support = true,
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
