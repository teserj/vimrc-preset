syntax on

call plug#begin('~/.vim/plugged')
"---------- PLUGIN STARTS ----------
""---- colorscheme
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
""---- statusline
Plug 'itchyny/lightline.vim' " Lightweight status line than airline
Plug 'taohexxx/lightline-buffer'
""---- File finder
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
""---- Aynsc task
Plug 'skywind3000/asyncrun.vim'
""---- NERDTree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
""---- Git wrapper and tools
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify' " Faster than vim-gitgutter
""---- tag generator
Plug 'ludovicchabant/vim-gutentags' " Async auto-tagger
Plug 'skywind3000/gutentags_plus' " Gscope Finder
Plug 'skywind3000/vim-preview' " Gscope previewer
""---- code snippets
Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
""---- linting tool
Plug 'w0rp/ale'
""---- Auto completion
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'valloric/youcompleteme'
Plug 'Raimondi/delimitMate' " automatic closing of brackets, etc.
""---- autoformat tool
" TODO: C formatprogram is not provided: clang-format
Plug 'Chiel92/vim-autoformat'
""---- Split screen drawer
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
""---- Vim-tmux navigation
Plug 'christoomey/vim-tmux-navigator'
""---- Misc
Plug 'Shougo/echodoc.vim' " Quick function reference
Plug 'easymotion/vim-easymotion' " Quick keyboard motion
Plug 'vim-scripts/VisIncr' "Create incr/decr index entries
"---------- PLUGIN ENDS ----------
call plug#end()

"---------- GENERAL VIM SETTINGS ----------
set nocompatible
set notitle
set ruler
set number
set hidden
set hlsearch
set incsearch
set autoread
set wildmenu
set noerrorbells
set novisualbell
set smartcase
set mouse=a
set ttymouse=xterm2
set backspace=2
set laststatus=2 " Always display lightline
set noshowmode " Do not show vim mode for status line
set fileformats=unix,dos,mac
set fileencodings=utf-8,big5
set termencoding=utf-8
set encoding=utf-8
scriptencoding utf-8

if exists('$TMUX')
  set term=screen-256color
endif

if has('gui_running')
	set guioptions-=e
endif

"---------- TAB AND INDENTATION SETTINGS ----------
set showtabline=2 " always show tabline
set list listchars=tab:▶_
set autoindent
set smartindent
set noexpandtab
set tabstop=4
"set cindent
"set shiftwidth=4 " [cindent] 4 for general purpose, 8 for Linux

"---------- FONT SETTINGS ----------
"set gfn=Meslo\ LG\ M\ for\ Powerline\ 12 " GUI font
set gfn=Menlo\ for\ Powerline\ 13 " GUI font

"---------- COLORSCHEME SETTINGS - GRUVBOX ----------
let g:gruvbox_contrast_dark = 'medium'
set background=dark
colorscheme gruvbox

"---------- GENERAL KEY MAPPING ----------
"Workaround for xfce4-terminal to map Alt
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

let mapleader=" " " Remap <Leader> key to space bar

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" <Leader> + l     : list all buffers and jump to the specified buffer
" <Leader> + b/f/e : go back/forward/last-used
" <Leader> + 1~9   : go to buffer 1/2/3 etc
" <Leader> + q     : close current buffer
nnoremap <silent> <Leader>l :ls<CR>:b<space>
nnoremap <silent> <Leader>b :bp<CR>
nnoremap <silent> <Leader>f :bn<CR>
nnoremap <silent> <Leader>q :bd<CR>
nnoremap <silent> <Leader>e :e#<CR>
nnoremap <silent> <Leader>1 :1b<CR>
nnoremap <silent> <Leader>2 :2b<CR>
nnoremap <silent> <Leader>3 :3b<CR>
nnoremap <silent> <Leader>4 :4b<CR>
nnoremap <silent> <Leader>5 :5b<CR>
nnoremap <silent> <Leader>6 :6b<CR>
nnoremap <silent> <Leader>7 :7b<CR>
nnoremap <silent> <Leader>8 :8b<CR>
nnoremap <silent> <Leader>9 :9b<CR>

" Some keys are intercepted by terminal, preserved by vim or not suggested
" Alt + hjkl for split window nav
noremap <silent> <M-h>     :wincmd h<CR>
noremap <silent> <M-j>     :wincmd j<CR>
noremap <silent> <M-k>     :wincmd k<CR>
noremap <silent> <M-l>     :wincmd l<CR>
noremap <silent> <M-left>  :wincmd h<CR>
noremap <silent> <M-down>  :wincmd j<CR>
noremap <silent> <M-up>    :wincmd k<CR>
noremap <silent> <M-right> :wincmd l<CR>

" PageUp/PageDown
"noremap <C-k> <PageUp>
"noremap <C-j> <PageDown>
"noremap <C-h> 0
"noremap <C-l> $

" Select all
nnoremap <Leader>a ggVG<CR>
" Select current word
nmap * *<C-o>
" Make n/N search works
nmap n :norm! nzzzv<CR>
nmap N :norm! Nzzzv<CR>
" Unselect highlight areas
nnoremap <silent> <Leader>/ :nohl<CR>
" :h opens help in right split window
cabbrev h vert bo h

"---------- VIM-FUGITIVE SETTINGS -----------
"" \ keymaps
map <silent> <Leader>g :Gblame<CR>

"---------- VIM-SIGNIFY SETTINGS -----------
"" \ keymaps
map <silent> <Leader>d :SignifyDiff!<CR>
"" ]c [c : prev/next diff
"" "]C [C: first/last diff

"---------- EASYMOTION SETTINGS -----------
"" <Leader><Leader>+hjkl keymaps
map <Leader><Leader>h <Plug>(easymotion-b)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>l <Plug>(easymotion-w)

"---------- NERDTEE SETTINGS ----------
map <F2> :NERDTreeToggle<CR>

"---------- LEADERF SETTINGS ----------
"" ALT + qwert keymap sets
let g:Lf_ShortcutF = '<M-q>' " Search file
let g:Lf_ShortcutB = '<M-w>' " Search buffer
" Function search
noremap <M-e> :LeaderfFunction<CR>
" Most recently used
noremap <M-r> :LeaderfMru<CR>
" Fuzzy ctag search
noremap <M-t> :LeaderfTag<CR>

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

"---------- ASYNCRUN SETTINGS ----------
"" F* + \ keymaps
"Toggle quickfix window
nnoremap <silent> <F8> :call asyncrun#quickfix_toggle(6)<CR>
"Autorun make rule in current directory
nnoremap <silent> <F9> :AsyncRun make<CR>
"Async run command line
nnoremap <Leader>r :AsyncRun 

let g:asyncrun_open = 6

"---------- TAGS AND CSCOPE SETTINGS -----------
set tags=./.tags;,.tags
set cscopeprg=gtags-cscope

"---------- GUTENTAGS SETTINGS ----------
"Enable universal-ctags ang gtags-cscope support
let g:gutentags_modules = ['ctags', 'gtags_cscope']
" Search rule for root directory
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
" Tagfile name
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" Tagfile directory name
let g:gutentags_cache_dir = expand('~/.cache/tags')
if !isdirectory(expand('~/.cache/tags'))
   silent! call mkdir(expand('~/.cache/tags'), 'p')
endif

let g:gutentags_auto_add_gtags_cscope = 1

" Debug options
"let g:gutentags_trace = 1
let g:gutentags_define_advanced_commands = 1

"---------- STATUSLINE SETTINGS - LIGHTLINE ----------
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ],
	\ },
	\ 'tabline': {
	\   'left': [ [ 'bufferinfo' ],
	\             [ 'separator' ],
	\             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
	\   'right': [ [ 'close' ], ],
	\ },
	\ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
	\ 'component_expand': {
	\   'buffercurrent': 'lightline#buffer#buffercurrent',
	\   'bufferbefore': 'lightline#buffer#bufferbefore',
	\   'bufferafter': 'lightline#buffer#bufferafter',
	\ },
	\ 'component_type': {
	\   'buffercurrent': 'tabsel',
	\   'bufferbefore': 'raw',
	\   'bufferafter': 'raw',
	\ },
	\ 'component_function': {
	\   'gitbranch': 'fugitive#head',
	\   'bufferinfo': 'lightline#buffer#bufferinfo',
	\ },
	\ 'component': {
	\   'separator': '',
	\ },
\ }

" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = '◕ '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" enable devicons, only support utf-8
" require <https://github.com/ryanoasis/vim-devicons>
let g:lightline_buffer_enable_devicons = 1
" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
" :help filename-modifiers
let g:lightline_buffer_fname_mod = ':t'
" hide buffer list
let g:lightline_buffer_excludes = ['vimfiler']
" max file name length
let g:lightline_buffer_maxflen = 30
" max file extension length
let g:lightline_buffer_maxfextlen = 3
" min file name length
let g:lightline_buffer_minflen = 16
" min file extension length
let g:lightline_buffer_minfextlen = 3
" reserve length for other component (e.g. info, close)
let g:lightline_buffer_reservelen = 20
 
"---------- YCM SETTINGS -----------
" CTRL + F* keymaps (<C-s> for auto complete, <C-y> for select)
" Preserve C-y for apply key
noremap <F7> :YcmGenerateConfig<CR>
noremap <C-y> <NOP>
let g:ycm_key_invoke_completion = '<C-s>'
let g:ycm_key_list_select_completion = [ '<TAB>', 'Down', 'Enter' ]
"let g:ycm_extra_conf_globlist = ['~/ycm_preset/*','!~/*']
let g:ycm_global_ycm_extra_conf='~/.vim/ycm_presets/c/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
set completeopt=menu,menuone
let g:ycm_semantic_triggers =  {
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
\ }

"---------- ALE SETTINGS -----------
noremap <F6> :ALELint<CR>
nmap <silent> <leader>an :ALENext<CR>
nmap <silent> <leader>ap :ALEPrevious<CR>
let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 1000
let g:ale_echo_delay = 100
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 0
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

let g:ale_linters = {
	\ 'sh': ['shell'],
	\ 'c': ['gcc'],
	\ 'cpp': ['gcc'],
\}

"---------- ULTISNIPS SETTINGS -----------
"" Alt keymaps
let g:UltiSnipsExpandTrigger="<M-x>"
let g:UltiSnipsJumpForwardTrigger="<M-z>"
let g:UltiSnipsJumpBackwardTrigger="<M-c>"
let g:snips_author="ShihChieh Lin"
let g:snips_mail="shihchieh.lin@augentix.com"
let g:snips_company="Augentix Inc."

" If you want :UltiSnipsEdit to split your window.
nnoremap <F10> :UltiSnipsEdit<CR>
let g:UltiSnipsEditSplit="vertical"

"---------- ECHODOC SETTINGS -----------
let g:echodoc_enable_at_startup=1

"----------DELIMITEMATE SETTINGS-----------------
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

"---------- AUTOFORMAT SETTINGS -----------
noremap <F3> :Autoformat<CR>:w<CR>
let g:formatterpath = [ '~/bin' ]
" Disable vim indent preference
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
let g:formatdef_augentix_c= '"clang-format-3.9"'
let g:formatters_c = ['augentix_c']
"let g:autoformat_verbosemode=1

"au BufWrite *.c,*.h :Autoformat

"---------- VIM-TMUX-NAVIGATOR SETTINGS -----------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

"---------- GUI SETTINGS -----------
set winaltkeys=no

"---------- MISC SETTINGS -----------

" Override highlight trailing spaces
highlight ExtraWhitespace ctermbg=darkblue guibg=darkblue ctermfg=white
call matchadd('ExtraWhitespace', '\s\+$')

" Override TODO/FIXME highlight
highlight cTodo cterm=bold gui=bold ctermbg=darkblue guibg=darkblue ctermfg=white
syntax match cTodo contained "\<\(TODO\|FIXME\):"

" Highlight column 81
let &colorcolumn=join(range(121,999),",")

" C style toggler
nnoremap <F4> :call ToggleTabWidth()<CR>
function ToggleTabWidth()
	if &tabstop == 8
		set tabstop=4
	else
		set tabstop=8
	endif
	retab
endfunction

" Buffer window diff
nnoremap <Leader><Leader>d :call ToggleWinDiff()<CR>
let s:windiff_toggled = 0
function! ToggleWinDiff()
	if s:windiff_toggled == 0
		let s:windiff_toggled = 1
		windo diffthis
	else
		let s:windiff_toggled = 0
		windo diffoff
	endif
endfunction
