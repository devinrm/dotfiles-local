"  ____ ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n |||s ||
" ||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" Remove declared plugins
function! s:UnPlug(plug_name)
  if has_key(g:plugs, a:plug_name)
    call remove(g:plugs, a:plug_name)
  endif
endfunction
command!  -nargs=1 UnPlug call s:UnPlug(<args>)

call plug#begin('~/.vim/bundle')

" === colorscheme(s) ===
Plug 'AlessandroYorba/Alduin'
Plug 'AlessandroYorba/Despacio'
Plug 'rakr/vim-one'

" === completion ===
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'fishbullet/deoplete-ruby'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'Shougo/neco-vim'
Plug 'ternjs/tern_for_vim'
Plug 'zchee/deoplete-zsh'

" === experiments ===
Plug 'beloglazov/vim-online-thesaurus'
if has('nvim')
  Plug 'floobits/floobits-neovim'
endif
Plug 'hwartig/vim-seeing-is-believing'

" === git ===
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'

" === language plugins ===
Plug 'c-brenn/phoenix.vim'

function! BuildComposer(info)
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
Plug 'elixir-lang/vim-elixir'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'slashmili/alchemist.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" === linting ===
Plug 'w0rp/ale'

" === make editing nicer ===
Plug 'derekprior/vim-trimmer'
Plug 'janko-m/vim-test'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'pbrisbin/vim-mkdir'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/tComment'

" === move ===
Plug 'christoomey/vim-tmux-navigator'
Plug 'justinmk/vim-sneak'
Plug 'yuttie/comfortable-motion.vim'

" === other ===
Plug 'alvan/vim-closetag'
Plug 'chrisbra/Colorizer'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'

" === search ===
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-slash'

call plug#end()

"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

let s:darwin = has('mac')

set autoread
set autowrite " Automatically :write before running commands
set backspace=2 " Backspace deletes like most programs in insert mode
set clipboard=unnamed " copy paste to clipboard
set colorcolumn=+1

if (strftime('%H') % 17) > 7
  colo despacio
  let g:airline_theme='one'
  " colo one
  " set background=light
else
  let g:alduin_Contract_Vampirism = 1
  colorscheme alduin
  let g:airline_theme='alduin'
  highlight ColorColumn guibg=#282c34
endif

" this is very experimental. checks if a file was updated elsewhere like package.json
" and reflects changes automatically while viewing file
augroup checkt
  autocmd CursorHold * call Timer()
  function! Timer()
    checktime
    call feedkeys("f\e")
  endfunction
augroup END

set complete+=kspell
set diffopt+=vertical
set expandtab
filetype plugin indent on
set gdefault " Replace all matches on a line instead of just the first

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  if !exists(':Ag')
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

set guicursor+=a:blinkon0 " Disable blinking cursor
highlight Comment cterm=italic gui=italic
set history=50
set hlsearch " highlight search results
" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'
set incsearch " do incremental searching
set ignorecase " case insensitive pattern matching

if has('nvim')
  set inccommand=split " this is necessary for using this %s with a quickfix window in nvim
endif

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1
set laststatus=2  " Always display the status line
" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
let g:mapleader = ' '
set matchtime=0 " Speed up escape after (){} chars
set mouse=a " Turn mouse on for pair programming
set nobackup
set nofoldenable
set nojoinspaces
set noshowmode
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowrap
set nowritebackup
set number
set numberwidth=5
set relativenumber " Get the best of both worlds with set number and relativenumber

augroup numbers
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
augroup END

set ruler " show the cursor position all the time
runtime! macros/matchit.vim
set scrolloff=5 " show 5 lines above and below cursor
set shiftround
set shiftwidth=2
set showcmd " display incomplete commands
set smartcase " overrides ignorecase if pattern contains upcase
set spellfile=$HOME/.vim-spell-en.utf-8.add
set spelllang=en_us " Set region to US English
set splitbelow
set splitright
syntax on
set tabstop=2
set textwidth=80
set ttimeout " Fast timeout
set undodir=$HOME/.undodir
set undofile

augroup vimrcEx
  autocmd!
  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

set wildignore+=tmp/** " Ignore stuff that can't be opened
set wildmenu " Enables a menu at the bottom of the vim window.
set wildmode=list:longest,list:full
set winwidth=84 " Window size
set winheight=10
set winminheight=5

"  ____ ____ ____ ____ ____ ____
" ||p |||l |||u |||g |||i |||n ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|
"  ____ ____ ____ ____ ____ ____ ____ ____
" ||s |||e |||t |||t |||i |||n |||g |||s ||
" ||__|||__|||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|

" === vim-airline ===
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_error = '%{ale#statusline#Status()}'
let g:airline_section_z = '%#__accent_bold#%l%#__restore__#:%c'

" === ALE ===
" Disable inherited syntastic
let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': [] }

let g:ale_linters = {
      \ 'javascript': ['flow', 'eslint', 'prettier-eslint'],
      \ 'html': ['eslint', 'prettier-eslint', 'flow', 'tidy', 'htmlhint'],
      \ 'css': ['stylelint'],
      \ 'scss': ['stylelint'],
      \ 'ruby': ['rubocop', 'reek'],
      \ 'text': ['vale']
      \ }

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma none --tab-width 2 --print-width 120 --parser flow'
nnoremap <Leader>fix :ALEFix<CR>

let g:ale_set_quickfix = 0
let g:ale_statusline_format = ['✕ %d', '△ %d', '=_=']
let g:ale_sign_warning = '△'
let g:ale_sign_error = '✕'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
set updatetime=1000
augroup alesettings
  autocmd BufEnter * set conceallevel=0
  autocmd CursorHold * call ale#Lint()
  autocmd CursorHoldI * call ale#Lint()
  autocmd InsertLeave * call ale#Lint()
  autocmd TextChanged * call ale#Lint()
augroup END
let g:ale_lint_on_text_changed = 0

" === auto-pairs ===
let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}

" === vim-closetag ===
let g:closetag_filenames = '*.html,*.erb,*.jsx,*.js'

" === colorizer ===
let g:colorizer_auto_filetype='sass,scss,css,html,slim,haml'

" === comfortable-motion.vim ===
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>

" === deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#disable_auto_complete = 1 " only show comp menu on <tab>
let g:deoplete#max_list = 15

" === deoplete ternjs/tern_for_vim ===
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'html'
                \ ]

let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

" === dispatch.vim ===
let g:rspec_command = 'Dispatch rspec {spec}'

" === fzf.vim ===
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <C-t> :BTags<CR>
nnoremap <Leader>f :BLines<CR>
nnoremap <Leader>c :Commits<CR>
nnoremap <Leader>old :History<CR>
" grep the word under the cursor, select it, and then drop it into a quickfix
" window
nnoremap \\ :Ag <C-r><C-w><CR><C-a><CR>

let g:fzf_colors =
      \ { 'hl': ['fg', 'Exception'] }
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

" Narrow ag results within vim; CTRL-A to select all matches and list them in
" quickfix window
function! s:ag_to_qf(line)
  let l:parts = split(a:line, ':')
  return {'filename': l:parts[0], 'lnum': l:parts[1], 'col': l:parts[2],
        \ 'text': join(l:parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let l:cmd = get({'ctrl-x': 'split',
        \ 'ctrl-v': 'vertical split',
        \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let l:list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let l:first = l:list[0]
  execute l:cmd escape(l:first.filename, ' %#\')
  execute l:first.lnum
  execute 'normal!' l:first.col.'|zz'

  if len(l:list) > 1
    call setqflist(l:list)
    copen
    wincmd p
  endif
endfunction

command! -nargs=* Ag call fzf#run({
      \ 'source':  printf('ag --nogroup --column --color "%s"',
      \                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\')),
      \ 'sink*':    function('<sid>ag_handler'),
      \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
      \            '--multi --bind=ctrl-a:select-all,ctrl-d:deselect-all '.
      \            '--color hl:68,hl+:110',
      \ 'down':    '50%'
      \ })

" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-i> fzf#complete('tmuxwords.rb --all-but-current --scroll 499 --min 5')
inoremap <expr> <C-x><C-k> fzf#complete('cat /usr/share/dict/words')

" Ripgrep
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
"   \   <bang>0 ? fzf#vim#with_preview('up:60%')
"   \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \   <bang>0)

" === vim-gitgutter ===
let g:gitgutter_signs = 0

" === goyo.vim/limelight.vim ===
augroup goyolimelight
  autocmd! User GoyoEnter Limelight " Integrate limelight and goyo
  autocmd! User GoyoLeave Limelight!
augroup END

" === vim-jsx ===
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" === vim-markdown ===
let g:markdown_fenced_languages = ['html', 'ruby', 'bash=sh', 'javascript', 'css', 'sql', 'vim']

" === netrw ===
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:netrw_dirhistmax = 0

" === omnicompletion ===
filetype plugin on
set omnifunc=syntaxcomplete#Complete
inoremap <c-c> <c-x><c-o>
set complete=.,b,u,w,t,] " Pull from keywords in the current file and from the current tags file
set complete+=k~/.vim/dictionaries/array_methods.txt
set complete+=k~/.vim/dictionaries/float_methods.txt
set complete+=k~/.vim/dictionaries/hash_methods.txt
set complete+=k~/.vim/dictionaries/integer_methods.txt
set complete+=k~/.vim/dictionaries/string_methods.txt
set complete+=k~/.vim/dictionaries/rails_controller_completions.txt
set complete+=k~/.vim/dictionaries/rails_mailer_completions.txt
set complete+=k~/.vim/dictionaries/rails_migration_completions.txt
set complete+=k~/.vim/dictionaries/rails_model_completions.txt
set complete+=k~/.vim/dictionaries/rails_spec_completions.txt
set complete+=k~/.vim/dictionaries/ruby_template_completions.txt
set complete+=k~/.vim/dictionaries/capybara_matchers.txt
set complete+=k~/.vim/dictionaries/webdriver_io.txt
" set completeopt=menu,preview " Shows menu and any addition tips
set completeopt-=preview

" === vim-seeing-is-believing ===
augroup seeingIsBelievingSettings
  autocmd!

  autocmd FileType ruby nmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)
  autocmd FileType ruby xmap <buffer> <Enter> <Plug>(seeing-is-believing-mark-and-run)

  autocmd FileType ruby nmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby xmap <buffer> <F4> <Plug>(seeing-is-believing-mark)
  autocmd FileType ruby imap <buffer> <F4> <Plug>(seeing-is-believing-mark)

  autocmd FileType ruby nmap <buffer> <F5> <Plug>(seeing-is-believing-run)
  autocmd FileType ruby imap <buffer> <F5> <Plug>(seeing-is-believing-run)
augroup END

" === vim-sneak ===
let g:sneak#s_next = 1
let g:sneak#label = 1

" === vim-test ===
let g:test#strategy = 'dispatch'
" this rspec command is SpreeCommerce specific. Don't copy unless you need to
let g:test#ruby#rspec#executable = 'SPEC_ALL=true bundle exec rspec'
if has('nvim')
  " open vim-test in neovim terminal if using neovim
  let g:test#strategy = 'neovim'
endif

nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" === vim-tmux-navigator ===
" To use c-h in neovim on OS X
" (https://github.com/neovim/neovim/issues/2048#issuecomment-78045837):
" infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
" tic $TERM.ti
nnoremap <silent> <c-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <c-j> :TmuxNavigateDown<CR>
nnoremap <silent> <c-k> :TmuxNavigateUp<CR>
nnoremap <silent> <c-l> :TmuxNavigateRight<CR>
" nnoremap <silent> <c-\> :TmuxNavigatePrevious<CR> TODO: fix this
" do nay let the plugin set the mappings
let g:tmux_navigator_no_mappings = 1
" Save on switch
let g:tmux_navigator_save_on_switch = 2

"  ____ ____ ____ ____
" ||m |||a |||p |||s ||
" ||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|

" Switch between the last two files
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

" === Toggle spell checking on and off ===
nnoremap <silent> <Leader>, :set spell!<CR>

" === Comment/un-comment like Sublime (from @geoffharcourt) ===
nnoremap <C-\> :TComment<CR>
vnoremap <C-\> :TComment<CR>

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
function! InsertTabWrapper()
    let l:col = col('.') - 1
    if !l:col || getline('.')[l:col - 1] !~? '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-P>

" === Emacs-like. Experimental, breaks things you might be using. ===
nnoremap <C-a> ^
nnoremap <C-e> $
imap <C-a> <C-o>^
imap <C-e> <C-o>$
nnoremap <C-w> db
imap <C-n> <C-o>j
imap <C-p> <C-o>k
imap <C-f> <C-o>l
imap <C-b> <C-o>h
imap <C-k> <C-o>D

" === Require pry (from @christoomey) ===
nnoremap <Leader>b orequire 'pry'; binding.pry<esc>^

" === Let's stop typing ':Bundle' ===
nnoremap <Leader>bu :Bundle<CR>

" === map <ctrl>c to quit ===
nnoremap <C-c> :x<CR>

" === Copy the entire buffer into the system register (from @R00k) ===
nnoremap <Leader>co mmggVG"*y`m

" === Run them migrations ===
nnoremap <Leader>dm :! rails db:migrate<CR>

" === Try for a better gJ ===
nnoremap gj gJ<BS>

" === Convert Ruby 1.8 to 1.9 Hash Syntax ===
nnoremap <Leader>h :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" === Open .html pages from vim in browser ===
nnoremap <Leader>ht :!open '%'<CR>

" === Indent the whole file ===
nnoremap <Leader>i mmgg=G`m

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
inoremap kj <Esc>
xnoremap jk <Esc>
xnoremap kj <Esc>

" === Toggle relative line number for yanking, i.e. :6y ===
nnoremap <Leader>ln :set relativenumber!<CR>

" === paste flow when I need it ===
nnoremap <Leader>low O// @flow<Esc>^

" === make n N nicer ===
function! s:nice_next(cmd)
  let l:view = winsaveview()
  execute 'normal! ' . a:cmd
  if l:view.topline != winsaveview().topline
    normal! zz
  endif
endfunction
nnoremap <silent> n :call <SID>nice_next('n')<CR>
nnoremap <silent> N :call <SID>nice_next('N')<CR>

" === sed it up ===
nnoremap <Leader>n :%s/\(<c-r>=expand("<cword>")<CR>\)/

" === open and close location list ===
nnoremap <Leader>o :lopen<CR>
nnoremap <Leader>oo :lclose<CR>

" === Set paste so paste works properly ===
nnoremap <Leader>p "*p

" === qq to record, Q to replay (recursive map due to peekaboo) ===
nmap Q @q

" === Source (reload) your vimrc ===
command! ReloadVimrc source $MYVIMRC

" === Make it easier to run ruby files inside vim ===
nnoremap <Leader>ru :!ruby -w %<CR>

" === Edit the db/schema.rb Rails file in a split ===
nnoremap <Leader>sc :split db/schema.rb<CR>

" === Show syntax highlighting groups for word under cursor, useful for editing
" colorschemes (from @drewneil) ===
nnoremap <Leader>syn :call <SID>SynStack()<CR>
function! <SID>SynStack()
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

" === New Split Windows ===
nnoremap <Leader>wv :vsplit<CR>
nnoremap <Leader>wh :split<CR>

" === Run vimscript functions ===
nnoremap <Leader>x :exec getline(".")<CR>

" === Yank to end of line instead of whole line (from @geoffharcourt) ===
nnoremap Y y$

" === Make yank behave like yank should ===
vnoremap <expr>y "my\"" . v:register . "y`y"

" === Get z commands in visual mode
xnoremap zz :normal zz<CR>
xnoremap zt :normal zt<CR>
xnoremap zb :normal zb<CR>

"  ____ ____ ____ ____ ____ ____
" ||n |||e |||o |||v |||i |||m ||
" ||__|||__|||__|||__|||__|||__||
" |/__\|/__\|/__\|/__\|/__\|/__\|

if has('nvim')
  set termguicolors " nvim gui colors

  " === Neovim terminal mappings for easy navigation ===
  augroup neoterm
    au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  augroup END
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  tnoremap jk <C-\><C-n>
  tnoremap <C-d> <C-\><C-n>:bd!<CR>

  " run commands through neovim term instead of :!
  nnoremap <Leader>r :te<SPACE>
endif
