local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local autocmd = vim.api.nvim_create_autocmd

-- ======================================= TS LSP =======================================

require("lspconfig.configs").vtsls = require("vtsls").lspconfig -- set default server config, optional but recommended

-- If the lsp setup is taken over by other plugin, it is the same to call the counterpart setup function
lspconfig.vtsls.setup({
  root_dir = util.root_pattern(".git", "package.json"),
  single_file_support = false,
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 8192,
      },
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  },
})

-- ======================================================================================

-- ======================================= Golang LSP =======================================

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

-- ==========================================================================================

-- ======================================= LUA LSP =======================================

lspconfig.lua_ls.setup {
	root_dir = util.root_pattern(".git", ".zshrc"),
	settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      },
    },
  },
}

-- =======================================================================================

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
		vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<cr>', {desc = 'Show error/diagnostic from lsp'})
  end,
})
