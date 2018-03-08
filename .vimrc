call pathogen#infect()
syntax on
filetype plugin indent on

set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set ruler
set splitright
set relativenumber
set number
set textwidth=80
set formatoptions-=t
set colorcolumn=+1
set laststatus=2
set noshowmode
set foldmethod=syntax
set foldlevel=20
set splitbelow
set splitright
set cursorline
set tags+=gems.tags
set iskeyword+=-
set updatetime=250

let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
let g:solarized_termcolors = 16
let g:solarized_termtrans = 1
set background=dark
colorscheme monokai
highlight Comment cterm=italic

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'base16_monokai'

let g:closetag_filenames = "*.html,*.erb,*.js,*.jsx"
let g:jsx_ext_required = 0
let g:closetag_filenames = "*.html,*.js,*.erb"

let g:gitgutter_max_signs = 100

runtime macros/matchit.vim

autocmd FileType ruby,scss,css,coffee,javascript autocmd BufWritePre <buffer> :%s/\s\+$//e

" Disable automatic comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ \|\ sed\ 's/;$//'

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<Tab>"
    else
        return "\<C-p>"
    endif
endfunction
inoremap <Tab> <C-r>=InsertTabWrapper()<CR>
inoremap <S-Tab> <C-n>

nnoremap <tab> za
nnoremap <leader>a :Ggrep 
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

autocmd QuickFixCmdPost grep cwindow

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" copy to system clipboard
map gy "*y
" copy whole file to system clipboard
nmap gY gg"*yG

autocmd FileType javascript.jsx,javascript setlocal formatexpr=
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ \|\ sed\ 's/;$//'
