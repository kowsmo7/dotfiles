call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'neovim/nvim-lspconfig'
Plug 'kowsmo7/nvim-treesitter', { 'branch': 'injectionless-lua', 'do': ':TSUpdate' }
Plug 'feline-nvim/feline.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
call plug#end()

set tabstop=4
set shiftwidth=4
set autoindent

set number
set encoding=utf-8
set laststatus=2
set shortmess+=c
set nobackup
set nowritebackup
set termguicolors
set updatetime=300
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h11

syntax on
filetype plugin indent on
colorscheme gruvbox

highlight TelescopeSelection guibg=#3f3f3f
highlight DiagnosticError guifg=#fb4934

autocmd ModeChanged n:* lua vim.diagnostic.hide()

nnoremap <Space>wv <cmd>vsplit<CR><cmd>wincmd L<CR>
nnoremap <Space>wn <cmd>split<CR><cmd>wincmd J<CR>
nnoremap <Space>f <cmd>Telescope find_files<CR>
nnoremap <Space>t <cmd>Telescope file_browser<CR>
tnoremap <Esc> <C-\><C-n>

let g:coq_settings = {
			\ 'auto_start': v:true,
			\ 'display.ghost_text.enabled': v:false,
			\ 'display.pum.kind_context': [ ' ', '' ],
			\ }

lua require("config/lspconfig")
lua require("config/treesitter")
lua require("config/feline")
lua require("config/telescope")
