set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set tabstop=2
set shiftwidth=2

" neovide settings
let g:neovide_input_use_logo = v:true
let g:neovide_cursor_animation_length = 0
let g:neovide_input_macos_alt_is_meta = v:true

" nnoremap <leader>ss <cmd>ToggleSpectre<CR>

lua << EOF
  require('nvim-treesitter.configs').setup {
    highlight = {
      disable = function(lang, buf)
        local fName = vim.api.nvim_buf_get_name(buf)
        -- local max_filesize = 100 * 1024 -- 100 KB
        return fName == ".vimrc"
      end,
    },
  }

  function ToggleSpectre()
    local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
    if vim.v.shell_error ~= 0 then
      root = "%"
    end

    local state = require('spectre.state')
    if state.is_open then
      require('spectre').toggle()
    else
      require('spectre').open({ cwd=root })
    end
  end

  vim.keymap.set('n', '<leader>ss', ToggleSpectre, { desc = "Toggle Spectre" })
EOF
