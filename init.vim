call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'wokalski/autocomplete-flow'
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Preveusly install npm install -g tern and user .tern-project
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Preveusly install pip install jedi
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

Plug 'artur-shaik/vim-javacomplete2'
Plug 'ayu-theme/ayu-vim' 

Plug 'scrooloose/nerdcommenter'

Plug 'vim-ruby/vim-ruby'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'junegunn/fzf' "command line fuzzy finder

Plug 'kchmck/vim-coffee-script'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
autocmd FileType java setlocal omnifunc=javacomplete#Complete
nmap <F4> <Plug>(JavaComplete-Imports-AddSmart)
imap <F4> <Plug>(JavaComplete-Imports-AddSmart)
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
nmap <F6> <Plug>(JavaComplete-Imports-AddMissing)
imap <F6> <Plug>(JavaComplete-Imports-AddMissing)
"add 'sink': 'tabedit' to create a tab by opened file
nnoremap <F2> :call fzf#run({'sink': 'e', 'source': 'find * -type f'})<CR>
nnoremap <F3> :call LanguageClient_contextMenu()<CR>

"Move over split spaces
"move to down
nnoremap <C-J> <C-W><C-J>
"move to up
nnoremap <C-K> <C-W><C-K>
"move to right
nnoremap <C-L> <C-W><C-L>
"move to left
nnoremap <C-H> <C-W><C-H>

set termguicolors     " enable true colors support
let ayucolor="mirage"  " for light version of theme
colorscheme ayu

let mapleader="\<TAB>"

set hidden

let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'ruby': ['~/.asdf/shims/solargraph', 'stdio'],
    \ }

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

