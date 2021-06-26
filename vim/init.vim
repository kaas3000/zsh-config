" Fish doesn't play all that well with others
set shell=/bin/bash

set number

set smartindent
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" Vim Plug plugin manager
call plug#begin(stdpath('config') . '/plugged')
" Make sure you use single quotes

" UI
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'wfxr/minimap.vim'

" Theme
Plug 'folke/tokyonight.nvim'

" Controls
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Other
Plug 'ciaranm/securemodelines'
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()


colorscheme tokyonight
let g:lightline = {'colorscheme' : 'tokyonight'}

" Install language servers
let g:coc_global_extensions = ['coc-rust-analyzer', 'coc-tsserver']

" Change the leader key to spacebar
nnoremap <SPACE> <Nop>
let mapleader = " "
map <leader>h :noh<CR>

" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
" > Enter visual line mode with <Space><Space>
nmap <leader><leader> <c-^>
" > Copy & paste to system clipboard with <Space>p and <Space>y
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P
" > Better region expanding shortcuts
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"
" FZF
"
" <leader>n for files search
nmap <leader>n :Files<CR>
" <leader>o for symbols in current file
nmap <leader>o :CocList outline<CR>
" <leader>f for Rg search
noremap <leader>f :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif



"
" Editor config
"
set noshowmode
set hidden

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>q to show documentation in preview window.
nmap <leader>q :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Permanent undo
set undodir=~/.vimdid
set undofile

" Minimap
let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1


" Center cursor after naviation
nmap ]m ]mzz
nmap [m [mzz
nmap n nzz
nmap N nzz
nmap { {zz
nmap } }zz
