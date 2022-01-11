"Basic Config{{{
syntax on 
filetype indent on 
set encoding=utf-8
set fileencoding=utf-8
set foldmethod=marker
set number
set relativenumber
set clipboard=unnamedplus
set backspace=2
set noswapfile
set nobackup
set nowritebackup 
set noerrorbells
set vb t_vb=
set cursorline
highlight CursorLine gui=underline cterm=underline
au GUIEnter * simalt ~x
if has("gui_running")
 set guioptions-=m 
 set guioptions-=T
 "No scroll bar
 set guioptions-=r
 colorscheme dracula
 set background=dark
 set guifont=hack\ NF:h13
 " set guifont=Consolas:h13:b
endif

"}}}

"Key Binding{{{
let mapleader=','
inoremap jk <esc>
vnoremap jk <esc>
nnoremap <leader>sv :so%<cr>
nnoremap <leader>ev :e $MYRIMRC<cr>
"}}}

"Plugin{{{ 
call plug#begin('F:\Vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-commentary'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/goyo.vim'
Plug 'chrisbra/unicode.vim'
Plug 'lervag/vimtex'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
"This is for snippet 
call plug#end()
"}}}

"CocInstall {{{
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-git',
  \ 'coc-pyright',
  \ 'coc-emmet',
  \ 'coc-prettier',
  \ 'coc-pairs',
  \ ]
"}}}

"Coc Config{{{
"cài d?t cho tab, shift-tab
function! s:check_back_space() abort
	let col = col('.')-1
	return !col || getline('.')[col-1] =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"make <cr> for confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"Ð?i tên hàm
nmap <leader>rn <Plug>(coc-rename)

"" Map Ctrl + Space d? show list functions/bi?n autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

"" T? d?ng import file c?a bi?n/function khi ch?n và nh?n Tab
" inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
"" Go to definition ? tab m?i
nmap <silent> gd :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"}}}

"Floaterm Config{{{
let g:floaterm_keymap_new = '<leader>ft'
let g:floaterm_keymap_toggle = '<F12>'
"}}}

""Goyo configuration for presentation{{{
"autocmd BufNewFile,BufRead *.md call SetVimPresentationMode()
"function SetVimPresentationMode()
"  nnoremap <buffer> <Right> :n<CR>
"  nnoremap <buffer> <Left> :N<CR>

"  if !exists('#goyo')
"    Goyo
"  endif
"endfunction
""}}}

"Airline Config{{{
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
nnoremap <right> <nop>
nnoremap <left> <nop>
nnoremap <right> :tabn<cr>
nnoremap <left> :tabp<cr>
"}}}

"Prettier Config{{{
" :CocConfig
"Add "coc.preferences.formatOnSaveFiletypes": ["css", "markdown", "html",
""python"],
"}}}
