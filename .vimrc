" show line numbers
set number

" show the line on the bottom that tells you where in the document you are
set ruler

" setup how wide tabstops and shifts should be
set tabstop=4           " add 4 spaces whenever I press <tab>
set shiftwidth=4
set softtabstop=4       " one stroke of <backspace> will delete 4 spaces (the width of one <tab>)
set expandtab
set autoindent

set wrap
set linebreak

" don't do stupid stuff just to be compatible to vi
set nocompatible 

" prettyfying it.
colorscheme solarized "desertEx
" set guifont=Monaco:h12
set guifont=Source\ Code\ Pro\ Light:h13
set cursorline
set mouse=ar

" searching
set incsearch
set showmatch
set hlsearch

" misc useful stuff
set encoding=utf-8
set scrolloff=3		" scrolling starts 3 lines before top/bottom of screen
set showmode		" prints in what mode (INSERT, VISUAL, etc) vim is in
set wildmenu
set wildmode=list:longest	" better tab completion for file names
set visualbell		" don't beep upon error
set ttyfast			" faster scrolling
set laststatus=2	" always show statusbar

" used by other plugins
call pathogen#infect()
filetype plugin indent on

" key mappings
let mapleader = ","
nnoremap ü <C-]>		    	" jump to tag under cursor
nnoremap + <C-T>                " jump back
map Ü :TlistToggle <CR>     	" toggle the tags list
map * :NERDTreeToggle <CR>	    " toggles the NerdTree
map ö :tabprev <CR>			    " move through tabs
map ä :tabnext <CR>			    " move through tabs, but differently
map # :A <CR>                   " switch to header file
map <leader>/ :let @/="" <CR>   " clear highlite of last search 
map <leader>r :!ctags -R <CR>
" make r-alt + ß create a backspace
imap ¿ \

" call OmniCppCompletion with Control-Space -- do I have to write this comment
" here on top?!
imap <C-Space> <C-X><C-O>


" custom commands
nmap <silent> <leader>cd :cd %:p:h <CR> " go to cwd
nmap <silent> <leader>ev :tabe ~/.vimrc <CR> " edit the config file 
nmap <silent> <leader>sv :so ~/.vimrc <CR>   " source the config file

" settings for taglist
let Tlist_GainFocus_On_ToggleOpen = 1 		" will set the focus inside the taglist upon toggling
let Tlist_Show_One_File = 1					" will only display tags of the current file
let Tlist_Use_Right_Window = 1              " show Taglist on the right side
let Tlist_Process_File_Always = 1           " always build tags. needed for statusline
let Tlist_Display_Prototype = 1             " displays function prototypes in the list
let Tlist_Close_On_Select = 1               " closes the taglist whenever something was selected.

set statusline=[%n]\ %<%f\ %([%1*%M%*%R%Y]%)\ \ \ [%{Tlist_Get_Tagname_By_Line()}]\ %=%-19(\LINE\ [%l/%L]\ COL\ [%02c%03V]%)\ %P

" settings for OmniCppComplete
set completeopt=menu,menuone
set omnifunc=ccomplete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
let OmniCpp_ShowPrototypeInAbbr=1           " shows function prototype in the Completion-PopUp
let OmniCpp_SelectFirstItem=2               

" settings for command-t

" open files in new tab by default, press C-t to open in same tab
let g:CommandTAcceptSelectionMap = '<C-t>'
let g:CommandTAcceptSelectionTabMap = '<CR>'

let g:SuperTabDefaultCompletionType = "context"

map <leader><Tab> <Esc>i<Right><C-R>=TriggerSnippet()<CR>


autocmd FileType tex map <buffer> <leader>mp :!make pdf<CR>
autocmd FileType tex map <buffer> <leader>mc :!make clean<CR>
autocmd FileType tex map <buffer> <leader>mo :!open *.pdf<CR>
autocmd FileType tex map <buffer> i<D-i> \emph{} <ESC><Left>i
autocmd FileType tex imap <buffer> <D-i> \emph{} <ESC><Left>i

set matchtime=2

map <leader>b :silent !make pdf<CR>
