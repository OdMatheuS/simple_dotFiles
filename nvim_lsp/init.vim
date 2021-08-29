call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'anott03/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/lsp_signature.nvim'

"Git and FZF
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive' "fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files

" telescope requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" prettier
Plug 'sbdchd/neoformat'

"Auto pairs
Plug 'jiangmiao/auto-pairs'

" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

"syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes' "A collection of themes for vim-airline
Plug 'vim-airline/vim-airline'
call plug#end()

lua << EOF
  require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
  require'nvim-treesitter.configs'.setup {
    indent = {
    enable = true
    }
  }
  require'nvim-treesitter.configs'.setup {
    highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
      },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
    },
  }
EOF

let g:gruvbox_contrast_dark = 'hard'
  if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif

let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

".:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
"telescope key Thanks ThePrimeagen
let mapleader = " "
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Search:")})<CR>

".:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
"Remove WhiteSpaces Thanks ThePrimeagen
fun! TrimWhiteSpaces()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
  autocmd!
  autocmd BufWritePre * :call TrimWhiteSpaces()
augroup END
".:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
"Prettier configs indentation
let g:standard_prettier_settings = {
      \ 'exe': 'prettier',
      \ 'args': ['--stdin', '--stdin-filepath', '%:p', '--single-quote'],
      \ 'stdin': 1,
      \ }

let g:nvim_typescript#javascript_support=1
let g:neoformat_javascript_prettier = g:standard_prettier_settings
let g:neoformat_typescriptreact_prettier = g:standard_prettier_settings
let g:neoformat_try_formatprg = 1
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_typescript = ['prettier']

augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript,javascript.jsx setlocal formatprg=prettier\
        \--stdin\
        \--print-width\ 80\
        \--single-quote\
        \--trailing-comma\ es5
  autocmd BufWritePre *.js,*.jsx Neoformat
augroup END

" my Settings VIM start
".:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.
set smarttab
set cindent
set wrap
set termguicolors " enable true colors support
set tabstop=2 "Tamanho da indentacao"

set guicursor=n-v:blinkon1 "Finaly cursor blink mode, thanks https://github.com/wez/wezterm/issues/1073"

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

"vertical bar limit
set colorcolumn=110

"Necessário p/ manter vários buffers abertos
set hidden

"open vertical split right
set splitright

" Ignore show files
set wildignore+=*_build/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
".:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:._.:*~*:.

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

