syntax on

"---------- GENERAL VIM SETTINGS ----------
set nocompatible
set noshowmode
set showcmd
set number
set ruler
set title
set showtabline=2 " always show tabline
set scrolloff=5
set history=50
set autoread
set wildmenu
set noerrorbells
set novisualbell
set hlsearch
set incsearch
set smartcase
set backspace=indent,eol,start " 2 to make BS work like most other apps
set mouse=a
set ttymouse=xterm2
set fileformats=unix,dos,mac
set fileencodings=utf-8,big5
set termencoding=utf-8
set encoding=utf-8


"---------- TAB AND INDENTATION SETTINGS ----------
set list listchars=tab:▶_
set noexpandtab
set tabstop=8
set shiftwidth=4 " 4 for general purpose, 8 for Linux
set softtabstop=4 " 4 for general purpose, 8 for Linux
set smartindent
" set cindent


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"---------- PLUGIN STARTS ----------
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" STATUS BAR
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'itchyny/lightline.vim'

"" UTILITIES
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate' " automatic closing of brackets, etc.
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive' " Git management
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'simplyzhao/cscope_maps.vim.git'
Plugin 'vim-scripts/taglist.vim.git'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'majutsushi/tagbar' " alternative of taglist
"Plugin 'christoomey/vim-tmux-navigator'

"" COLORSCHEMES
Plugin 'flazz/vim-colorschemes'

"" MISC
Plugin 'wesleyche/SrcExpl.git'
"Plugin 'wesleyche/Trinity'
"Plugin 'vivien/vim-linux-coding-style.git'

call vundle#end()
"---------- PLUGIN ENDS ----------
filetype indent plugin on

"---------- CSCOPE AND CTAG SETTINGS ----------
set cscopetagorder=1
nmap <F12> :!cscope -Rbq<CR>:!ctags -R *<CR>
"---------- AIRLINE AND COLORSCHEME SETTINGS ----------
set laststatus=2 " status line
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans = 1
set background=dark
set gfn=Meslo\ LG\ M\ for\ Powerline\ 12

"if has('gui_running')

"  set t_Co=256
"  set background=light
"else
"  set t_Co=256
"  set background=dark

"endif

colorscheme solarized


" Override Highlight Trailing spaces
highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue ctermfg=white
call matchadd('ExtraWhitespace', '\s\+$')

"---------- LIGHTLINE SETTINGS ----------
"let g:lightline = {
"  \ 'colorscheme': 'seoul256',
"  \ 'component': {
"  \   'readonly': '%{&readonly?"x":""}',
"  \ },
"  \ 'separator': { 'left': '', 'right': '' },
"  \ 'subseparator': { 'left': '|', 'right': '|' }
"  \ }

"-------- SYNTASTIC SETTINGS---------
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
let g:syntastic_c_compiler ='gcc'
let g:syntastic_c_include_dirs = ['inc', 'includes', 'headers']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive' }

nmap <F9> :SyntasticToggleMode<CR>
nmap <Leader><F9> :SyntasticCheck<CR>

"augroup mySyntastic
""    au!
"    au FileType tex let b:syntastic_mode = "passive"
"augroup END

"---------- NERDTREE SETTINGS ----------
nnoremap <silent> <F3> :NERDTreeToggle<CR>
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0
let g:NERDTreeWinPos = "left"

"---------- TAGLIST KEY BINDING ----------
nnoremap <silent> <Leader><F2> :Tlist<CR>
let g:Tlist_Use_Right_Window=1

"---------- TAGBAR KEY BINDING ----------
nnoremap <silent> <F2> :TagbarToggle<CR>
let g:tagbar_sort = 0
"let g:tagbar_autoclose=2
""autocmd BufEnter * nested :call tagbar#autoopen(0)

"---------- EASYMOTION SETTINGS ----------
" Easymotion key binding
map <Leader> <Plug>(easymotion-prefix)

"---------GIT SETTINGS--------------
map <Leader>g :Gblame<CR>
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only = 1

"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"-----------TMUX SETTINGS--------------
let g:tmux_navigator_save_on_switch = 2

"---------- SOURCE EXPLORER SETTING ----------
" // The switch of the Source Explorer
nnoremap <silent> <F4> :SrcExplToggle<CR>
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8
" // Set ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 1000
" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"
" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"
" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
"let g:SrcExpl_pluginList = [
""    \ "__Tag_List__",
""    \ "__Tagbar__.1",
""    \ "Source_Explorer",
""    \ "NERD_tree_1",
""    \ ]
" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1
" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0
" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."
" // Set "<F11>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F11>"

nnoremap <silent> <F5> :NERDTreeToggle<CR>:TagbarToggle<CR>:SrcExplToggle<CR>
" tags in parent diractories
" set tags=./tags,tags;$HOME

"---------- KEY BINDINGS ----------
imap <C-k> <up>
imap <C-j> <down>
imap <C-h> <left>
imap <C-l> <right>

nnoremap <C-k> <C-b>
nnoremap <C-j> <C-f>
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" Tabline in airline could display buffers
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-b> :bd<CR>
nnoremap <C-n> :tabnew<CR>
"nnoremap <C-h> :tabp<CR>
"nnoremap <C-l> :tabn<CR>
nnoremap <silent> <C-c> :nohl<CR>
nnoremap wgf <C-w>gf
nnoremap ; :
vmap ; :
nnoremap <tab> v>
nnoremap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

nnoremap * *<c-o>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap H ^
nnoremap L $

"---------- MISC ----------
set t_RV= " Supress garbage chars received from terminal
