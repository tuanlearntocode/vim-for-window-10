"Basic Config{{{
syntax on 
filetype indent on 
set encoding=utf-8
set foldmethod=marker
set number
set relativenumber
set clipboard=unnamedplus
set guifont=FiraCode\ NF:h13
set backspace=2
set noswapfile
set nobackup
set nowritebackup 
set noerrorbells
set vb t_vb=
" set guioptions+=m 
" set guioptions+=T
colorscheme dracula
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
call plug#end()
"}}}

"CocInstall {{{
let g:coc_global_extensions = [
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-git',
  \ 'coc-pyright',
  \ 'coc-emmet'
  \ ]
"}}}

"Coc Config{{{
"cài d?t cho tab, shift-tab
verbose imap <tab>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


"Ð?i tên hàm
nmap <leader>rn <Plug>(coc-rename)

"" Map Ctrl + Space d? show list functions/bi?n autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

"" T? d?ng import file c?a bi?n/function khi ch?n và nh?n Tab
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"
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

"Vimtex Config{{{
" let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_general_viewer = 'okular'
let maplocalleader=','
"}}}

