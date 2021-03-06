"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim设置-参考手册
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法
" ===============
" map a b -> 表示按 a 等于按 b。
" vmap -> (还有 nmap imap）前首字母表示不同的模式（分别对应虚拟模式，普通模式，插入模式）。
" vnoremap c a -> nore表示非递归 。
"   比如我们之前设置按a等于按b,假设我们设置按c等于按a。则我们按下c相当于按了b。
"   如果是nore的映射，按下c只等于按a。至于前面的v，跟第二条一样表示不同的模式。
"
" 插件管理
" ===============
" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = " "             " 定义<leader>键
set nocompatible                " 设置不兼容原始vi模式
filetype on                     " 设置开启文件类型侦测
filetype plugin on              " 设置加载对应文件类型的插件
set noeb                        " 关闭错误的提示
syntax enable                   " 开启语法高亮功能
syntax on                       " 自动语法高亮
set t_Co=256                    " 开启256色支持
set cmdheight=2                 " 设置命令行的高度
set showcmd                     " select模式下显示选中的行数
set ruler                       " 总是显示光标位置
set laststatus=2                " 总是显示状态栏
set relativenumber              " 开启相对行号显示
set number                      " 开启行号显示
set cursorline                  " 高亮显示当前行
set whichwrap+=<,>,h,l          " 设置光标键跨行
set ttimeoutlen=0               " 设置<ESC>键响应时间
set virtualedit=block,onemore   " 允许光标出现在最后一个字符的后面

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent                  " 设置自动缩进
set cindent                     " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0     " 设置C/C++语言的具体缩进方式
set smartindent                 " 智能的选择对其方式
filetype indent on              " 自适应不同语言的智能缩进
set expandtab                   " 将制表符扩展为空格
set tabstop=4                   " 设置编辑时制表符占用空格数
set shiftwidth=4                " 设置格式化时制表符占用空格数
set softtabstop=4               " 设置4个空格为制表符
set smarttab                    " 在行和段开始处使用制表符
set nowrap                      " 禁止折行
set backspace=2                 " 使用回车键正常处理indent,eol,start等
set sidescroll=10               " 设置向右滚动字符数
set nofoldenable                " 禁用折叠代码

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                    " vim自身命名行模式智能补全
set completeopt-=preview        " 补全时不显示窗口，只显示补全列表

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                    " 高亮显示搜索结果
set incsearch                   " 开启实时搜索功能
set ignorecase                  " 搜索时大小写不敏感

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup                    " 设置不备份
set noswapfile                  " 禁止生成临时文件
set autoread                    " 文件在vim之外修改过，自动重新读入
set autowrite                   " 设置自动保存
set confirm                     " 在处理未保存或只读文件的时候，弹出确认

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd vimenter * ++nested colorscheme one
set background=light
let g:one_allow_italics=1
let g:airline_theme='one'

"#set background=dark
"#colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 窗口聚焦移动
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l



"==================================各种插件设置==============================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置快捷键为leader+n
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1   " 打开为文件夹时，自动开启Nerdtree
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " vim中仅剩下Nerdtree，自动关闭
let NERDTreeIgnore = ['\.pyc$']         " 过滤所有.pyc文件不显示,可根据需要自行添加
let g:NERDTreeShowLineNumbers = 0       " 显示目录树行号则设置为1
let NERDTreeWinSize = 30                " 目录树的宽度


let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <c-n> :bnext<CR>
nnoremap <c-p> :bprevious<CR>
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"=============================================================================================================


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件管理器 bundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'                        " 文件树菜单
Plugin 'vim-airline/vim-airline'                    " 导航栏
Plugin 'jiangmiao/auto-pairs'                       " 括号补全
"Plugin 'chrisbra/csv.vim'                           " 处理csv文件

"Plugin 'morhetz/gruvbox'			                " 主题
Plugin 'rakr/vim-one'
call vundle#end()            " 必须

filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
