require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Colorscheme
  --use 'ellisonleao/gruvbox.nvim'
  --use 'shaunsingh/solarized.nvim'
  use 'EdenEast/nightfox.nvim'

  --Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  --Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  --TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  --Format
  use 'sbdchd/neoformat'

  --Linter
  use({
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
          require("null-ls").setup()
      end,
      requires = { "nvim-lua/plenary.nvim" },
  })

  --Visual Ident Guide Line
  use 'nathanaelkane/vim-indent-guides'

  --File Tree
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
      config = function() require'nvim-tree'.setup {} end
  }

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

vim.opt.tabstop = 2 -- Tab set to two spaces
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'
vim.opt.cursorline = true -- highlight the current line
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "99"
vim.opt.pumheight = 100000
vim.opt.guicursor = "n-v:blinkon1"

--vim.opt.transparent_window = true

--esse comando serve para numerar as linhas--
vim.opt.number = true

--faz o calculo da distancia das linhas--
vim.opt.relativenumber = true

--destaque nos resultados--
vim.opt.hlsearch = true

--busca incremental - traz feedback enquanto busco--
vim.opt.incsearch = true

vim.opt.termguicolors = true
--vim.o.background = "light" -- or "light" for light mode
--pcall(vim.cmd, 'colorscheme gruvbox')

--require('solarized').set()
pcall(vim.cmd, 'colorscheme nightfox')
require('lualine').setup {
  options = {
    -- ... your lualine config
    theme = 'solarized'
    -- ... your lualine config
  }
}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
  vim.api.nvim_set_keymap('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

  --Template pra chamar fn como se tivesse chamando igual no command default do Vim
  --vim.api.nvim_set_keymap('n', ';f', ':%s/foo/bar/gc <CR>', { noremap = true, silent = true })
  vim.api.nvim_set_keymap('n', ';f', ':Telescope find_files <CR>', opts)
  vim.api.nvim_set_keymap('n', ';p', ':Telescope live_grep<CR>', opts)
  vim.api.nvim_set_keymap('n', ';k', ':Telescope file_browser<CR>', opts)
  vim.api.nvim_set_keymap('n', ';j', ':Telescope current_buffer_fuzzy_find<CR>', opts)
  vim.api.nvim_set_keymap('n', 'za', ':so%<CR>', opts)
  vim.api.nvim_set_keymap('n', '<C-o>', ':NvimTreeToggle<CR>',opts)
  vim.api.nvim_set_keymap('n', '<C-l>', ':IndentGuidesToggle<CR>',opts)
  vim.api.nvim_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>gk', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--Template
--vim.cmd([[
 -- augroup highlight_yank
  --  autocmd!
   -- autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  --augroup END
--]])

vim.cmd([[
  augroup trima
    autocmd!
    autocmd BufWritePre * silent! :%s/\n\{3,}/\r\r/e
  augroup END
]])

--top transparent window
--vim.cmd([[
--  augroup testgroup
 --   autocmd BufEnter * :highlight Normal guibg=none
 -- augroup END
 --]])

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
  --vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gt', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  local tree_cb = require'nvim-tree.config'.nvim_tree_callback

  local list = {
    { key = {"<CR>", "o" }, action = "edit", mode = "n"},
    { key = "s", cb = tree_cb("vsplit") }, --tree_cb and the cb property are deprecated
    { key = "<2-RightMouse>", action = "" }, -- will remove default cd action
  }

  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()]]
    vim.api.nvim_command [[augroup END]]
  end

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

require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "all",

  -- Install languages synchronously (only applied to `ensure_installed`)
  --sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require'nvim-tree'.setup { -- BEGIN_DEFAULT_OPTS
  --auto_close = false,
  auto_reload_on_write = true,
  disable_netrw = false,
  --hide_root_folder = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  view = {
    width = 30,
    height = 30,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = nil,
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      git = false,
    },
  },
} -- END_DEFAULT_OPT
  require("null-ls").setup({
      sources = {
          --require("null-ls").builtins.formatting.mix,
          --require("null-ls").builtins.diagnostics.credo,
          require("null-ls").builtins.completion.spell,
          require("null-ls").builtins.diagnostics.credo
      },
  })

local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local DIAGNOSTICS = methods.internal.DIAGNOSTICS

local function generic_issue(message)
    return {
        message = message,
        row = 1,
        source = "credo",
    }
end

return h.make_builtin({
    name = "credo",
    meta = {
        url = "https://hexdocs.pm/credo",
        description = "Static analysis of `elixir` files for enforcing code consistency.",
        notes = {
            "Searches upwards from the buffer to the project root and tries to find the first `.credo.exs` file in case the project has nested `credo` configs.",
        },
    },
    method = DIAGNOSTICS,
    filetypes = { "elixir" },
    generator_opts = {
        command = "mix",
        --NOTE: search upwards to look for the credo config file
        cwd = function(params)
            local match = vim.fn.findfile(".credo.exs", vim.fn.fnamemodify(params.bufname, ":h") .. ";" .. params.root)

            if match then
                return vim.fn.fnamemodify(match, ":h")
            else
                return params.root
            end
        end,
        args = { "credo", "suggest", "--format", "json", "--read-from-stdin", "$FILENAME" },
        format = "raw",
        to_stdin = true,
        from_stderr = true,
        on_output = function(params, done)
            local issues = {}

            -- report any unexpected errors, such as partial file attempts
            if params.err then
                table.insert(issues, generic_issue(params.err))
            end

            -- if no output to parse, stop
            if not params.output then
                return done(issues)
            end

            local json_index, _ = params.output:find("{")

            -- if no json included, something went wrong and nothing to parse
            if not json_index then
                table.insert(issues, generic_issue(params.output))

                return done(issues)
            end

            local maybe_json_string = params.output:sub(json_index)

            local ok, decoded = pcall(vim.json.decode, maybe_json_string)

            -- decoding broke, so give up and return the original output
            if not ok then
                table.insert(issues, generic_issue(params.output))

                return done(issues)
            end

            for _, issue in ipairs(decoded.issues or {}) do
                local err = {
                    message = issue.message,
                    row = issue.line_no,
                    source = "credo",
                }

                -- using the dynamic priority ranges from credo source
                if issue.priority >= 10 then
                    err.severity = h.diagnostics.severities.error
                elseif issue.priority >= 0 then
                    err.severity = h.diagnostics.severities.warning
                elseif issue.priority >= -10 then
                    err.severity = h.diagnostics.severities.information
                else
                    err.severity = h.diagnostics.severities.hint
                end

                if issue.column and issue.column ~= vim.NIL then
                    err.col = issue.column
                end

                if issue.column_end and issue.column_end ~= vim.NIL then
                    err.end_col = issue.column_end
                end

                table.insert(issues, err)
            end

            done(issues)
        end,
    },
    factory = h.generator_factory,
})
