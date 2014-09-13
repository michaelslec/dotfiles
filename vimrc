" ----------------------------------------------------------------------------
" Vundle
" ----------------------------------------------------------------------------

set nocompatible " Be IMproved

set rtp+=~/.vim/bundle/vundle/ " Add vundle to run time path
call vundle#rc() " Start vundle

" Let Vundle manage Vundle
Plugin 'gmarik/vundle'

" Bundles for code editing
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'

" Bundles that make life a HELL OF A LOT easier
Plugin 'airblade/vim-gitgutter'
Plugin 'derekwyatt/vim-protodef'
Plugin 'duff/vim-bufonly'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-fswitch'

"Bundles for navigation
" Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'

" Bundles for making stuff look better
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'bling/vim-airline'

" All the color schemes in the world!
Plugin 'daylerees/colour-schemes'

" Auto-loads matchit assuming user has not installed a newer version
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" ----------------------------------------------------------------------------
" moving around, searching and patterns
" ----------------------------------------------------------------------------

set incsearch " Highlight pattern matches as you type
set ignorecase " Ignore case when using a search pattern
set smartcase " Override 'ignorecase' when pattern has upper case character
" ----------------------------------------------------------------------------
" tags
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" displaying text
" ----------------------------------------------------------------------------

set linebreak " For lines longer than the window, wrap intelligently
set showbreak=↪\  " String to put at the start of lines that have been wrapped

set number " Precedes each line with a line number
set relativenumber " Fixes bug with relativenumber/number switch

set cmdheight=2 " Helps avoid 'Press ENTER...' prompts

" ----------------------------------------------------------------------------
" syntax, highlighting and spelling
" ----------------------------------------------------------------------------

syntax on " Enables Vim to show parts of the text in another font or color

filetype off
filetype indent plugin on

set background=dark " Uses dark version of colorscheme

let g:solarized_termcolors=256 " Adds 256 color in terminal mode (specifically for solarized colorscheme)
colorscheme lucius " Sets colorscheme

set cursorline " Highlights current line cursor is on

if has("unix") " Checks to see if OS is mac or linux
  if system('uname') =~ 'Darwin' " If OS is Mac
    set guifont=Inconsolata\ for\ Powerline\ Medium:h13
  else " IF OS is Linux
    set guifont=Inconsolata\ for\ Powerline\ Medium\ 13
  endif
endif

" ----------------------------------------------------------------------------
" multiple windows
" ----------------------------------------------------------------------------

set laststatus=2 " Last window will always have a status line

set hidden " Allows switching buffers without saving
set splitright " Defaults splitting windows the right
set splitbelow " Default's splitting windows below

set winwidth=130
set winheight=5
set winminheight=5
set winheight=999

" ----------------------------------------------------------------------------
" multiple tab pages
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" terminal
" ----------------------------------------------------------------------------

" set ttyfast "Faster screen-drawing

" ----------------------------------------------------------------------------
" using the mouse
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" GUI
" ----------------------------------------------------------------------------

if has('gui_running')
  set guioptions-=T
  set guioptions-=R
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
endif

" ----------------------------------------------------------------------------
" printing
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" messages and info
" ----------------------------------------------------------------------------

set noshowmode

" ----------------------------------------------------------------------------
" selecting text
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" editing text
" ----------------------------------------------------------------------------
set backspace=indent,eol,start " Makes backspace behave like most editors

set textwidth=72 " Sets wrapping point at 72 characters

set formatoptions=cqn

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j          " Delete comment char on second line when
    " Joining two commented lines
endif

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and
  " cursor position
  call cursor(l, c)
endfunction

" ----------------------------------------------------------------------------
" tabs and indenting
" ----------------------------------------------------------------------------

set tabstop=2 " Tab=2 spaces
set shiftwidth=2 " Auto-indents 2 spaces
set smarttab " Tab in front of a line inserts 'shiftwidth' spaces
set shiftround " Round to 'shiftwidth' for << and >>
set expandtab " Tabs insert 'tabstop' spaces instead of one tab
set autoindent " Better indentation

set pastetoggle=<F3> " Toggles smart indenting while pasting, A.K.A lifesaver

" ----------------------------------------------------------------------------
" folding
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" diff mode
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" mapping
" ----------------------------------------------------------------------------

let mapleader = ","

" netrw
nnoremap <leader>n :e .<CR>

" Fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push origin

" Fswitch mappings
nnoremap <leader>fs :FSHere<CR>
nnoremap <leader>fsr :FSSplitRight<CR>
nnoremap <leader>fsl :FSSplitLeft<CR>

" Open vimrc file in a new tab for editing
nnoremap <leader>ev :tabe ~/.dotfiles/vimrc<CR>

" Open listing of all buffers
nnoremap <leader>l :ls<CR>:b

" Save file
nnoremap <leader>w :w<CR>

" Saves file and runs make! test
" nnoremap <leader>t :w<CR> :make! test<CR>

" Delete current buffer
nnoremap <leader>d :bd %<CR>

" Makes saving a little easier :P
nnoremap ; :

" Trim whitespace, yay!
nnoremap <silent> <leader>W :call <SID>StripTrailingWhitespaces()<CR>

" Thank god, no more ESC key
inoremap jj <ESC>

" Better line navigation
nnoremap j gj
nnoremap k gk

" Delete all buffers except for current
nnoremap <leader>da :BufOnly<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Forgot to sudo? No problem ;)
cmap w!! w !sudo tee % >/dev/null

" ----------------------------------------------------------------------------
" reading and writing files
" ----------------------------------------------------------------------------

set autoread "re-reads file changed outside of vim

" ----------------------------------------------------------------------------
" the swap file
" ----------------------------------------------------------------------------

set nobackup
set noswapfile

" ----------------------------------------------------------------------------
" command line editing
" ----------------------------------------------------------------------------

set history=200 " Save more commands in history

set wildmode=longest,full " see :help wildmode for options

" Makes wild menu ignore these file types
set wildignore+=*.exe,*.swp,.DS_Store
set wildmenu

if exists('&wildignorecase')
  set wildignorecase
endif

" ----------------------------------------------------------------------------
" executing external commands
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" running make and jumping to errors
" ----------------------------------------------------------------------------

" Runs make
nnoremap <leader>m :make!<CR>

" Run C++ program
nnoremap <leader>r :!./bin/

" Runs make, runs program
nnoremap <leader>mr :make!<CR> :!./bin/

" Runs make test
nnoremap <leader>mt :make! test<CR>

" Arduino compile and upload
nnoremap <leader>mu :make! upload<CR>

" Arduino  monitor
nnoremap <leader>mm :make! monitor<CR>

" Arduino compile upload and monitor
nnoremap <leader>mum :make! upload<CR> :make! monitor<CR>


" ----------------------------------------------------------------------------
" language specific
" ----------------------------------------------------------------------------

" ----------------------------------------------------------------------------
" multi-byte characters
" ----------------------------------------------------------------------------

set encoding=utf-8 " C'mon, this is obvious

" ----------------------------------------------------------------------------
" Plugin Settings
" ----------------------------------------------------------------------------

" ctrlp
let g:ctrlp_cmd = 'CtrlPMixed' " Lets ctrlp search for
                      " buffers, files, and MRU's

let g:ctrlp_match_window_bottom = 0 " Shows ctrlp window on top
let g:ctrlp_by_filename = 1
let g:ctrlp_max_height = 10 " Sets max height of ctrlp window
let g:ctrlp_clear_cache_on_exit = 0 " Keeps cache when exiting
let g:ctrlp_mruf_max = 250 " Number of recently opened files

" DelimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" YouCompleteMe
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

" Ultisnips
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

" Syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'
let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_check_on_open=1

" netrw
let g:netrw_preview=1
let g:netrw_special_syntax=1
let g:netrw_banner=0
let g:netrw_localrmdir='rm -rf'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" ----------------------------------------------------------------------------
" various
" ---------------------------------------------------------------------------

set gdefault " Defaults global argument in substitution command
vnoremap > >gv
vnoremap < <gv

" ----------------------------------------------------------------------------
" Functions
" ----------------------------------------------------------------------------

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<c-n>"
    else
      return "\<tab>"
    endif
  endif

  return ""
endfunction

" ----------------------------------------------------------------------------
" Autocmds
" ----------------------------------------------------------------------------

augroup formatting
  autocmd bufenter *.md,*.markdown,*.txt,gitcommit setlocal formatoptions+=t
  autocmd bufenter *.md,*.markdown,*.txt,gitcommit setlocal spell
augroup END

augroup relativenumber
  autocmd InsertEnter,focusLost * :set norelativenumber
  autocmd InsertLeave,focusGained * :set relativenumber
augroup END

" Better integration between YouCompleteMe and UltiSnips
autocmd BufEnter * exec "inoremap <buffer> <silent> " . g:UltiSnipsExpandTrigger . " <c-r>=g:UltiSnips_Complete()<CR>"
