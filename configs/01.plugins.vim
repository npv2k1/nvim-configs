call plug#begin('C:/Users/nguyen/AppData/Local/nvim/bundle')

"Plugin thay đổi giao diện cho status bar của Vim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" dracula
Plug 'dracula/vim', { 'name': 'dracula' }

"Tagbar"
Plug 'majutsushi/tagbar'


Plug 'scrooloose/nerdtree' 
Plug 'morhetz/gruvbox'
call plug#end()