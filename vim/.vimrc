"" __   __  ___   __   __ 
""|  | |  ||   | |  |_|  |
""|  |_|  ||   | |       |
""|       ||   | |       |
""|       ||   | |       |
"" |     | |   | | ||_|| |
""  |___|  |___| |_|   |_|
""

"Leader is \ by default"

syntax enable
filetype off
filetype indent on
filetype plugin indent on

set encoding=utf-8
set number
set relativenumber
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set nocompatible
set incsearch
set hlsearch
set autoindent
set autochdir
set foldmethod=indent
set t_RV=
set termguicolors
""set t_Co=256

colorscheme onehalfdark

" Set Background color"
"""""""""""""""""""""""""""""
set background=dark
""hi Normal ctermbg=black
""hi Normal ctermbg=238

" Airline Status "
let g:airline_theme='zenburn'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%3p%% %l/%L :%c'

" Auto fill brackets and quotes"
""""""""""""""""""""""""""""""""""
:inoremap ( ()<Esc>i
:inoremap " ""<Esc>i
:inoremap [ []<Esc>i
:inoremap { {}<Esc>i
:inoremap ' ''<Esc>i

" Vundle Plugin "
""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Add plugins here"
""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Yggdroot/indentLine'
Plugin 'sillybun/vim-repl'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-startify'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

call vundle#end()

" Template Files "
""""""""""""""""""""""""""""""""""

"Bash Template"
"
if has("autocmd")
    augroup templates
      autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    augroup END
endif

"Python Template"
"
if has("autocmd")
    augroup templates
      autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    augroup END
endif

"Snipped Completion"
"""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<Enter>"

"Buffers"
"""""""""""""
"next buffer"
nnoremap <leader><Tab> :bn<Cr> 
"previous buffer"
nnoremap <leader><Backspace> :bp<Cr> 
"delete buffer"
nnoremap <leader>x :bd<Cr> 

"Execute Terminal from Vim"
""""""""""""""""""""""""""""""""
" \ + t "
nnoremap <leader>t :bo term<Cr>

"Launch fzf"
"""""""""""""
nnoremap <leader>f :Files<Cr>

"Launch Markdown Preview"
"""""""""""""""""""""""""
" \ + m "
nnoremap <leader>m :!~/.vim/mdp %<Cr>

"Execute Python file from Vim"
""""""""""""""""""""""""""""""""
" \ + e "
nnoremap <leader>e :bel term python3 %<Cr>

" \ + p"
nnoremap <leader>p :!python3 %<Cr>

"YouCompleteMe"
"""""""""""""""""""""""""""""""""
"auto close scratch preview"
let g:ycm_autoclose_preview_window_after_insertion=1

"Indentline"
"""""""""""""""""""""""""""""""""
let g:indentLine_faster = 1
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1
let g:indentLine_fileTypeExclude = [ 'startify' ]

"REPLToggle Mapping"
"""""""""""""""""""""""""""""""""
" leader + r 
nnoremap <leader>r :REPLToggle<Cr>

"NERDTree"
"""""""""""""""""""""""""""""""""
" NERDTree short cut ctl + n
map <C-n> :NERDTreeToggle<CR>

" Open NERDTree auto when no file is specified"
""autocmd StdinReadPre * let s:std_in=1
""autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" NERDTree show hidden files "
let NERDTreeShowHidden=1

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1

"Insert New Line"
"""""""""""""""""""""""""""""""""
map <Space><Space> O<Esc>

" Switch from vertical to horizontal"
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>h :windo wincmd H<CR>

" Switch from horizontal to vertical"
""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>v :windo wincmd K<CR>

" Dont record Macro / Register in viminfo"
""""""""""""""""""""""""""""""""""""""""""""
let regs = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
for r in regs
  call setreg(r, [])
endfor 

" Hide Highlighted Search"
"""""""""""""""""""""""""""
nnoremap <leader>c :nohl<CR>

" Spell Check Toggle "
""""""""""""""""""""""""
let b:myLang=0
let g:myLangList=["nospell","en_us"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction

nmap <silent> <leader>s :call ToggleSpell()<CR>

" Launch color column on python files "
"""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal colorcolumn=80

" Starify "
"""""""""""
let g:startify_custom_header =
       \ startify#center(split(system('figlet -w 100 VIM'), '\n'))
let g:startify_center=50
