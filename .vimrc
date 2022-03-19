" Execucao do gerenciador de plugins
execute pathogen#infect() 

set termguicolors " enable true colors support

let ayucolor="dark"   " for dark version of theme
colorscheme ayu " Theme do vim

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