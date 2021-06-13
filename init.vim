"nnoremap <c-i> :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :Files<cr>
nnoremap <c-f> :Ag<space>

call plug#begin('~/.config/nvim/plugged')

Plug 'dikiaap/minimalist' "Dark Theme

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align' "A Vim alignment plugin better spaces around words

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'maxmellon/vim-jsx-pretty' "[Vim script] JSX and TSX syntax pretty highlighting for vim. 

Plug 'tpope/vim-fugitive' "fugitive.vim: A Git wrapper so awesome, it should be illegal 
Plug 'vim-airline/vim-airline' "lean & mean status/tabline for vim that's light as air
Plug 'vim-syntastic/syntastic' "Syntax checking hacks for vim 


"Plug 'terryma/vim-multiple-cursors' "True Sublime Text style multiple selections for Vim 

"Plug 'sheerun/vim-polyglot'

Plug 'jiangmiao/auto-pairs'

Plug 'ncm2/ncm2' "Slim, Fast and Hackable Completion Framework for Neovim 

Plug 'pangloss/vim-javascript' " Vastly improved Javascript indentation and syntax support in Vim. 

"Plug 'HerringtonDarkholme/yats.vim' " Yet Another TypeScript Syntax The most advanced TypeScript Syntax Highlighting in Vim 

"Plug 'Quramy/tsuquyomi' "A Vim plugin for TypeScript 

Plug 'dense-analysis/ale' "Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support 

Plug 'ryanoasis/vim-devicons' "Adds file type icons to Vim plugins such as: NERDTree, vim-airline, CtrlP, unite, Denite, lightline, vim-startify and many more 

Plug 'airblade/vim-gitgutter' " A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks. 

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'leafgarland/typescript-vim' "Typescript syntax files for Vim 

"Plug 'ianks/vim-tsx'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'vim-airline/vim-airline-themes' "A collection of themes for vim-airline 

"Plug 'ayu-theme/ayu-vim' "Modern theme for modern VIMs 

"Plug 'AlessandroYorba/Alduin' "Theme dark

Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' } "FlatColor vim colorscheme 

call plug#end()

" Area history colorscheme start
"colorscheme ayu
colorscheme minimalist
"colorscheme challenger_deep
" Area history colorscheme end

" "if has('nvim') || has('termguicolors')
"  set termguicolors
"endif


"let g:alduin_Shout_Dragon_Aspect = 1
"colorscheme alduin 

set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*

" my Settings VIM start
set wrap
"set cindent
set background=dark
 
set termguicolors " enable true colors support

set tabstop=2 "Tamanho da indentacao"

"identifica o tipo de arquivo e auto indenta o mesmo"
filetype plugin indent on 

syntax on

set shiftwidth=2 "Deixar coerente a identacao com o tamnaho de Tab"

set backspace=2 "comportamento usual do backspace"

set number "esse comando serve para numerar as linhas"

set relativenumber "faz o calculo da distancia das linhas"

set hlsearch "destaque nos resultados"

set incsearch "busca incremental - traz feedback enquanto busco"

"Atalho do Emmet
let g:user_emmet_leader_key=','

"usar space no lugar de Tab
set expandtab

"backspace respeitar identacao
set softtabstop=2
" my Settings VIM End

" always uses spaces instead of tab characters
let g:javascript_plugin_jsdoc = 1
let g:vim_jsx_pretty_highlight_close_tag = 1
let g:vim_jsx_pretty_colorful_config = 1  
syntax enable

" Syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['javascript']
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Airline.
"let g:airline_theme='ayu'
"let g:airline_theme='minimalist'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" Coc
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
inoremap <silent><expr> <c-space> coc#refresh()
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
