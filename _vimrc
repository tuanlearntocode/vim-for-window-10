"Basic config {{{
syntax on 
filetype indent on 
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=marker
set number
set relativenumber
set clipboard=unnamed
set backspace=2
set noswapfile
set nobackup
set noundofile
set nowritebackup
set noerrorbells
set vb t_vb=
set cursorline
set hidden
set mouse=nvi
set expandtab
set smarttab
set shiftwidth=8
set tabstop=4
set hlsearch
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set nowrap
set fillchars+=vert:\  
set signcolumn=yes
set shortmess+=c 
set updatetime=300
if has("gui_running")
	set guioptions-=m
	set guioptions-=T
    set guioptions-=L
	set guioptions-=r
	set background=dark
	set guifont=hack\ nf:h13
	colorscheme gruvbox
    autocmd GUIEnter * simalt ~x
    autocmd BufEnter * lcd %:p:h
endif
"}}}

"Plugin {{{
call plug#begin('F:/Vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'voldikss/vim-floaterm'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
call plug#end()
"}}}

"Key mapping {{{
let mapleader = " "
inoremap jk <ESC> 
vnoremap jk <ESC>
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h
nnoremap <leader>sv :source $MYVIMRC <CR>
"moving code around
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
"}}}

"Airline config {{{
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline')
        let g:airline={}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
if !exists('g:airline_symbols')
        let g:airline_symbols={}
endif
let g:airline_symbols.colnr = ''
let g:airline_symbols.linenr = ' '
let g:airline_detect_modified = 1
let g:arline_symbols_ascii = 1
let g:airline_powerline_fonts = 1
let g:airline_stl_path_style = 'short'

"}}}

"DevIcon config {{{
if !exists('g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols')
        let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
endif
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
"}}}

"IndentLine Config {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_color_change_percent = 10
"}}}

"Coc Config {{{
"Tab navigation
function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" 

"<CR> for confirm completion
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"Trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

"Go to code navigation 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"Preview document
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"Rename
nmap <leader>rn <Plug>(coc-rename)

let g:coc_global_extensions = [
  \ 'coc-pyright',
  \ 'coc-emmet',
  \ 'coc-prettier',
  \ 'coc-html',
  \ 'coc-css',
  \ ]
"}}}

"Coc Prettier {{{
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"}}}

"Floaterm config{{{
let g:floaterm_keymap_toggle = '<F12>'
let g:floaterm_wintype='float'
let g:floaterm_position='right'
"}}}

" NerdTree Config{{{
nnoremap <leader>e :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" }}}

" Vim nerdtree syntax highlight {{{
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
" }}}

" TagAlong Config {{{
let g:tagalong_filetypes = ['eco', 'eelixir', 'ejs', 'eruby', 'html', 'htmldjango', 'javascriptreact', 'jsx', 'php', 'typescriptreact', 'xml']
" }}}
