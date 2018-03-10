"  ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

call plug#begin('~/.vim/bundle')

" === colorscheme(s) ===
Plug 'thiagoalessio/rainbow_levels.vim'
Plug 'xero/sourcerer.vim'

" === completion ===
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'calebeby/ncm-css'
  Plug 'roxma/nvim-cm-tern',  { 'do': 'npm install' }
  Plug 'roxma/nvim-completion-manager', { 'do': 'pip3 install neovim psutil setproctitle' }
  Plug 'uplus/deoplete-solargraph'
endif

" === experiments ===
Plug 'AndrewRadev/splitjoin.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'

" === git ===
Plug 'airblade/vim-gitgutter'

" === language plugins ===
function! BuildComposer(info) abort
  if a:info.status !=? 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
Plug 'Keithbsmiley/rspec.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" === linting ===
Plug 'w0rp/ale'

" === make editing nicer ===
Plug 'derekprior/vim-trimmer'
Plug 'janko-m/vim-test'
Plug 'justinmk/vim-highlightedyank'
Plug 'pbrisbin/vim-mkdir'
Plug 'rstacruz/vim-closer'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'

" === move ===
Plug 'christoomey/vim-tmux-navigator'

" === other ===
Plug 'AndrewRadev/switch.vim'
Plug 'alvan/vim-closetag'
Plug 'bergercookie/vim-debugstring'
Plug 'chrisbra/Colorizer'
Plug 'itchyny/lightline.vim'
Plug 'radenling/vim-dispatch-neovim'
Plug 'stefanoverna/vim-i18n'
Plug 'sunaku/vim-dasht'
Plug 'tpope/vim-dispatch'

" === search ===
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'

call plug#end()

"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

let s:darwin = has('mac')

set autoread " Automatically read file if it has been changed outside of vim
set backspace=2 " Backspace deletes like most programs in insert mode
set background=dark " Use colors that look good on a dark background
set clipboard=unnamedplus " copy paste to system clipboard
set colorcolumn=+1 " highlight column after 'textwidth'
colorscheme sourcerer
set complete+=kspell " Set the matches for Insert mode completion.
set diffopt+=vertical " Start diff mode with vertical splits
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
filetype plugin indent on " load indent file for language
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set formatprg=par
set gdefault " Replace all matches on a line instead of just the first
set guicursor+=a:blinkon0 " Disable blinking cursor on nvim
set history=50 " remember the last 50 command-lines in the history table
set hlsearch " highlight search results
let g:html_indent_tags = 'li\|p' " Treat <li> and <p> tags like the block tags they are
set incsearch " do incremental searching
set ignorecase " case insensitive pattern matching
if has('nvim')
  set inccommand=split " this is necessary for using this %s with a quickfix window in nvim
endif
set lazyredraw
set termguicolors " nvim gui colors
let g:is_posix=1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
set laststatus=2 " Always display the status line
let g:python_host_prog = $HOME.'/.asdf/shims/python2'
let g:python3_host_prog = $HOME.'/.asdf/shims/python3'
set list listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
let g:mapleader = ' ' " Set Leader key to <Space> bar
set matchtime=0 " Speed up escape after (){} chars
set mouse=a " Turn mouse on
set nobackup " Don't make a backup before overwriting a file
set nofoldenable " Leave open all folds
set nojoinspaces " Insert one space after a '.', '?' and '!' with a join command.
set noshowmode " If in Insert, Replace or Visual mode don't put a message on the last line.
set noswapfile " Do not create a swapfile for a new buffer.
set nowrap " Don't wrap lines longer than the width of the window
set nowritebackup " Don't make a backup before overwriting a file.
set number " Turn on line numbers
set numberwidth=1 " Minimal number of columns to use for the line number.
set redrawtime=1000 " Stop highlighting if it takes more than a second
set relativenumber " Show the line number relative to the line with the cursor in front of each line.
augroup numbers
  autocmd!
  " === Toggle relative line number for yanking, i.e. :6y ===
  " autocmd CmdlineEnter * set norelativenumber | redraw
  " autocmd CmdlineLeave * set relativenumber
  " === Get the best of both worlds with set number and relativenumber ===
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
set ruler " show the cursor position all the time
runtime! macros/matchit.vim " Extended matching with '%'. See :help matchit
set scrolloff=3 " show 5 lines above and below cursor
scriptencoding utf-8 " Specify the character encoding used in the script.
set shiftround " Round indent to multiple of 'shiftwidth'.
set shiftwidth=2 " Returns the effective value of 'shiftwidth'
set shortmess=a
set showcmd " display incomplete commands
set showtabline=2
set signcolumn=yes " Leave signcolumn enabled otherwise it's a little jarring
set smartcase " overrides ignorecase if pattern contains upcase
set spellfile=$HOME/.vim-spell-en.utf-8.add " Name of the word list file where words are added for the |zg| and |zw| commands.
set spelllang=en_us " Set region to US English
set splitbelow " When on, splitting a window will put the new window below the current one.
set splitright " When on, splitting a window will put the new window right of the current one.
syntax on " Turn on syntax highlighting.
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
set textwidth=80 " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set ttimeout " determine the behavior when part of a key code sequence has been received by the terminal UI.
set undodir=$HOME/.undodir " directory name for undo file.
set undofile " Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full

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

"  ____ ____ ____ ____ ____ ____   ____ ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n || ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|| ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\| |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" === ale ===
let g:ale_linters = {
      \ 'css': ['stylelint'],
      \ 'erb': ['erubi'],
      \ 'html': ['eslint', 'tidy', 'htmlhint', 'write-good', 'alex'],
      \ 'javascript': ['flow', 'eslint'],
      \ 'jsx': ['stylelint', 'eslint'],
      \ 'ruby': ['ruby', 'rubocop', 'rails_best_practices', 'reek', 'brakeman'],
      \ 'scss': ['stylelint'],
      \ 'text': ['vale', 'write-good', 'alex'],
      \ 'yml': ['yamllint']
      \ }

let g:ale_fixers = {
      \ 'css': ['stylelint'],
      \ 'javascript': ['prettier'],
      \ 'ruby': ['rubocop'],
      \ 'scss': ['stylelint']
      \ }

" use stylelint and eslint within jsx
" augroup FiletypeGroup
"     autocmd!
"     au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
" augroup END
" let g:ale_linter_aliases = {'jsx': 'css'}

" Do not lint or fix minified files.
let g:ale_pattern_options = {
      \ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
      \ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
      \}

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --print-width 100 --parser flow --arrow-parens always'
let g:ale_set_quickfix = 0
let g:ale_sign_warning = '•'
let g:ale_sign_error = '•'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'

" sourcerer
highlight ALEWarningSign ctermbg=237 guibg='#3a3a3a'
highlight ALEErrorSign ctermbg=237 guibg='#3a3a3a'

nnoremap <Leader>f :ALEFix<CR>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" === vim-closetag ===
let g:closetag_filenames = '*.html,*.erb,*.jsx,*.js'

" === colorizer ===
let g:colorizer_auto_filetype='sass,scss,css,html,slim,haml'

" === dasht ===
nnoremap <silent> K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<CR>

" === deoplete ===
if has('nvim')
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_delay = 10
let g:deoplete#max_list = 20
let g:tern_show_signature_in_pum = 0
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#case_insensitive = 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ ]
endif

" === dirvish ===
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
nnoremap gx :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>
augroup dirvishfugitive
  autocmd FileType dirvish call fugitive#detect(@%)
augroup END
nnoremap _ :Sexplore %<CR>
nnoremap - :Vexplore %<CR> :vertical resize 20<CR>

" === fugitive ===
nnoremap <Leader>g :Git<SPACE>

" === fzf.vim ===
nnoremap <C-p> :wa<CR>:Files<CR>
nnoremap <C-b> :wa<CR>:Buffers<CR>
nnoremap <C-t> :wa<CR>:Tags<CR>
nnoremap <Leader>p :BLines<CR>
nnoremap <Leader>gc :wa<CR>:Commits<CR>
nnoremap <Leader>hi :wa<CR>:History<CR>

" neovim fzf window
" let g:fzf_layout = { 'window': '20split enew' }
" let $FZF_DEFAULT_OPTS .= ' --no-height'

augroup fzfstatus
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 | autocmd WinLeave <buffer> set laststatus=2
augroup END

" You can pass rg arguments like so: :Rg -F components -g '*jsx'
command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always '.(<q-args>), 1,
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

" Call :Ag
nnoremap \ :Ag<SPACE>
" grep the word under the cursor
nnoremap gr :Ag<SPACE>'\b<cword>\b' *<CR>

" Press ; and then start typing to fzf search the whole project for a word or
" string
command! -bang -nargs=* Fg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
nnoremap ; :Fg<CR>

" Search neighboring files
function! s:fzf_neighbouring_files() abort
  let l:current_file =expand('%')
  let l:cwd = fnamemodify(l:current_file, ':p:h')
  let l:command = 'ag -g "" -f ' . l:cwd . ' --depth 0'

  call fzf#run({
        \ 'source': l:command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()
nnoremap ' :FZFNeigh<CR>

let g:fzf_colors =
      \ { 'hl': ['fg', 'Exception'] }
let g:fzf_tags_command = 'ctags -R'
" Mapping selecting mappings
nmap <Leader><tab> <plug>(fzf-maps-n)
xmap <Leader><tab> <plug>(fzf-maps-x)
omap <Leader><tab> <plug>(fzf-maps-o)
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-i> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')

" TODO: work on this:
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

" Better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '40'})
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history({'right': '40'})
nnoremap q/ :QHist<CR>

" === vim-gitgutter ===
let g:gitgutter_max_signs = 1500
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_signs = 0

" === vim-i18n ===
vmap <Leader>z :call I18nTranslateString()<CR>
vmap <Leader>dt :call I18nDisplayTranslation()<CR>

" === vim-jsx ===
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" === lightline.vim ===
" sourcer lightline colorscheme
let s:base03 =  [ '#151513', 233 ]
let s:base02 =  [ '#222222', 0   ]
let s:base01 =  [ '#4e4e43', 239 ]
let s:base00 =  [ '#666656', 242 ]
let s:base0 =   [ '#808070', 244 ]
let s:base1 =   [ '#949484', 246 ]
let s:base2 =   [ '#a8a897', 248 ]
let s:base3 =   [ '#e8e8d3', 253 ]
let s:yellow =  [ '#ebc168', 11  ]
let s:orange =  [ '#d98800', 3   ]
let s:red =     [ '#8a708d', 1   ]
let s:magenta = [ '#8181A6', 13  ]
let s:cyan =    [ '#87ceeb', 12  ]
let s:green =   [ '#7A7A57', 3   ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.normal.right = [ [ s:base02, s:base1 ], [ s:base2, s:base01 ] ]
let s:p.inactive.right = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left =  [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left = [ [ s:base02, s:cyan ], [ s:base3, s:base01 ] ]
let s:p.replace.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left = [ [ s:base02, s:yellow ], [ s:base3, s:base01 ] ]
let s:p.normal.middle = [ [ s:base0, s:base02 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.tabline.left = [ [ s:base3, s:base00 ] ]
let s:p.tabline.tabsel = [ [ s:base3, s:base02 ] ]
let s:p.tabline.middle = [ [ s:base01, s:base1 ] ]
let s:p.tabline.right = copy(s:p.normal.right)
let s:p.normal.error = [ [ s:base02, s:orange ] ]
let s:p.normal.warning = [ [ s:yellow, s:base01 ] ]
let g:lightline#colorscheme#sourcerer#palette = lightline#colorscheme#flatten(s:p)

let g:lightline = {
      \ 'colorscheme': 'sourcerer',
      \ 'active': {
      \   'left': [ [ 'filename' ],
      \             [ 'linter',  'gitbranch', 'gitgutter' ] ],
      \   'right': [ [ 'percent', 'lineinfo' ],
      \              [ 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'LightMod',
      \   'readonly': 'LightRO',
      \   'gitbranch': 'LightGit',
      \   'filename': 'LightName',
      \   'filetype': 'LightType',
      \   'fileencoding': 'LightEncoding',
      \   'mode': 'LightMode',
      \   'gitgutter': 'MyGitGutter',
      \ },
      \ 'component_expand': {
      \   'linter': 'LightErrors',
      \ },
      \ 'component_type': {
      \   'readonly': 'error',
      \   'linter': 'error'
      \ },
      \ 'separator': { 'left': '▉▊▋▌', 'right': '▌▋▊▉' },
      \ 'subseparator': { 'left': '▎', 'right': '▎' }
      \ }

function! LightMod() abort
  return &filetype =~? &modified ? '» ' : &modifiable ? '' : ''
endfunction

function! LightRO() abort
  return &filetype !~? &readonly ? '' : '• '
endfunction

function! LightGit() abort
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightName() abort
  let l:name = expand('%:p:.')
  if l:name =~? 'Dirvish'
    return ''
  endif
  return ('' !=? LightRO() ? LightRO() : LightMod()) .
        \ ('' !=? expand('%:p:.') ? expand('%:p:.') : '[No Name]')
endfunction

function! LightType() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : '') : ''
endfunction

function! LightEncoding() abort
  return winwidth(0) > 70 ? (strlen(&fileencoding) ? &encoding : &encoding) : ''
endfunction

function! LightErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  return l:counts.total == 0 ? '' : printf('• %d', l:counts.total)
endfunction

function! MyGitGutter() abort
  if ! exists('*GitGutterGetHunkSummary')
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

augroup alestatus
  au!
  autocmd User ALELint call lightline#update()
augroup end

" === nvim-completion-manager ===
if has('nvim')
  let g:cm_refresh_length = 2
  set pumheight=5
  set shortmess+=c

  " force init deoplete then hack deoplete's mapping
  call deoplete#enable()

  " register as ncm source
  au User CmSetup call cm#register_source({'name' : 'deoplete',
        \ 'priority': 7,
        \ 'abbreviation': '',
        \ })

  " hack deoplete's mapping
  inoremap <silent> <Plug>_ <C-r>=g:Deoplete_ncm()<CR>

  func! g:Deoplete_ncm()
    " forward to ncm
    call cm#complete('deoplete', cm#context(), g:deoplete#_context.complete_position + 1, g:deoplete#_context.candidates)
    return ''
  endfunc
  let g:deoplete#ignore_sources = {}
  let g:deoplete#ignore_sources = [
        \   'buffer',
        \   'member',
        \   'tag',
        \   'file',
        \   'around',
        \ ]
endif

" === omnicompletion ===
filetype plugin on
set completeopt=menu " Shows menu and any additional tips
set completeopt-=preview

" === rainbow_levels ===
let g:rainbow_levels = [
    \{'ctermfg': 84,  'guifg': '#50fa7b'},
    \{'ctermfg': 117, 'guifg': '#8be9fd'},
    \{'ctermfg': 61,  'guifg': '#6272a4'},
    \{'ctermfg': 212, 'guifg': '#ff79c6'},
    \{'ctermfg': 203, 'guifg': '#ffb86c'},
    \{'ctermfg': 228, 'guifg': '#f1fa8c'},
    \{'ctermfg': 15,  'guifg': '#f8f8f2'},
    \{'ctermfg': 231, 'guifg': '#525563'}]

nnoremap , :RainbowLevelsToggle<cr>

" === vim-sneak ===
let g:sneak#label = 1
let g:sneak#s_next = 1

nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F

nmap cc <Plug>Sneak_s
nmap CC <Plug>Sneak_S

" === vim-test ===
let g:test#strategy = 'dispatch'
" update jest snapshots with vim-test
let g:test#runner_commands = ['Jest', 'RSpec']
nnoremap <Leader>u :Jest <C-r>=escape(expand("%"), ' ') . ' ' . '--updateSnapshot'<CR><CR>

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" === vim-tmux-navigator ===
nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :TmuxNavigateRight<CR>
let g:tmux_navigator_no_mappings = 1 " do nay let the plugin set the mappings
let g:tmux_navigator_save_on_switch = 2 " Save on switch

"  ____ ____ ____ ____
" ||m |||a |||p |||s ||
" ||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|

" === Switch between the last two files ===
nnoremap <leader><leader> <c-^>

" === automatically rebalance windows on vim resize ===
augroup resize
  autocmd VimResized * :wincmd =
augroup END

" === zoom a vim pane, <C-w>= to re-balance ===
nnoremap <Leader>- :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

" === Get dot command repeatability in visual mode (from @geoffharcourt) ===
xnoremap . :normal.<CR>

" === Comment/un-comment like Sublime (from @geoffharcourt) ===
nmap <C-\> :TComment<CR>
vmap <C-\> :TComment<CR>

" === Make a new line above or below in normal mode ===
nnoremap <silent> ]<Space> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> [<Space> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" === Use C-Space to Esc out of any mode (from @christoomey) ===
nnoremap <C-Space> <Esc>:noh<CR>
vnoremap <C-Space> <Esc>gV
onoremap <C-Space> <Esc>
cnoremap <C-Space> <C-c>
inoremap <C-Space> <Esc>`^
if s:darwin
  " oTerminal sees <C-@> as <C-space> WTF, but ok
  nnoremap <C-@> <Esc>:noh<CR>
  vnoremap <C-@> <Esc>gV
  onoremap <C-@> <Esc>
  cnoremap <C-@> <C-c>
  inoremap <C-@> <Esc>`^
endif

" === make tab completion travel in a reasonable direction ===
function! InsertTabWrapper() abort
  let l:col = col('.') - 1
  if !l:col || getline('.')[l:col - 1] !~? '\k'
    return "\<Tab>"
  else
    return "\<c-n>"
  endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-P>

" === Emacs-like. Experimental, breaks things you might be using. ===
nnoremap <C-a> ^
nnoremap <C-e> $
xnoremap <C-a> ^
xnoremap <C-e> $
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-k> <C-o>D

" === Require pry ===
nnoremap <Leader>b orequire "pry"; binding.pry<esc>^

" === map <ctrl>c to quit ===
nnoremap <C-c> :x<CR>

" === require rails_helper ===
function! RequireRailsHelper()
    call append(0, 'require "rails_helper"')
endfunction
nnoremap <Leader>7 :call RequireRailsHelper()<CR>

" === Copy the entire buffer into the system register (from @R00k) ===
nnoremap <Leader>c mmggVG"*y`m

" === console.log word or function under cursor ===
nnoremap <Leader>co ct;console.log(<C-r>")<Esc>

" === ctags ===
let g:Tlist_Ctags_Cmd='ctags'

function! ReindexCtags()
  let l:ctags_hook = '$(git rev-parse --show-toplevel)/.git/hooks/ctags'

  if exists(l:ctags_hook)
    exec '!'. l:ctags_hook
  else
    exec '!ctags -R .'
  endif
endfunction

nmap <Leader>ct :call ReindexCtags()<CR>

" === add debugger anywhere ===
nnoremap <Leader>d odebugger;<esc>^

" === Open .html pages from vim in browser ===
nnoremap <Leader>h :!open '%'<CR>

" === Neovim terminal mappings for easy navigation ===
augroup neoterm
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap kj <C-\><C-n>

" === Indent the whole file ===
nnoremap <Leader>i mmgg=G`m

" === import I18n in React files ===
function! ImportI18n()
    call append(0, "import I18n from 'i18n-js';")
    call append(1, "")
    call append(2, "import translations from '../../utils/translations';")
    call append(3, "")
    call append(4, "I18n.locale = window.locale;")
    call append(5, "I18n.translations = translations;")
endfunction
nnoremap <Leader>8 :call ImportI18n()<CR>

" === Move up and down by visible lines if current line is wrapped ===
nnoremap j gj
nnoremap k gk

" === Mappings to move lines. Symbols represent 'alt' because macs are insane ===
" 'j' = '∆' and 'k' = '˚'
" http://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
if s:darwin
  nnoremap ˚ :m .-2<CR>==
  nnoremap ∆ :m .+1<CR>==
  inoremap ˚ <Esc>:m .-2<CR>==gi
  inoremap ∆ <Esc>:m .+1<CR>==gi
  vnoremap ˚ :m '>-2<CR>gv=gv
  vnoremap ∆ :m '<+1<CR>gv=gv
endif
" For Linux
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-j> <Esc>:m .+1<CR>==gi
vnoremap <A-k> :m '>-2<CR>gv=gv
vnoremap <A-j> :m '<+1<CR>gv=gv

" === Make esc more user friendly ===
inoremap jk <Esc>

" === paste flow when I need it ===
nnoremap <Leader>fl O// @flow<Esc>^

" === sed it up ===
nnoremap <Leader>n :%s/\(<c-r>=expand("<cword>")<CR>\)/

" === Make it easier to run js files inside vim ===
nnoremap <Leader>js :10sp<CR>:te node %<CR>

" === open and close location list ===
nnoremap <Leader>o :lopen<CR>
nnoremap <Leader>oo :lclose<CR>

" === open and close quickfix ===
nnoremap <Leader>q :copen<CR>
nnoremap <Leader>qq :cclose<CR>

" === qq to record, Q to replay (recursive map due to peekaboo) ===
nmap Q @q

" === run commands through neovim term instead of :! ===
nnoremap <Leader>r :10sp<CR>:te<CR>i

" === import react boilerplate ===
function! ImportReact()
    call append(0, "import PropTypes from 'prop-types';")
    call append(1, "import React from 'react';")
    call append(2, "")
    call append(3, "const { Component } = react;")
endfunction
nnoremap <Leader>9 :call ImportReact()<CR>

" === Source (reload) your vimrc ===
command! ReloadVimrc source $MYVIMRC

" === Make it easier to run ruby files inside vim ===
nnoremap <Leader>rb :10sp<CR>:te ruby -w %<CR>

" === Edit the db/schema.rb Rails file in a split ===
nnoremap <Leader>sc :split db/schema.rb<CR>

" === Show syntax highlighting groups for word under cursor, useful for editing
" colorschemes (from @drewneil) ===
nnoremap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack() abort
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), "synIDattr(v:val, 'name')")
endfunc

" === map visual-block to v ===
nnoremap v <c-v>e

" === Pre-populate a split command with the current directory ===
nnoremap <Leader>v :new <C-r>=escape(expand("%:p:h"), ' ') . '/'<CR>
nnoremap <Leader>vn :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<CR>

" === Open vimrc in new tab ===
nnoremap <Leader>vi :tabe ~/dotfiles/vimrc<CR>

" === Code notes ===
nnoremap <Leader>ww :Files ~/dotfiles/laptop/vim_notes/<CR>
nnoremap <Leader>wt :Sexplore ~/dotfiles/laptop/vim_notes/<CR>

" === Run vimscript functions ===
nnoremap <Leader>x :exec getline(".")<CR>

" === Yank to end of line instead of whole line (from @geoffharcourt) ===
nnoremap Y y$

" === Make yank behave like yank should ===
vnoremap <expr>y "my\"" . v:register . "y`y"

" === Buffer prev/next ===
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" === Open folds easily ===
nnoremap <Leader>z za

" === Get z commands in visual mode
xnoremap zz :normal zz<CR>
xnoremap zt :normal zt<CR>
xnoremap zb :normal zb<CR>

" === nvim :terminal colors ===
let g:terminal_color_0  = '#25272c'
let g:terminal_color_1  = '#ba2a2a'
let g:terminal_color_2  = '#008542'
let g:terminal_color_3  = '#eac06e'
let g:terminal_color_4  = '#0088cc'
let g:terminal_color_5  = '#8d4888'
let g:terminal_color_6  = '#006596'
let g:terminal_color_7  = '#53586f'
let g:terminal_color_8  = '#354151'
let g:terminal_color_9  = '#c95f5f'
let g:terminal_color_10 = '#73ba25'
let g:terminal_color_11 = '#f07d30'
let g:terminal_color_12 = '#81a3cf'
let g:terminal_color_13 = '#e35682'
let g:terminal_color_14 = '#25b8a5'
let g:terminal_color_15 = '#f6f9fc'
