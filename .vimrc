

syntax on
set t_Co=256
set background=dark
colorscheme peachpuff

if has("autocmd")
  filetype plugin indent on 
  "  set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmode
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch

set ruler
set number
set shiftwidth=4
set tabstop=4
set nowrap
set ai
set cin

set softtabstop=4


"set autowrite		" Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)
set backspace=eol,start,indent

set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

hi StatusLineNC term=bold,reverse cterm=bold,reverse gui=bold guifg=Red guibg=Black
hi StatusLine   term=reverse cterm=none ctermbg=234 ctermfg=green gui=bold guifg=PeachPuff guibg=Gray80

set laststatus=2
set statusline =%#identifier#%f\ %* 				" filename
set statusline+=%#warningmsg#%m%* 					" modified flag [+]
set statusline+=%#error#%r%*> 						" read only flag [RO]
set statusline+=%h 									" help file flag
set statusline+=%w\  								" 
set statusline+=%y\ >\ 								" filetype
set statusline+=enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}\ >
set statusline+=%=									" left/right separator
set statusline+=<\ (ch:%3b\ hex:%2B)\ <\ col:%2c\ <\ line:%2l/%L\ <\ [%2p%%]


"vertical/horizontal scroll off settings
set scrolloff=5
set sidescrolloff=7
set sidescroll=1


"display tabs and trailing spaces
set list
set listchars=tab:→·,trail:·
",nbsp:·



set nocompatible              " be iMproved, required
filetype off                  " required

" install Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'FuzzyFinder'
let g:fuf_file_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp|am)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])'
let g:fuf_coveragefile_globPatterns = ['**/*', '**/*']

Plugin 'ifdef-highlighting'

Plugin 'ihacklog/HiCursorWords'

Plugin 'altercation/vim-colors-solarized'
"syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

Plugin 'The-NERD-Commenter'
" invert comments
nnoremap <silent> <C-_> :call NERDComment(0, "invert")<CR>
vnoremap <silent> <C-_> <ESC>:call NERDComment(1, "invert")<CR>
inoremap <silent> <C-_> <ESC>:call NERDComment(0, "invert")<CR>

"Plugin 'fholgado/minibufexpl.vim'

"Plugin 'Valloric/YouCompleteMe'

Plugin 'ProjectCTags'
let g:projectCTagsAutogenerateTags = 1 
command! GenCT call GenerateProjectCTags( "Standard", "" )

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

noremap [12~ :w<CR>
imap [12~ :w<CR>
map <F7> :make<CR>
imap <F7> ^[[12~:make<CR>
map <F6> :cnext<CR>
command! Reconf  source $MYVIMRC

" Switch to alternate file
map <C-k> :bnext<cr>
map <C-j> :bprevious<cr>
noremap w :bd<CR>
map 1 :FufBuffer<cr> 
map 2 :FufCoverageFile<cr> 
map 6 :FufQuickfix<cr> 

