" Менеджер плагинов
call plug#begin('~/.vim/plugged')

" Git-плагины
Plug 'tpope/vim-fugitive'         " Git команды внутри Vim
Plug 'airblade/vim-gitgutter'     " Показ изменений +/− рядом со строками

" Подсветка синтаксиса
Plug 'sheerun/vim-polyglot'       " Поддержка многих языков
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Файловый менеджер
Plug 'preservim/nerdtree'

" Автодополнение и LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Общие настройки
syntax on
filetype plugin indent on
set number
set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set cursorline
set clipboard=unnamedplus
set background=dark

" Клавиши
nmap <C-n> :NERDTreeToggle<CR>

" coc.nvim настройки — автодополнение и LSP
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-pyright', 'coc-java', 'coc-eslint']

" GitGutter настройка
let g:gitgutter_enabled = 1
