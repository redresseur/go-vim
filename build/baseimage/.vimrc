set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'fatih/vim-go'

Plugin 'gmarik/Vundle.vim'

"Plugin 'honza/vim-snippets'

Plugin 'SirVer/ultisnips'

Plugin 'scrooloose/nerdtree'

Plugin 'majutsushi/tagbar'

Plugin 'Raimondi/delimitMate'

Plugin 'Valloric/YouCompleteMe'

"Plugin 'Blackrush/vim-gocode'

"Plugin 'mdempsky/gocode',{'rtp':'vim/'}

call vundle#end()

filetype plugin indent on

set t_Co=256

set encoding=utf-8

colorscheme molokai

" 设置NerdTree

map <F7> :NERDTreeMirror<CR>

map <F7> :NERDTreeToggle<CR>

"F9触发，设置宽度为30

let g:tagbar_width = 30

nmap <F4> :TagbarToggle<CR>

"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)

let g:tagbar_autopreview = 1

"关闭排序,即按标签本身在文件中的位置排序

let g:tagbar_sort = 0

let g:go_auto_type_info = 1

"let g:go_def_mode = 'gopls'

let g:go_def_mode = 'godef'

"let g:go_info_mode = 'gopls'

let g:go_info_mode = 'gocode'

" open the code completion

let g:go_code_completion_enabled = 1

map! <F6> <C-x><C-o>
