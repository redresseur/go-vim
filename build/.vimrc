set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'fatih/vim-go'

Plugin 'gmarik/Vundle.vim'

Plugin 'honza/vim-snippets'

Plugin 'SirVer/ultisnips'

Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'Raimondi/delimitMate'


call vundle#end()

filetype plugin indent on

set t_Co=256

colorscheme molokai

let g:molokai_original = 1

let g:rehash256 = 1

"插入模式下直接通过<C-z>键来触发UltiSnips的代码块补全

let g:UltiSnipsExpandTrigger="<C-z>"

"弹出UltiSnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射

let g:UltiSnipsListSnippets="<C-i>"

"<C-f>跳转的到下一个代码块可编辑区

let g:UltiSnipsJumpForwardTrigger="<C-f>"

"<C-b>跳转到上一个代码块可编辑区

let g:UltiSnipsJumpBackwardTrigger="<C-b>"

" 设置NerdTree

map <F7> :NERDTreeMirror<CR>

map <F7> :NERDTreeToggle<CR>

"F9触发，设置宽度为30

let g:tagbar_width = 30

nmap <F9> :TagbarToggle<CR>

"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)

let g:tagbar_autopreview = 1

"关闭排序,即按标签本身在文件中的位置排序

let g:tagbar_sort = 0
