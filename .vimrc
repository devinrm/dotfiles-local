call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-runner'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'nanotech/jellybeans.vim'
Plug 'chrisbra/csv.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-tbone'
Plug 'rking/ag.vim'
Plug 'tpope/vim-endwise'
Plug 'pbrisbin/vim-mkdir'
Plug 'pangloss/vim-javascript'
Plug 'ashisha/image.vim'
Plug 'floobits/floobits-neovim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'tpope/rbenv-ctags'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rake'
Plug 'jelera/vim-javascript-syntax'
Plug 'scrooloose/nerdtree'
" Add plugins to &runtimepath
call plug#end()

runtime macros/matchit.vim

" Use the space key as our leader.
let mapleader = "\<Space>"

" Map Ctrl-s to write the file
nmap <C-s> :w<cr>

" Split edit your vimrc. Type space, v, r in sequence to trigger
nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>

imap jk <esc>
imap kj <esc>

imap <C-s> <esc>:w<cr>

map <silent> <F5> :!open %<cr>

set nocompatible                " Don't maintain compatibilty with Vi.
set lazyredraw                  " Don't update while executing macros
set scrolloff=4                 " Keep at least 4 lines below cursor
set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<CR>

" Pre-populate a split command with the current directory
nmap <leader>v :vnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>

" Edit your vimrc in a new tab
nmap <leader>vi :tabedit ~/.vimrc<cr>

" Copy the entire buffer into the system register
nmap <leader>co ggVG*y

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" Command aliases for typoed commands (accidentally holding shift too long)
command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = ""

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

nnoremap <leader>irb :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'irb'}<cr>

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1

let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

colorscheme jellybeans

" ftpplugin for reading CSVs
:filetype plugin on

" JSON View
function! s:PrettyJSON()
  %!jq .
  set filetype=json
endfunction
command! PrettyJSON :call <sid>PrettyJSON()

" copy paste to clipboard
set clipboard=unnamed

set rtp+=/usr/local/opt/fzf

" Nerdtree stuff
map <C-n> :NERDTreeToggle<CR>

" Enable mouse cause I like scrolling
:set mouse=a
