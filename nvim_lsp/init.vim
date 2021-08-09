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

"syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Themes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes' "A collection of themes for vim-airline 
Plug 'vim-airline/vim-airline'
call plug#end()
lua << EOF
require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.html.setup{}
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

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" my Settings VIM start
"**********************************************
set smarttab
set cindent
set wrap
 
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

set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
"**********************************************
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

