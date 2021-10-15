""" global
au GUIEnter * simalt ~x
set shortmess=I
set nobackup
set nowritebackup
set noswapfile
set autowrite
set hidden
set encoding=utf-8
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set autoindent
set wrap
set textwidth=120
set ignorecase
set smartcase
set number relativenumber
set nu rnu
set noshowmode
set noshowcmd
set mouse=nv
au VimEnter * GuiPopupmenu 0

if has('win32')
    "set guifont=Cascadia\ Code:h10
endif

""" fold
set foldmethod=syntax
set foldlevel=99

""""" Delete all buffers (via Derek Wyatt)
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

""""" Map escape key
imap jk <esc>
imap kj <esc>

""""" Split
let mapleader = ","
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

""""" Buffers
nnoremap <leader>w :wa!<CR>
nnoremap <leader>be :so %<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>
nnoremap <leader>q  :wa! \| :q!<CR>

"""" File types
au BufRead,BufNewFile *.qss set filetype=css

""""" Plugins
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/vim-clang-format'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-rooter'
Plug 'terryma/vim-expand-region'
Plug 'liuchengxu/vim-clap'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'samsaga2/vim-z80'
Plug 'ycm-core/YouCompleteMe'
Plug 'simnalamburt/vim-mundo'
Plug 'andreypopp/vim-colors-plain'
Plug 'phaazon/hop.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

"""" theme
set background=light
colorscheme plain

"""" YouCompleteMe
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 0

"""" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>fb :Buffers<CR>

"""" clang-format
nnoremap <leader>cf :ClangFormat<CR>
nmap <Leader>C :ClangFormatAutoToggle<CR>

"""" mundo
nnoremap <leader>au :MundoToggle<CR>

"""" z80
autocmd Filetype asm setlocal ts=8 sw=8 noexpandtab
autocmd BufNewFile,BufRead *.asm set filetype=z80

"""" hop
nnoremap <leader><leader> :HopWord<CR>

"""" nvim tree
lua<<EOF
require'nvim-tree'.setup {
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
}
EOF
nnoremap <leader>ft :NvimTreeToggle<CR>

