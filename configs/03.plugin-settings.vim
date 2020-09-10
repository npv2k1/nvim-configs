"NERDTree
map <C-b> :NERDTreeToggle<CR>
map <C-i> :NERDTreeFind<CR>
let g:NERDTreePatternMatchHighlightFullName = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeShowBookmarks=1


"Theme 
syntax enable
set background=dark
highlight Normal ctermbg=None
colorscheme dracula


let g:airline_theme='gruvbox'
set termguicolors

"Enable tagbar on startup"
autocmd FileType py call tagbar#autoopen(0)

"Phim tat trong nvim"

nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>