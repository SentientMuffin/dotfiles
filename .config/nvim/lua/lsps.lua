local autocmd = vim.api.nvim_create_autocmd
local lsp = vim.lsp

-- ======================================= TS LSP =======================================

-- Configure vtsls
vim.lsp.config['vtsls'] = require("vtsls").lspconfig
vim.lsp.config['vtsls'].root_markers = {"package.json", "tsconfig.json", ".git"}
vim.lsp.config['vtsls'].single_file_support = false
vim.lsp.config['vtsls'].filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' }
vim.lsp.config['vtsls'].settings = {
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
}
-- ======================================================================================

-- ======================================= Golang LSP =======================================

vim.lsp.config['gopls'] = {
	cmd = {"gopls"},
	filetypes = {"go", "gomod", "gowork", "gotmpl"},
	root_markers = {"go.mod", ".git"},
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

vim.lsp.config['lua_ls'] = {
	cmd = {"lua-language-server"},
	root_markers = {".zshrc", ".git"},
  single_file_support = false,
  filetypes = { 'lua' },
	settings = {
	   Lua = {
	     diagnostics = {
	       globals = {
	         'vim',
	         'require',
	       },
	     },
	     workspace = {
	       library = vim.api.nvim_get_runtime_file("", true),
	       checkThirdParty = false,
	     },
	     telemetry = {
	       enable = false,
	     },
	   },
	 },
}

-- =======================================================================================

-- keymap
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
    vim.keymap.set("n", "<leader>f", function() vim.diagnostic.jump({count=1, float=true}) end, {desc = "Jump to next diagnostic" })
    vim.keymap.set("n", "<leader>b", function() vim.diagnostic.jump({count=-1, float=true}) end, {desc = "Jump to previous diagnostic" })
  end,
})

-- ==================================== Haskell LSP ====================================

vim.lsp.config['hls'] = {
  cmd = {"haskell-language-server-wrapper", "--lsp"},
  root_markers = {".git"},
  single_file_support = false,
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

-- ======================================================================================

-- ==================================== Rust LSP ====================================

vim.lsp.config['rust_analyzer'] = {
  cmd = {"rust-analyzer"},
  root_markers = {"Cargo.toml", ".git"},
  single_file_support = false,
  filetypes = { 'rust' },
}

-- ======================================================================================

vim.lsp.enable({
  'vtsls',
  'lua_ls',
  'rust_analyzer',
  'gopls',
  'hls',
})
