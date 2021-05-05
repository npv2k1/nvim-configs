# nvim-configs
## NVIM config ubuntu
[IDE hoá NeoVim] Phần 1 Cài đặt plugins và Setup NeoVim cơ bản
Hai bài trước mình đã viết về những lợi ích của việc sử dụng NeoVim và hướng dẫn sử dụng NeoVim cơ bản. Trong bài viết này mình sẽ hướng dẫn các bạn install plugins và setup để biến NeoVim thành IDEs cho riêng bạn.

Từ visual studio đến neovim

Cài đặt và sử dụng neovim cơ bản

Vim-plug
Mình sử dụng vim-plug làm trình quản lý plugins, NeoVim hoặc Vim đều dùng được. Mình khuyên các bạn nên xài NeoVim, lý do vì NeoVim là bản refactor của Vim với ít hơn 30% code, hỗ trợ tốt hơn cho việc tích hợp plugins. Cài đặt:
```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Tạo folder để chứa file config của NeoVim tại ~/.config/nvim/init.vim
```bash
cd ~/.config && mkdir nvim
cd nvim && touch init.vim
```
NeoVim mặc định sẽ đọc file init.vim này khi start lên. Giống như là khi các bạn code C/C++ sẽ muôn có một file chứa hàm main() vậy, trong NeoVim bạn có thể tạo nhiều file configs của mình ở ngoài rồi source ( include trong C/C++) vào file init.vim này.

Mình tạm thiết kế thư mục nvim như vầy: codefun neovim Trong cây thư mục như trên chỉ có folder configs, my_settings là do mình tạo ra, còn lại những folder session, bundle, autoload là vim-plug tạo ra để quản lý packages. Ở trong bài viết này các bạn chỉ cần tạo ra folder configs và setup plugin thôi.

Thư mục configs chưa tất cả các file cài đặt vim. Mình mình muốn tách các config này ra để dễ cho việc cài đặt và setup sau này. Trong file init.vimmình sẽ chạy một script đọc tất cả các configs này và nạp vào.

* 01 plugins.vim : quản lý các plugins
* 02.settings.vim: quản lý setting của neovim
* 03.plugin-settings.vim : quản lý setting của plugins.

// thêm script này vào file init.vim
```
for f in split(glob('~/.config/nvim/configs/*.vim'), '\n')
   exe 'source' f
endfor
```
Prefix `01.*` để chỉ mức độ ưu tiên của script khi được nạp vào. Plugins cần phải nạp vào trước, sau đó đến setting của neovim các setting khác được load sau cùng.

### Cài đặt
#### Plugins
Mình sẽ lấy 2 plugins để làm ví dụ đó là nerdtree ( trình quản lý folder/file) và gruvbox ( theme của neovim giống như mình đang xài ). codefun neovim theme Trong file 01.plugins.vim bạn thêm vào đoạn script sau:

```vim
call plug#begin('~/.config/nvim/bundle')
// tất cả các plugin phải nằm giữa hai hàm này plug#begin và plug#end
Plug 'scrooloose/nerdtree' // trình quản lý file giống như trong hình của mình
Plug 'morhetz/gruvbox' // theme giống như trong hình của mình luôn :))
call plug#end()
```

Có rất nhiều plugins bạn có thể tìm kiếm tại đây

Sau khi thêm xong thì các bước bạn phải làm là: `:w` để save lại sau đó `:so %` để load lại configs sau đó `:PlugInstall` để cài đặt Plugins 

Khi bạn cài bất kì plugins nào thì các bạn nên vào trang chủ của plugin đó (đa phần là github) xem hướng dẫn sử dụng và có cần phải cài đặt gì không. Vì đa số các plugins cài vào cần setting nó mới hoạt động.

Nếu các bạn cảm thấy plugin có ý nghĩa với bạn, thì đừng tiếc gì một star cho project đó để động viên tác giả nhé ❤️

Ví dụ như mình vừa cài vào plugin nerdtree ( trình quản lý folder/file) thì mình vào trang github của nerdtree để xem docs



#### Settings

File `02.settings.vim` sẽ chứa những settings chung của NeoVim, mang tính chất global và ít bị thay đổi theo thời gian.  Một số settings cơ bản trong file 02.settings.vim :
```vim
let mapleader = "\<Space>" // prefix key dùng để trigger các function hay event 
filetype plugin on
filetype plugin indent on

autocmd BufEnter * :set scroll=10 // set croll line 
syntax on

set encoding=UTF-8
set mouse=a // enable mouse trong context của neovim 

set incsearch 
set hlsearch  // hightlight text khi search 

set tabstop=4 // space mỗi lần tab
set softtabstop=0
set shiftwidth=4
```

#### Plugins Setting
File `03.plugins-setting.vim` sẽ chứa setting của plugin. Mình vừa mới cài đặt 2 plugin là `nerdtree` và `gruvbox`, giờ mình bắt đầu config như sau:
```vim
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
colorscheme gruvbox
let g:airline_theme='gruvbox'
set termguicolors
```

Copy đoạn setting mình đã tạo sẵn và paste vào file plugins-settings của bạn. `:w` để save lại, `:so%` để load lại setting và bạn sẽ thấy theme của neovim thay đổi. Kiểm tra xem setting của NerdTree đã ăn chưa bằng cách nhấn tổ hợp phím `Ctrl + b` để toggle nerdtree.


Nguồn
https://codefun.dev/@lythanhnhan27294/ide-hoa-neovim-phan-1-cai-dat-plugins-va-setup-neovim-co-ban-1482174216

Update
[IDE hoá NeoVim] Phần 2.1 Những plugins cần thiết