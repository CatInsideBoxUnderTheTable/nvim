require('lazy').setup({
    'tpope/vim-fugitive',                   -- You can use :G to run any git command
    'sindrets/diffview.nvim',               -- advanced diffs
    'tpope/vim-sleuth',                     -- Detect tabstop and shiftwidth automatically
    'ThePrimeagen/harpoon',                 -- Bookmark navigation utility

    { 'folke/which-key.nvim',  opts = {} }, -- Useful plugin to show you pending keybinds.
    { 'numToStr/Comment.nvim', opts = {} }, -- "gc" to comment visual regions/lines


    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'evesdropper/luasnip-latex-snippets.nvim',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
            on_attach = function(bufnr)
                vim.keymap.set('n', '<leader>gs', require('gitsigns').preview_hunk,
                    { buffer = bufnr, desc = 'Preview git change' })

                -- don't override the built-in and fugitive keymaps
                local gs = package.loaded.gitsigns
                vim.keymap.set({ 'n', 'v' }, '<leader>gn', function()
                    if vim.wo.diff then return '<leader>gn' end
                    vim.schedule(function() gs.next_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to next git change" })
                vim.keymap.set({ 'n', 'v' }, '<leader>gN', function()
                    if vim.wo.diff then return '<leader>gN' end
                    vim.schedule(function() gs.prev_hunk() end)
                    return '<Ignore>'
                end, { expr = true, buffer = bufnr, desc = "Jump to previous git change" })
            end,
        },
    },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            vim.cmd.colorscheme 'catppuccin'
        end,
    },

    -- :Trouble -> show list of code issues
    -- :TroubleClose
    -- :TroubleRefresh
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },

    {
        -- Set lualine as statusline
        'nvim-lualine/lualine.nvim',
        priority = 1001,
        opts = {
            options = {
                icons_enabled = false,
                theme = 'catppuccin',
                component_separators = '|',
                section_separators = '',
            },
        },
    },

    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help indent_blankline.txt`
        config = function()
            local highlightSetup =
            {
                "CursorColumn",
                "WhiteSpace"
            }
            require('ibl').setup {
                indent = { char = '┊' },
                whitespace = { highlight = highlightSetup, remove_blankline_trail = true },
                scope = { enabled = true }
            }
        end,
    },


    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            "debugloop/telescope-undo.nvim",
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        init = function()
            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'undo')
        end,

        config = function()
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<C-u>'] = false,
                            ['<C-d>'] = false,
                        },
                    },
                },
            }
        end
    },

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("nvim-tree").setup {
                on_attach = function(bufnr)
                    local api = require "nvim-tree.api"

                    local function opts(desc)
                        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                    end

                    -- default mappings
                    api.config.mappings.default_on_attach(bufnr)

                    -- custom mappings
                    vim.keymap.set('n', 'h', api.tree.toggle_help, opts('Help'))
                    vim.keymap.set('n', 'oh', api.node.open.horizontal, opts('Open horizontal'))
                    vim.keymap.set('n', 'ov', api.node.open.vertical, opts('Open vertical'))
                    vim.keymap.set('n', 'd', api.fs.trash, opts('Delete'))
                    vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
                end
            }
        end
    },

    -- Setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
    {
        "folke/neodev.nvim",
        opts = {},
        lazy = true,
        ft = 'lua'
    },

    -- For latex purposes. You will need to install TeX Live to compile document
    {
        'lervag/vimtex',
        lazy = true,
        ft = 'tex',
        init = function()
            vim.g.vimtex_quickfix_mode = 0         -- Disable automatic error popups
            vim.g.vimtex_view_method = 'zathura'   -- Set PDF viewer for document preview
            vim.g.vimtex_syntax_enabled = 1
            vim.g.vimtex_fold_enabled = 1          -- Enable folding based on sections within the LaTeX document
            vim.g.vimtex_project_root = ''         -- Set the method for detecting the main file in a multi-file project
            vim.g.vimtex_compiler_progname = 'nvr' -- Enable continuous compilation on save
            vim.g.vimtex_compiler_latexmk = {      -- Custom compiler settings if needed, e.g., changing the latexmk backend
                -- Use -pdf for PDF output
                options = { '-pdf', '-verbose', '-file-line-error', '-synctex=1', '-interaction=nonstopmode' },
            }
        end
    },

    -- Adds :ShellCheck and :ShellCheck! - for bash scripting
    {
        "itspriddle/vim-shellcheck",
        lazy = true,
        ft = "sh",
    },

    require 'kickstart.plugins.autoformat'
}, {})
