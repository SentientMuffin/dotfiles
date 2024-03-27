call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'

"   - Nemovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Color Themes
" Plug 'sainnhe/everforest'
Plug 'neanias/everforest-nvim', { 'branch': 'main' }
Plug 'doums/darcula'
Plug 'NLKNguyen/papercolor-theme'
Plug 'prurigro/darkcloud-vimconfig'
Plug 'vim-airline/vim-airline-themes'

" On-demand loading
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
" Use release branch (recommend)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'osyo-manga/vim-over'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'tmsvg/pear-tree'
" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'farmergreg/vim-lastplace'
Plug 'yegappan/mru'
" Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'jparise/vim-graphql'
Plug 'vim-test/vim-test'

" firenvim, for chrome plugin
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" github copilot
Plug 'github/copilot.vim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

" Telescope, for file finder and more
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-pack/nvim-spectre'
Plug 'nvim-tree/nvim-web-devicons'

" Bundle of vim tools
Plug 'echasnovski/mini.nvim'

" project manager
" Vim Script
" Plug 'ahmedkhalf/project.nvim'

" indent blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" nvim treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LSPs & LSCs
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Initialize plugin system
call plug#end()

source ~/.vim/filetype.vim
let mapleader = ";"

" Autocmds
autocmd BufEnter * silent! lcd %:p:h
" open all folds
" autocmd BufReadPost,FileReadPost * normal zR
" disable foldexpr in vimrc
" autocmd BufEnter * if @% == '.vimrc' | set foldexpr=0 | else | set foldexpr=nvim_treesitter#foldexpr() | endif

" MacVim settings
autocmd! GUIEnter * set vb t_vb=
set guifont=Meslo\ LG\ S\ for\ Powerline:h15
set guioptions=
inoremap <C-Space> <ESC>l
vnoremap <C-Space> <ESC>
cnoremap <C-Space> <ESC><ESC>
noremap <C-Space> <ESC>

" General Functions
command RE call ReplaceFunction()
function ReplaceFunction ()
  execute 'OverCommandLine'
  execute '%s/'
endfunction

" General Config
colorscheme everforest
set number 
set background=dark
" set smartindent
set shell=zsh
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set noautochdir
set incsearch
set nohlsearch
set ignorecase
set smartcase
set autoread
set mps+=<:>
set foldmethod=expr
set clipboard+=unnamedplus
set guicursor+=a:blinkwait10-blinkon450-blinkoff40
set completeopt-=preview
" let g:startify_custom_header = [
      " \ "                   THIS IS ALL YOU NEED                      ",
      " \ ",---,---,---,---,---,---,---,---,---,---,---,---,---,-------,",
      " \ "|1/2| 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 0 | + | ' | <-    |",
      " \ "|---'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-----|",
      " \ "| ->| | Q | W | E | R | T | Y | U | I | O | P | ] | ^ |     |",
      " \ "|-----',--',--',--',--',--',--',--',--',--',--',--',--'|    |",
      " \ "| Caps | A | S | D | F | G | H | J | K | L | \ | [ | * |    |",
      " \ "|----,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'-,-'---'----|",
      " \ "|    | < | Z | X | C | V | B | N | M | , | . | - |          |",
      " \ "|----'-,-',--'--,'---'---'---'---'---'---'-,-'---',--,------|",
      " \ "| ctrl |  | alt |                          |altgr |  | ctrl |",
      " \ "'------'  '-----'--------------------------'------'  '------'",
      " \ ]
" let g:startify_lists = [
      " \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      " \ { 'type': 'files',     'header': ['   MRU']            },
      " \ ]
" let g:startify_bookmarks = [ 
      " \ {'L': '~/Documents/VTS/Repos/lane-next'},
      " \ {'A': '~/Documents/VTS/Repos/monorepo/app/activate/billing-payments/accounts'},
      " \ {'M': '~/Documents/VTS/Repos/monorepo/app/activate/billing-payments/money-movement'},
      " \ {'R': '~/Documents/VTS/Repos'}, 
      " \ {'v': '~/.vimrc'},
      " \ ]
" let g:startify_custom_indices = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']
let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : 'C',
      \ 'i'      : 'I',
      \ 'ic'     : 'Ic',
      \ 'ix'     : 'Ix',
      \ 'n'      : 'N',
      \ 'multi'  : 'M',
      \ 'ni'     : 'Ni',
      \ 'no'     : 'No',
      \ 'R'      : 'R',
      \ 'Rv'     : 'Rv',
      \ 's'      : 's',
      \ 'S'      : 'S',
      \ ''     : 'cS',
      \ 't'      : 'T',
      \ 'v'      : 'v',
      \ 'V'      : 'V',
      \ ''     : 'Vb',
      \ }
let g:airline_section_c = '%t'
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:incsearch#auto_nohlsearch = 1 
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#branch#format = 'ModifyBranchName'
  function! ModifyBranchName(name)
    let parts = split(a:name, "-")
    if len(parts) >= 2
      return join(parts[0:1], "-")
    endif
    " for part in parts
      " if part =~ '.*[0-9]\+'
        " return part
      " endif
    " endfor
    let length = strlen(a:name)
    if length <= 12
      return a:name
    endif
    return a:name[:12]
  endfunction
autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

let g:airline_symbols = {}
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_symbols.colnr = 'C:'
let g:airline#extensions#whitespace#enabled = 0
let g:javascript_plugin_jsdoc = 1
let g:over_enable_auto_nohlsearch = 1
let g:over_enable_cmd_window = 1
let g:over_command_line_prompt = "R> "
let g:over#command_line#substitute#replace_pattern_visually = 1
let g:over#command_line#search#enable_move_cursor = 1
let g:over#command_line#search#enable_incsearch = 1
let g:pear_tree_repeatable_expand = 0
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 50
" let g:coc_node_path = "/nix/store/4cl41407a5j0i6cl6c4yg1jagwgxbwcd-devshell-dir/bin/node"

" vim-go settings
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_doc_keywordprg_enabled = 1

" Required for operations modifying multiple buffers like rename.
set hidden
" Launch gopls when Go files are in use
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
  \ 'go': ['gopls'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'typescriptreact': ['typescript-language-server', '--stdio'],
\ }
autocmd FileType typescript setlocal omnifunc=LanguageClient#complete

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" vim-test config
let g:test#javascript#runner = 'jest'
let g:test#javascript#jest#options = '--config=/Users/xinjun.lin/Documents/VTS/repos/lane-next/jest.config.js'
" let test#strategy = {
  " \ 'nearest': 'wezterm',
  " \ 'file':    'wezterm',
  " \ 'suite':   'wezterm',
" \}
let test#strategy = 'basic'
let g:test#basic#start_normal = 1 " If using basic strategy

" note that if you are using Plug mapping you should not use `noremap` mappings.
nmap <F5> <Plug>(lcn-menu)
" Or map each action separately
nnoremap <silent> <C-i> :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>nc :call LanguageClient#textDocument_rename()<CR>

function DeleteBuffer()
  " if exists("g:NERDTree") && g:NERDTree.IsOpen()
    " exe :NERDTreeToggle
    " exe :NERDTreeToggle
    " :exe :normal \<C-w>h
  " else
    " exe :bd
  " endif

  if len(getbufinfo({'buflisted':1})) == 1 "&& expand('%:t') == \"\"
    exe ":bd"
    exe ":Startify"
  else
    exe ":bp | bd #"
  endif
endfunction

" Check ~/.vim/filetype.vim for comment based on filetypes
" Multi Line Comment Setup
function CommentLines()
  " match first nonWhiteSpace character 
  " then replace that character with comment + itself
  exe ":silent! s@\\(\\S\\)@".g:Comment."\\1@"
  exe ":silent! s@$@".g:EndComment."@"
endfunction
function UnCommentLines()
  exe ":silent! s@".g:Comment."@@"
  exe ":silent! s@$".g:EndComment."@@"
endfunction

" function ToggleSpectre()
  " let root = trim(system("git rev-parse --show-toplevel"))
  " if v:shell_error
    " let root = \"%\"
  " endif

  " let state = exe ":lua require('spectre.state').is_open"
  " if state.is_open
    " exe \":lua require('spectre').toggle()\"
  " else
    " exe \":Spectre \".root
  " endif
" endfunction


" General Config key remap

inoremap <Tab> <Tab>

" Redo .
nnoremap <leader>c .

" single line and multi-line comment
nnoremap <leader>e V:call CommentLines()<CR>
nnoremap <leader>r V:call UnCommentLines()<CR>
vnoremap <leader>e :call CommentLines()<CR>
vnoremap <leader>r :call UnCommentLines()<CR>

" NERDTree
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>` :NERDTreeClose<CR>:quit<CR>

" Spectre, Search and Replace
" nnoremap <leader>ss :call ToggleSpectre()<CR>

" vimrc shortcut
nnoremap <leader>v :e ~/.vimrc<CR>

" Change current working dir to open file
nnoremap <leader>d :cd %:p:h<CR>:pwd<CR>

" buffer operations
nnoremap <leader>q :call DeleteBuffer()<CR>
nnoremap <leader>z :ls<CR>
nnoremap <leader>aa :ls<CR>:b<Space>
nnoremap <leader>as :ls<CR>:sb<Space>
nnoremap <leader>av :ls<CR>:vert sb<Space>

" open and focus on terminal
nnoremap <leader>m :term<CR><C-w>Lclear<CR>

" open startify
nnoremap <leader>st :Startify<CR>

" copy filename to clipboard
nnoremap <leader>nnc :let @+ = expand("%:t")<cr>

" copy file directory to clipboard
nnoremap <leader>nfc :let @+ = expand("%:p:h")<cr>

" search and replace current line, or selected lines in visual mode
vnoremap <leader>sr :s/
nnoremap <leader>sr :%s/

" search and replace word on cursor
nnoremap <leader>wr yiw:%s/<C-r>"/
vnoremap <leader>wr y:%s/<C-r>"/

" git undo (single file, this current file the buffer is on)
nnoremap <leader>gu :Git checkout -- <C-r><C-g>

" git push
nnoremap <leader>gp :Git push<CR>

" git branch
nnoremap <leader>gc :Git branch<CR>

" git blame
nnoremap <leader>gb :Git blame<CR>

" git diff shortstat
nnoremap <leader>gd :Git diff --shortstat<CR>:res 1<CR><C-w>w

" Ag search
nnoremap <leader>ag :Ag<CR>

" previous buffer 
nnoremap <leader>6 <C-6>

nnoremap <leader>ac :cclose<CR>

" vim test shorcut
nnoremap <C-t>n :TestNearest<CR>
nnoremap <C-t>f :TestFile<CR>
nnoremap <C-t>s :TestSuite<CR>

" delete in insert mode
inoremap <C-e> <BS>

" untab in insert mode
inoremap <C-z> <C-d>

" Move left/right one character in insert mode
inoremap <C-d> <Left>
inoremap <C-f> <Right>

" enter in insert mode
inoremap <C-l> <CR>

" undo in insert mode
inoremap <C-u> <C-o>u

nnoremap t %
vnoremap t %

cnoremap <C-a> /g

" Macro recording with m
nnoremap m q
nnoremap K i<CR><ESC>k$

" previous and next word start
" nnoremap <Space>h ?\<<CR>:set hlsearch<CR>:noh<CR>
nnoremap <C-q> ?\<<CR>:noh<CR>
" nnoremap <Space>l /\<<CR>:set hlsearch<CR>:noh<CR>
nnoremap <C-p> /\<<CR>:noh<CR>

" jump up and down half a page
nnoremap <Space>k Hzz
noremap <Space>j Lzz
nnoremap Z zz

" center page on previous and next match
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" matches the previous alphanumeric character
" nnoremap <S-Tab> /\<<CR>h:noh<CR> 
" matches the next alphanumeric character
nnoremap <Tab> /\<<CR> 

" re-ordering text jump operations
nnoremap e E
nnoremap E e
vnoremap e E
vnoremap E e

" beginning and end of line
nnoremap # _
vnoremap # _
nnoremap $ g_
vnoremap $ g_

nnoremap q ge
vnoremap q ge
nnoremap Q gE
vnoremap Q gE

nnoremap zl za

nnoremap <C-f> :GFiles<CR>
nnoremap <C-a> :Ag<CR>

noremap <C-g> :Git<CR>

" Control n and m for coc scroll (Up and Down)
" inoremap <expr> <C-i> coc#pum#visible() ? coc#_select_confirm() : "\<C-i>"
" inoremap <expr> <C-i> coc#pum#visble() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> coc#pum#visble() ? "\<C-p>" : "\<S-Tab>"

inoremap <Bs> DELETE

" Control n: toggle search highlight
nnoremap <silent><expr> <C-n> (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" f for search
nnoremap f /
nnoremap F :nohl<CR>

" Next / Previous buffer
noremap <C-h> <ESC>:bp<CR>
noremap <C-l> <ESC>:bn<CR>

" Enter / Shift Enter: add line before / after the current line
" nnoremap " o<ESC>k
nnoremap " :call append(".", '')<CR>

" nnoremap ' O<ESC>j
nnoremap ' :call append(line(".")-1, '')<CR>

" Control s: save in normal and insert mode
noremap <C-s> <ESC>:w<CR>
inoremap <C-s> <ESC>:w<CR>

" " Control j: move to start of line in normal and insert mode
noremap <C-j> <ESC>^
inoremap <C-j> <ESC>I
" Control k: move to end of line in normal and insert mode
noremap <C-k> <ESC>$
inoremap <C-k> <ESC>A

" copilot settings
inoremap <silent><script><expr> <C-i> copilot#Accept("")
let g:copilot_no_tab_map = v:true
imap <A-d> <Plug>(copilot-dismiss)
imap <A-a> <Plug>(copilot-accept-word)
imap <A-l> <Plug>(copilot-accept-line)

" copilot chat settings
nnoremap <leader>d :CopilotChatToggle<CR>

" leave at the end of the file
" breaks text color otherwise

lua << EOF
--   require('telescope').load_extension('projects')
--   require'telescope'.extensions.projects.projects{}
--   require("project_nvim").setup {
--     -- your configuration comes here
--     -- or leave it empty to use the default settings
--     -- refer to the configuration section below
--     -- Manual mode doesn't automatically change your root directory, so you have
--     -- the option to manually do so using `:ProjectRoot` command.
--     manual_mode = false,
-- 
--     -- Methods of detecting the root directory. **"lsp"** uses the native neovim
--     -- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
--     -- order matters: if one is not detected, the other is used as fallback. You
--     -- can also delete or rearangne the detection methods.
--     detection_methods = { "lsp", "pattern" },
-- 
--     -- All the patterns used to detect root dir, when **"pattern"** is in
--     -- detection_methods
--     patterns = { ".git" },
--   }
EOF

lua << EOF
  local header_art = 
  [[
   ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
   │││├┤ │ │╰┐┌╯││││
   ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
  ]]

  -- using the mini plugins
  -- require('mini.sessions').setup({
  --   -- Whether to read latest session if Neovim opened without file arguments
  --   autoread = false,
  --   -- Whether to write current session before quitting Neovim
  --   autowrite = false,
  --   -- Directory where global sessions are stored (use `''` to disable)
  --   directory =  '~/.vim/sessions', --<"session" subdir of user data directory from |stdpath()|>,
  --   -- File for local session (use `''` to disable)
  --   file = '' -- 'Session.vim',
  -- })

  require("CopilotChat").setup({
    debug = false, -- Enable debugging
    -- See Configuration section for rest
  })

  local starter = require('mini.starter')
  starter.setup({
    -- evaluate_single = true,
    items = {
      starter.sections.recent_files(15, false, true),
      starter.sections.builtin_actions(),
    },
    content_hooks = {
      function(content)
        local blank_content_line = { { type = 'empty', string = '' } }
        local section_coords = starter.content_coords(content, 'section')
        -- Insert backwards to not affect coordinates
        for i = #section_coords, 1, -1 do
          table.insert(content, section_coords[i].line + 1, blank_content_line)
        end
        return content
      end,
      starter.gen_hook.adding_bullet("» "),
      starter.gen_hook.aligning('center', 'center'),
    },
    header = header_art,
    footer = '',
  })

  local root = string.gsub(vim.fn.system("git rev-parse --show-toplevel"), "\n", "")
  if vim.v.shell_error ~= 0 then
    root = vim.fn.getcwd()
  end

  -- require('spectre').open({
  --   cwd = root,
  -- })

  require("ibl").setup()
EOF
