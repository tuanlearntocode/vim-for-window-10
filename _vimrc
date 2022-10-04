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
set tabstop=2
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
	colorscheme nord
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
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
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
nnoremap <C-s> :w<cr>:w<cr>
inoremap <C-s> <ESC>:w<cr>:w<cr>
inoremap <C-Enter> <ESC>o
inoremap <C-S-Enter> <ESC>O
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

"Auto save config {{{
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_events = ["InsertLeave", "TextChanged"]
"}}}

"Markdown-preview{{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 1

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'
"}}}
