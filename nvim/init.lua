-- Minimal Neovim config

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--------------------------------------------------------------------
-- Options
--------------------------------------------------------------------

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation: 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Use system clipboard for all yank/delete/paste by default
vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- UI
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.showmode = false

-- Splits open in sensible places
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Persistent undo, no swap/backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Snappier UI
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.mouse = "a"

--------------------------------------------------------------------
-- Keymaps
--------------------------------------------------------------------

-- x / X delete to the black hole register (don't pollute clipboard)
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')

-- Paste over a visual selection without overwriting the clipboard
vim.keymap.set("v", "p", '"_dP')

-- <leader>d deletes without yanking
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- <Esc> clears search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- <leader>e opens netrw file explorer
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>")

-- Window/split management
vim.keymap.set("n", "<leader>s", "<cmd>vsplit<CR>")         -- vertical split
vim.keymap.set("n", "<leader>m", "<C-w>_<C-w>|")            -- maximize current split
vim.keymap.set("n", "<leader>=", "<C-w>=")                  -- equalize splits (undo maximize)
vim.keymap.set("n", "<leader>x", "<cmd>close<CR>")          -- close current split

-- Keep cursor centered on half-page scrolls and search results
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--------------------------------------------------------------------
-- Plugins (via built-in vim.pack, Neovim 0.12+)
--------------------------------------------------------------------

vim.pack.add({
    { src = "https://github.com/catppuccin/nvim" },
})

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    integrations = {
        treesitter = true,
        native_lsp = { enabled = true },
    },
})

vim.cmd.colorscheme("catppuccin")
