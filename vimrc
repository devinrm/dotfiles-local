"  ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

call plug#begin('~/.vim/bundle')

" === colorscheme(s) ===
Plug 'https://github.com/thiagoalessio/rainbow_levels.vim'
Plug 'https://github.com/devinrm/necromancer.vim'
Plug 'https://github.com/morhetz/gruvbox'

" === completion ===
Plug 'https://github.com/andymass/vim-matchup'
Plug 'https://github.com/lifepillar/vim-mucomplete'
Plug 'https://github.com/ternjs/tern_for_vim'

" === experiments ===
Plug 'https://github.com/stefandtw/quickfix-reflector.vim'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/romainl/vim-cool'
Plug 'https://github.com/VincentCordobes/vim-translate'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/othree/html5.vim'

" === git ===
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/junegunn/gv.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'

" === language plugins ===
Plug 'https://github.com/hail2u/vim-css3-syntax'
Plug 'https://github.com/iamcco/markdown-preview.vim'
Plug 'https://github.com/Keithbsmiley/rspec.vim'
Plug 'https://github.com/mxw/vim-jsx'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/tpope/vim-rails'
Plug 'https://github.com/vim-ruby/vim-ruby'

" === linting ===
Plug 'https://github.com/w0rp/ale'

" === make editing nicer ===
Plug 'https://github.com/derekprior/vim-trimmer'
Plug 'https://github.com/janko-m/vim-test'
Plug 'https://github.com/justinmk/vim-highlightedyank'
Plug 'https://github.com/justinmk/vim-sneak'
Plug 'https://github.com/pbrisbin/vim-mkdir'
Plug 'https://github.com/rstacruz/vim-closer'
Plug 'https://github.com/tomtom/tcomment_vim'
Plug 'https://github.com/tpope/vim-endwise'
Plug 'https://github.com/tpope/vim-eunuch'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/vimwiki/vimwiki'

" === move ===
Plug 'https://github.com/christoomey/vim-tmux-navigator'

" === other ===
Plug 'https://github.com/AndrewRadev/switch.vim'
Plug 'https://github.com/alvan/vim-closetag'
Plug 'https://github.com/chrisbra/Colorizer'
if !exists('g:gui_oni')
  Plug 'https://github.com/itchyny/lightline.vim'
endif
Plug 'https://github.com/radenling/vim-dispatch-neovim'
Plug 'https://github.com/stefanoverna/vim-i18n'
Plug 'https://github.com/sunaku/vim-dasht'
Plug 'https://github.com/tpope/vim-dispatch'

" === search ===
Plug 'https://github.com/junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/junegunn/vim-peekaboo'
Plug 'https://github.com/junegunn/vim-pseudocl'
Plug 'https://github.com/justinmk/vim-dirvish'

call plug#end()

"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

let s:darwin = has('mac')

set autoread " Automatically read file if it has been changed outside of vim
set backspace=2 " Backspace deletes like most programs in insert mode
set clipboard=unnamedplus " copy paste to system clipboard
set colorcolumn=+1 " highlight column after 'textwidth'
if strftime("%H") < 15
  " set background=light " Use colors that look good on a light background
  colorscheme necromancer
else
  set background=dark " Use colors that look good on a dark background
  colorscheme necromancer
endif
set diffopt+=vertical " Start diff mode with vertical splits
set expandtab " Use the appropriate number of spaces to insert a <Tab>.
filetype plugin indent on " load indent file for language
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
set formatprg=par
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
endif
set lazyredraw
if has('nvim')
  set termguicolors " nvim gui colors
endif
let g:is_posix=1 " When the type of shell script is /bin/sh, assume a POSIX-compatible shell for syntax highlighting purposes.
set laststatus=2 " Always display the status line
" let g:node_host_prog = $HOME.'/.asdf/shims/neovim-node-host'
let g:python_host_prog = $HOME.'/.asdf/shims/python2'
let g:python3_host_prog = $HOME.'/.asdf/shims/python3'
let g:ruby_host_prog = $HOME.'/.asdf/shims/neovim-ruby-host'
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
  autocmd CmdlineEnter * set norelativenumber | redraw
  autocmd CmdlineLeave * set relativenumber
  " === Get the best of both worlds with set number and relativenumber ===
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END
set ruler " show the cursor position all the time
augroup SaveOnFocusLost
  autocmd!
  autocmd FocusLost * :wa
augroup END
set scrolloff=3 " show 5 lines above and below cursor
scriptencoding utf-8 " Specify the character encoding used in the script.
set shiftround " Round indent to multiple of 'shiftwidth'.
set shiftwidth=2 " Returns the effective value of 'shiftwidth'
set shortmess=a
set showcmd " display incomplete commands
set showtabline=2
set signcolumn=yes " Leave signcolumn enabled otherwise it's a little jarring
set smartcase " overrides ignorecase if pattern contains upcase
" set spell
set spellfile=$HOME/.vim-spell-en.utf-8.add " Name of the word list file where words are added for the |zg| and |zw| commands.
set spelllang=en_us " Set region to US English
set splitbelow " When on, splitting a window will put the new window below the current one.
set splitright " When on, splitting a window will put the new window right of the current one.
set synmaxcol=200
syntax on " Turn on syntax highlighting.
set tabstop=2 " Number of spaces that a <Tab> in the file counts for.
set textwidth=80 " Maximum width of text that is being inserted. A longer line will be broken after white space to get this width.
set ttimeout " determine the behavior when part of a key code sequence has been received by the terminal UI.
set undodir=$HOME/.undodir " directory name for undo file.
set undofile " Automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read.
set undolevels=500
set undoreload=500
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
      \ 'css': ['scsslint'],
      \ 'erb': ['erubi'],
      \ 'html': ['eslint', 'tidy', 'htmlhint', 'write-good', 'alex'],
      \ 'javascript': ['flow', 'eslint'],
      \ 'jsx': ['stylelint', 'eslint'],
      \ 'ruby': ['ruby', 'rubocop', 'rails_best_practices', 'reek', 'brakeman'],
      \ 'scss': ['scsslint'],
      \ 'text': ['vale', 'write-good', 'alex'],
      \ 'vim': ['vint']
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
      \ '\.min\.css$': {'ale_enabled': 0},
      \ '\.min\.js$': {'ale_enabled': 0},
      \}

let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --print-width 100 --parser flow --arrow-parens always'
let g:ale_set_quickfix = 0
let g:ale_sign_warning = '•'
let g:ale_sign_error = '•'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s'

if g:colors_name ==# 'necromancer'
  highlight ALEWarningSign ctermbg=237 guibg='#282828' guifg='#d98800'
  highlight ALEErrorSign ctermbg=237 guibg='#282828' guifg='#d98800'
  highlight LineNr ctermbg=0 guibg='#282828'
  highlight Normal guibg='#282828'
endif

nnoremap <Leader>f :ALEFix<CR>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

" === vim-closetag ===
let g:closetag_filenames = '*.html,*.erb,*.jsx,*.js'

" === colorizer ===
let g:colorizer_auto_filetype='sass,scss,css,html,slim,haml'

" === vim-cool ===
let g:CoolTotalMatches = 1

" === dasht ===
nnoremap <silent> K :call Dasht([expand('<cword>'), expand('<cWORD>')], '!')<CR>

" === dirvish ===
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
nnoremap gx :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())<CR>
augroup dirvishfugitive
  autocmd FileType dirvish call fugitive#detect(@%)
augroup END
nnoremap _ :Sexplore %<CR>
nnoremap - :Vexplore %<CR> :vertical resize 35<CR>

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

" Call :Rg
nnoremap \ :Rg<SPACE>
" grep the word under the cursor
:nnoremap gr :Rg <C-R><C-W><CR>

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

" let g:fzf_tags_command = 'ctags -R'
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

" === vim-javascript ===
let g:javascript_plugin_flow = 1

" === vim-jsx ===
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" === lightline.vim ===
if !exists('g:gui_oni')
  " sourcer lightline colorscheme
  let s:base03 =  [ '#151513', 233 ]
  let s:base02 =  [ '#282828', 0   ]
  let s:base01 =  [ '#4e4e43', 239 ]
  let s:base00 =  [ '#666656', 242 ]
  let s:base0 =   [ '#808070', 244 ]
  let s:base1 =   [ '#282828', 246 ]
  let s:base2 =   [ '#a8a897', 248 ]
  let s:base3 =   [ '#e8e8d3', 253 ]
  let s:yellow =  [ '#ebc168', 11  ]
  let s:orange =  [ '#cc8800', 3   ]
  let s:red =     [ '#7271a1', 5   ]
  let s:magenta = [ '#8181A6', 13  ]
  let s:cyan =    [ '#87ceeb', 12  ]
  let s:green =   [ '#7A7A57', 3   ]

  let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
  let s:p.normal.left = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
  let s:p.normal.right = [ [ s:base2, s:base01 ], [ s:base2, s:base01 ] ]
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
  augroup END

  if strftime("%H") < 15
    let g:lightline.colorscheme = 'sourcerer'
  else
    let g:lightline.colorscheme = 'sourcerer'
  endif
endif

" === matchup ===
let g:matchup_matchparen_deferred = 1

" === MUcomplete ===
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#smart_enter = 1
let g:mucomplete#buffer_relative_paths = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['omni', 'tags', 'keyn', 'dict', 'uspl', 'path']

" this is necessary for overriding mucomplete mappingss
imap <F4> <plug>(MUcompletePopupCancel)
imap <F5> <plug>(MUcompleteCR)

" make it work with rhubarb
augroup rhumu
  autocmd BufEnter * if &ft ==# 'gitcommit' | MUcompleteAutoOff | endif
augroup end

" make it work with peakaboo in insert mode
let g:peekaboo_ins_prefix = '<c-x>'

" === omnicompletion ===
augroup omnifuncs
  au!
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript.jsx set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
augroup end
filetype plugin on
set completeopt+=noselect,noinsert,menuone
set completeopt-=i,t,preview
set omnifunc=syntaxcomplete#Complete
set pumheight=5
set shortmess+=c

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

" === tern_for_vim ===
let g:tern#command = ['tern']

" === vim-test ===
let g:test#strategy = 'dispatch'
let g:test#runner_commands = ['Jest', 'RSpec']

" update jest snapshots with vim-test
nnoremap <Leader>u :Jest <C-r>=escape(expand("%"), ' ') . ' ' . '--updateSnapshot'<CR><CR>

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" === vim-tmux-navigator ===
if !exists('g:gui_oni')
  nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
  nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
  nnoremap <silent> <c-l> :TmuxNavigateRight<CR>
  let g:tmux_navigator_no_mappings = 1 " do nay let the plugin set the mappings
  let g:tmux_navigator_save_on_switch = 2 " Save on switch
endif

" === vimwiki ===
let g:vimwiki_list = [{'path': '~/dotfiles/laptop/vim_notes/',
                       \ 'syntax': 'markdown', 'ext': '.md'}]

" === clear all registers ===
command! RegClear for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

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

" === Copy the entire buffer into the system register (from @R00k) ===
nnoremap <Leader>c mmggVG"*y`m

" === console.log word or function under cursor ===
nnoremap <Leader>co ct;console.log(<C-r>")<Esc>

" === add debugger anywhere ===
nnoremap <Leader>d odebugger;<esc>^

" === Open .html pages from vim in browser ===
nnoremap <Leader>h :!open '%'<CR>

" === tab mappings to match tmux
" nnoremap <C-s>1 1gt
" nnoremap <C-s>2 2gt
" nnoremap <C-s>3 3gt
" nnoremap <C-s>4 4gt
" nnoremap <C-s>5 5gt
" nnoremap <C-s>6 6gt
" nnoremap <C-s>t :tabnew<CR>
"
" tnoremap <C-s>1 <C-\><C-n>1gt
" tnoremap <C-s>2 <C-\><C-n>2gt
" tnoremap <C-s>3 <C-\><C-n>3gt
" tnoremap <C-s>4 <C-\><C-n>4gt
" tnoremap <C-s>5 <C-\><C-n>5gt
" tnoremap <C-s>6 <C-\><C-n>6gt
" tnoremap <C-s>t <C-\><C-n>:tabnew<CR>

" === Neovim terminal mappings for easy navigation ===
augroup neoterm
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
augroup END
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" This allows you to nest nvim sessions such as in git commits and still save
" and exit properly
tnoremap <Esc><Esc> <C-\><C-n>
tnoremap <C-r> <C-r><C-r>
tnoremap <C-s><C-l> clear<CR>
tnoremap <C-s>- <C-\><C-n>:sp<CR>:term<CR>i
tnoremap <C-s>\ <C-\><C-n>:vsp<CR>:term<CR>i
nnoremap <C-s>- :sp<CR>:term<CR>i
nnoremap <C-s>\ :vsp<CR>:term<CR>i
nnoremap <C-s>g :vsp<CR>:term<CR>i dot<CR>
nnoremap <C-s>h :tabnew<CR>:term<CR>i htop<CR>

" === Indent the whole file ===
nnoremap <Leader>i mmgg=G`m

" === import I18n in React files ===
function! ImportI18n()
  call append(0, "import I18n from 'i18n-js';")
  call append(1, '')
  call append(2, "import translations from 'utils/translations';")
  call append(3, '')
  call append(4, 'I18n.locale = window.locale;')
  call append(5, 'I18n.translations = translations;')
endfunction
nnoremap <Leader>8 :call ImportI18n()<CR>

" === Move up and down by visible lines if current line is wrapped ===
nnoremap j gj
nnoremap k gk

" === Mappings to move lines. Symbols represent 'alt' because macs are insane ===
" 'j' = '∆' and 'k' = '˚'
" Note: this only works in neovim
if s:darwin
  nnoremap ˚ :m -2<CR>==
  nnoremap ∆ :m +<CR>==
  inoremap ˚ <Esc>:m -2<CR>==gi
  inoremap ∆ <Esc>:m +<CR>==gi
  vnoremap ˚ :m '>-2<CR>gv=gv
  vnoremap ∆ :m '<+<CR>gv=gv
endif
" For Linux
nnoremap <A-k> :m -2<CR>==
nnoremap <A-j> :m +<CR>==
inoremap <A-k> <Esc>:m -2<CR>==gi
inoremap <A-j> <Esc>:m +<CR>==gi
vnoremap <A-k> :m '>-2<CR>gv=gv
vnoremap <A-j> :m '<+<CR>gv=gv

" === Use h, j, k, l to navigate panes
" function! WinMove(key)
"   let t:curwin = winnr()
"   exec 'wincmd '.a:key
"   if (t:curwin == winnr())
"     if (match(a:key,'[jk]'))
"       wincmd v
"     else
"       wincmd s
"     endif
"     exec 'wincmd '.a:key
"   endif
" endfunction
"
" nnoremap <silent> <C-h> :call WinMove('h')<cr>
" nnoremap <silent> <C-j> :call WinMove('j')<cr>
" nnoremap <silent> <C-k> :call WinMove('k')<cr>
" nnoremap <silent> <C-l> :call WinMove('l')<cr>

" === Make esc more user friendly ===
inoremap jk <Esc><Esc>

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

" === import react boilerplate ===
function! ImportReact()
  call append(0, "import PropTypes from 'prop-types';")
  call append(1, "import React from 'react';")
  call append(2, '')
  call append(3, 'const { Component } = react;')
endfunction
nnoremap <Leader>9 :call ImportReact()<CR>

" === Source (reload) your vimrc ===
command! ReloadVimrc source $MYVIMRC

" === Make it easier to run ruby files inside vim ===
nnoremap <Leader>rb :10sp<CR>:te ruby -w %<CR>

" === Edit the db/schema.rb Rails file in a split ===
nnoremap <Leader>sc :split db/schema.rb<CR>

" === `sort` case-insensitive ===
nmap :sort :sort i
vmap :sort :sort i

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
let g:terminal_color_4  = '#7e8aa2'
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
