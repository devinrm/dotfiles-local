"  ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

call plug#begin('$HOME/.vim/bundle')

" === colorscheme(s) ===
Plug 'https://github.com/devinrm/necromancer.vim'
Plug 'https://github.com/devinrm/the-grey'

" === completion ===
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/neovim/nvim-lspconfig'
Plug 'https://github.com/nvim-lua/completion-nvim'
Plug 'https://github.com/steelsojka/completion-buffers'
Plug 'https://github.com/kristijanhusak/completion-tags'

" === experiments ===
Plug 'https://github.com/stefandtw/quickfix-reflector.vim'
" Plug 'https://github.com/nvim-treesitter/nvim-treesitter'

" === find ===
Plug 'https://github.com/junegunn/fzf', { 'dir': '$HOME/.fzf', 'do': './install --bin' }
Plug 'https://github.com/junegunn/fzf.vim'

" === git ===
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/junegunn/gv.vim'

" === language plugins ===
Plug 'https://github.com/hail2u/vim-css3-syntax'
Plug 'https://github.com/iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'https://github.com/maxmellon/vim-jsx-pretty'
Plug 'https://github.com/HerringtonDarkholme/yats.vim'
Plug 'https://github.com/othree/html5.vim'
Plug 'https://github.com/yuezk/vim-js'
Plug 'https://github.com/rust-lang/rust.vim'

" === other ===
Plug 'https://github.com/ap/vim-css-color', { 'for': 'css' }
Plug 'https://github.com/rhysd/devdocs.vim'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/tweekmonster/startuptime.vim'
Plug 'https://github.com/RRethy/vim-illuminate'
Plug 'https://github.com/janko-m/vim-test'
Plug 'https://github.com/romainl/vim-cool'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/tpope/vim-rsi'

call plug#end()

"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

set autoread
set backspace=2 " Backspace deletes like most programs in insert mode
set backupcopy=yes
set clipboard^=unnamedplus " copy paste to system clipboard
set colorcolumn=+1 " highlight column after 'textwidth'
set termguicolors " nvim gui colors
set background=dark " Use colors that look good on a dark background
colorscheme grey
set cursorline
let s:darwin = has('mac')
set diffopt+=vertical " Start diff mode with vertical splits
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
filetype plugin indent on " load indent file for language
filetype plugin on
set formatprg=fmt
set gdefault " Replace all matches on a line instead of just the first
set grepprg=rg\ --vimgrep\ --no-heading
set grepformat=%f:%l:%c:%m,%f:%l:%m
set guicursor+=a:blinkon0 " Disable blinking cursor on nvim
set history=50 " remember the last 50 command-lines in the history table
set hlsearch " highlight search results
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
set incsearch " do incremental searching
set ignorecase " case insensitive pattern matching
if has('nvim')
  set inccommand=split " this is necessary for using this %s with a quickfix window in nvim
  set pumblend=20
endif
set laststatus=2
set lazyredraw
let g:is_posix=1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
let g:mapleader = ' ' " Set Leader key to <Space> bar
runtime! macros/matchit.vim " Extended matching with '%'. See :help matchit
set matchtime=0 " Speed up escape after (){} chars
set mouse=a " Enable mouse for pair programming
set nobackup " Don't make a backup before overwriting a file
set nofoldenable " Leave open all folds
set nojoinspaces " Insert one space after a '.', '?' and '!' with a join command.
set noshowmode " If in Insert, Replace or Visual mode don't put a message on the last line.
set noswapfile " Do not create a swapfile for a new buffer.
set nowrap " Don't wrap lines longer than the width of the window
set nowritebackup " Don't make a backup before overwriting a file.
set number " Turn on line numbers
set numberwidth=1 " Minimal number of columns to use for the line number.
set path+=.,,
set path+=.,app/javascript,node_modules
set suffixesadd=.js,.jsx,.ts,.tsx
set redrawtime=1000 " Stop highlighting if it takes more than a second
set ruler " show the cursor position all the time
set scrolloff=3 " show 5 lines above and below cursor
scriptencoding utf-8 " Specify the character encoding used in the script.
if s:darwin
  set shell=/usr/local/bin/zsh
endif
set shiftround " Round indent to multiple of 'shiftwidth'.
set shiftwidth=2 " Returns the effective value of 'shiftwidth'
set showcmd " display incomplete commands
set showtabline=2
set signcolumn=yes " Leave signcolumn enabled otherwise it's a little jarring
set smartcase " overrides ignorecase if pattern contains upcase
set spellfile=$HOME/.vim-spell-en.utf-8.add " Name of the word list file where words are added for the |zg| and |zw| commands.
set spelllang=en_us " Set region to US English
set splitbelow " When on, splitting a window will put the new window below the current one.
set splitright " When on, splitting a window will put the new window right of the current one.
syntax on " Turn on syntax highlighting. This must come before statusline
set statusline=
set statusline+=%3*\ %L
set statusline+=\ %*
set statusline+=%1*\█▓░
set statusline+=%1*\ %f\ %*
set statusline+=%3*\░
set statusline+=%3*\ %{StatusGit()}
set statusline+=%3*\ %{StatusGitGutter()}
set statusline+=%3*\ ░
set statusline+=%3*\ %{StatusErrors()}
set statusline+=%3*\ ░
set statusline+=%3*\ %y%*%*
set statusline+=%3*\ ░
set statusline+=%3*\ %P
set statusline+=%3*\ █▓░
set synmaxcol=200
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
" set textwidth=100 " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set ttimeout " determine the behavior when part of a key code sequence has been received by the terminal UI.
set undodir=$HOME/.undodir " directory name for undo file.
set undofile " Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
set undolevels=500
set undoreload=500
set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildoptions=pum
set wildmode=list:longest,list:full

"  ____ ____ ____ ____ ____ ____  ____ ____ ___
" ||f |||u |||n |||c |||t |||i |||o |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler.
augroup vimrcEx
  autocmd!
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
augroup END

" Make comments italic
augroup ItalicComments
  autocmd!
  autocmd ColorScheme * highlight Comment gui=italic
  autocmd ColorScheme * highlight Comment cterm=italic
augroup END

" Trim trailing whitespace and extra lines
function! s:TrimTrailingWhitespace()
  let l:pos = getpos('.')
  %s/\s\+$//e
  call setpos('.', l:pos)
endfunction

function! s:TrimBlankLines()
  let l:pos = getpos('.')
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', l:pos)
endfunction

augroup vimTrim
  autocmd!
  autocmd BufWritePre * call s:TrimTrailingWhitespace()
  autocmd BufWritePre * call s:TrimBlankLines()
augroup END

" === statusline ===
function! StatusGit() abort
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! StatusErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '' : printf('• %d', l:counts.total)
endfunction

function! StatusGitGutter() abort
  if !exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let l:symbols = [
        \ g:gitgutter_sign_added . '',
        \ g:gitgutter_sign_modified . '',
        \ g:gitgutter_sign_removed . ''
        \ ]
  let l:hunks = GitGutterGetHunkSummary()
  let l:ret = []
  for l:i in [0, 1, 2]
    if l:hunks[l:i] > 0
      call add(l:ret, l:symbols[l:i] . l:hunks[l:i])
    endif
  endfor
  return join(l:ret, ' ')
endfunction

augroup highlight_yank
  autocmd!
  au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=1000, on_visual=false}
augroup END

"  ____ ____ ____ ____ ____ ____   ____ ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n || ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|| ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\| |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" === ale ===
let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'erb': ['erubi'],
      \ 'html': ['tidy', 'htmlhint'],
      \ 'javascript': ['eslint'],
      \ 'javascriptreact': ['eslint'],
      \ 'typescript': ['eslint'],
      \ 'typescriptreact': ['eslint'],
      \ 'ruby': ['ruby', 'rubocop', 'rails_best_practices', 'brakeman'],
      \ 'scss': ['stylelint'],
      \ 'vim': ['vint']
      \ }

let g:ale_fixers = {
      \ 'css': ['stylelint'],
      \ 'html': ['prettier'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'javascriptreact': ['prettier', 'eslint'],
      \ 'typescriptreact': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'eslint'],
      \ 'json': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'scss': ['stylelint'],
      \ 'sh': ['shfmt'],
      \ 'yaml': ['prettier']
      \ }

" Do not lint or fix minified files.
let g:ale_pattern_options = {
      \ '\.min\.css$': {'ale_enabled': 0},
      \ '\.min\.js$': {'ale_enabled': 0},
      \}

let g:ale_javascript_prettier_eslint_options = '--single-quote --trailing-comma all --print-width 100 --arrow-parens always'
let g:ale_disable_lsp = 1
let g:ale_set_quickfix = 0
let g:ale_sign_warning = '•'
let g:ale_sign_error = '•'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'

nmap <silent><Leader>f <Plug>(ale_fix)
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" === nvim-lsp ===
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.solargraph.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}

nnoremap <silent>gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>ge <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gh <cmd>lua vim.lsp.buf.hover()<CR>

" === completion-nvim ===
autocmd BufEnter * lua require'completion'.on_attach()
au Filetype lua setl omnifunc=v:lua.vim.lsp.omnifunc

" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy', 'all']
let g:completion_chain_complete_list = {
  \ 'default': [
  \    {'complete_items': ['lsp']},
  \    {'complete_items': ['buffers']},
  \    {'complete_items': ['tags']}
  \  ]}
let g:completion_matching_smart_case = 1

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

set completeopt=menuone,noinsert,noselect
set noinfercase
set pumheight=10
set shortmess+=c

" === commmentary ===
nnoremap <C-\> :Commentary<CR>
xnoremap <C-\> :Commentary<CR>

" === vim-cool ===
let g:CoolTotalMatches = 1

" === devdocs ===
nmap <silent> K <Plug>(devdocs-under-cursor)

" === fzf.vim ===
nnoremap <C-p> :wa<CR>:Files<CR>
nnoremap <C-t> :wa<CR>:Tags<CR>
nnoremap <C-b> :wa<CR>:Buffers<CR>
nnoremap <Leader>p :BLines<CR>
nnoremap <Leader>gc :wa<CR>:Commits<CR>
nnoremap <Leader>hi :wa<CR>:History<CR>

" match fzf colors to colorscheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Exception'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" You can pass rg arguments like so: :Rg -F components -g '*jsx'
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --smart-case --color=always '.(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Pass commands to ag by using :Ag command i.e. :Ag --js components
function! s:fzf_ag_raw(cmd)
  call fzf#vim#ag_raw('--noheading '. a:cmd)
endfunction
augroup ag_commands_with_fzf
  autocmd! VimEnter * command! -nargs=* -complete=file Ag :call s:fzf_ag_raw(<q-args>)
augroup END

nnoremap \ :Rg<SPACE>-F '' -g '*.'
" grep the word under the cursor
nnoremap gr :Rg <C-R><C-W><CR>

" Press ; and then start typing to fzf search the whole project for a word or
" string
command! -bang -nargs=* Fg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap <Leader>; :Fg<CR>

function! FloatingFZF(width, height, border_highlight)
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  " Size and position
  let width = float2nr(&columns * a:width)
  let height = float2nr(&lines * a:height)
  let row = float2nr((&lines - height) / 2)
  let col = float2nr((&columns - width) / 2)

  " Border
  let top = '╭' . repeat('─', width - 2) . '╮'
  let mid = '│' . repeat(' ', width - 2) . '│'
  let bot = '╰' . repeat('─', width - 2) . '╯'
  let border = [top] + repeat([mid], height - 2) + [bot]

  " Draw frame
  let s:frame = s:create_float(a:border_highlight, {'row': row, 'col': col, 'width': width, 'height': height})
  call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

  " Draw viewport
  call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
  autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF(0.9, 0.6, "Comment")' }

" === vim-gitgutter ===
let g:gitgutter_signs = 0
let g:gitgutter_max_signs = 500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
augroup LeGit
  autocmd!
  autocmd BufWritePost * GitGutter
augroup END

" === vim-illuminate ===
let g:Illuminate_delay = 50
hi illuminatedWord guibg=#2c323c gui=NONE

" === netrw ===
let g:netrw_browse_split = 4
let g:netrw_preview = 1
let g:netrw_banner = 0
let g:netrw_liststyle = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0

" === vim-ruby ===
let ruby_no_expensive = 1

" === vim-test ===
function! NeoSplit(cmd) abort
  let opts = {'suffix': ' # vim-test'}
  function! opts.close_terminal()
    if bufnr(self.suffix) != -1
      execute 'bdelete!' bufnr(self.suffix)
    end
  endfunction

  call opts.close_terminal()

  split new
  call termopen(a:cmd . opts.suffix, opts)
  au BufDelete <buffer> wincmd p
  stopinsert
endfunction

let g:test#custom_strategies = {'neosplit': function('NeoSplit')}
let g:test#strategy = 'neosplit'
let g:test#runner_commands = ['Jest', 'RSpec']

" update jest snapshots with vim-test
nnoremap <Leader>u :Jest <C-r>=escape(expand("%"), ' ') . ' ' . '--updateSnapshot'<CR><CR>

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" === treesitter ===
" lua <<EOF
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "all",
"   highlight = { enable = true }
" }
" EOF

"  ____ ____ ____ ____
" ||m |||a |||p |||s ||
" ||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|

" === automatically rebalance windows on vim resize ===
augroup resize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

inoremap jk <esc>

" === zoom a vim pane, <C-w>= to re-balance ===
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

" === debugging ===
let g:loaded_pry = 1
let g:debug_map = {
      \ 'ruby' : 'require "pry"; binding.pry',
      \ 'javascript' : 'debugger;',
      \ 'typescript' : 'debugger;',
      \ 'javascriptreact' : 'debugger;',
      \ 'typescriptreact' : 'debugger;',
      \}

function! InsertDebug()
  if has_key(g:debug_map, &filetype)
    let text = get(g:debug_map, &filetype)
    call feedkeys('o', 'i')
    call feedkeys(text)
    call feedkeys("\<Esc>")
  endif
endfunction

nnoremap <Leader>d :call InsertDebug()<CR>

function! InsertReact()
    call feedkeys('i')
    call feedkeys("import ComponentName from 'apps/ComponentName/ComponentName';")
    call feedkeys("\n")
    call feedkeys("\n")
    call feedkeys("import { mountComponent } from 'utils/reactHelper';")
    call feedkeys("\n")
    call feedkeys("\n")
    call feedkeys("mountComponent(ComponentName, 'ComponentName');")
    call feedkeys("\<Esc>")
endfunction

nnoremap <Leader>qq :call InsertReact()<CR>

" === console.log word or function under cursor ===
nnoremap <Leader>co ct;console.log(<C-r>")<Esc>

" === terminal mappings ===
if has('nvim')
  augroup TerminalNumbers
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END

  augroup TerminalExitStatus
    autocmd!
    autocmd TermClose * call feedkeys("\<CR>")
  augroup END
endif

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l
tnoremap <Esc> <C-\><C-n>
tnoremap <A-[> <Esc><Esc>

tnoremap <C-w>- <C-\><C-n>:sp<CR>:terminal<CR>
tnoremap <C-w>\ <C-\><C-n>:vsp<CR>:terminal<CR>
nnoremap <C-w>- :20sp<CR>:terminal<CR>
nnoremap <C-w>\ :vsp<CR>:terminal<CR>
nnoremap <C-w>c :tabnew<CR>:terminal<CR>

" === Move up and down by visible lines if current line is wrapped ===
nnoremap j gj
nnoremap k gk

" === add current word under cursor to :%s ===
nnoremap <Leader>n :%s/\(<c-r>=expand("<cword>")<CR>\)/

" === Make it easier to run js files inside vim ===
nnoremap <Leader>js :12sp<CR>:terminal node %<CR>

" === Make it easier to run ruby files inside vim ===
nnoremap <Leader>rb :12sp<CR>:terminal ruby -w %<CR>

" === Make it easier to run typescript files inside vim ===
nnoremap <Leader>c :12sp<CR>:terminal tsc %<CR>

" === Edit the db/schema.rb Rails file in a split ===
nnoremap <Leader>sc :vsplit db/schema.rb<CR>

" === Show syntax highlighting groups for word under cursor, useful for editing
" colorschemes (from @drewneil) ===
nnoremap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack() abort
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), "synIDattr(v:val, 'name')")
endfunc

" === notes ===
nnoremap <Leader>ww :tabe <C-r>=expand("$HOME/dotfiles/laptop/vim_notes/")<CR><C-d>

" === Pre-populate a split command with the current directory ===
nnoremap <Leader>e :vsp <C-r>=expand("%:p:h") . "/" <CR><C-d>
nnoremap <Leader>mv :!mv % <C-r>=expand("%:p:h") . "/" <CR><C-d>

" === Open vimrc in new tab ===
nnoremap <Leader>vi :tabe $MYVIMRC<CR>
