require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
  
    -- Colorscheme
    use 'ellisonleao/gruvbox.nvim'
  
    --Line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
  
    --Format
    use 'sbdchd/neoformat'
  
    -- LSP
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},
        {'williamboman/nvim-lsp-installer'},
  
        -- Autocompletion
        {'hrsh7th/nvim-cmp'},
        {'hrsh7th/cmp-buffer'},
        {'hrsh7th/cmp-path'},
        {'saadparwaiz1/cmp_luasnip'},
        {'hrsh7th/cmp-nvim-lsp'},
        {'hrsh7th/cmp-nvim-lua'},
  
        -- Snippets
        {'L3MON4D3/LuaSnip'},
        {'rafamadriz/friendly-snippets'},
      }
    }
  end)
  
  -- LSP setup
  local lsp = require('lsp-zero')
  lsp.preset('recommended')
  lsp.nvim_workspace()
  lsp.setup()
  -- Tab set to two spaces
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.softtabstop = 2
  vim.opt.expandtab = true
  vim.opt.signcolumn = 'yes'
  
  --esse comando serve para numerar as linhas--
  vim.opt.number = true
  
  --faz o calculo da distancia das linhas--
  vim.opt.relativenumber = true
  --destaque nos resultados--
  vim.opt.hlsearch = true

  --busca incremental - traz feedback enquanto busco--
  vim.opt.incsearch = true

  vim.opt.termguicolors = true
  vim.o.background = "dark" -- or "light" for light mode
  pcall(vim.cmd, 'colorscheme gruvbox')

-- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_d = {'filesize'},
    lualine_e = {'hostname'},
    lualine_f = {'mode'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}

  },
  inactive_sections = {
    lualine_c = {'filename'},
    lualine_x = {'location'},
  },

  tabline = {},
  extensions = {}
}