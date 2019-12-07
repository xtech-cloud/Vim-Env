" ------------   Author : Easlee Liu
" ------------    Email : liu@easlee.me
" ------------     Date : 2013/2/22

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'sickill/vim-monokai'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'easlee/vim-visualmark'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree' 
Plugin 'Xuyuanp/nerdtree-git-plugin' 
Plugin 'majutsushi/tagbar' 
Plugin 'vim-scripts/TaskList.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets' 
Plugin 'fatih/vim-go'
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
call vundle#end()

call glaive#Install()

Glaive codefmt plugin[mappings]
Glaive codefmt clang_format_executable="/usr/bin/clang-format"

""""""""""""""""""""""""""""""""""""""""
" 一般设定
""""""""""""""""""""""""""""""""""""""""

set nocompatible            " 不兼容Vi 
set go= "无菜单，工具栏

" 编码
" {{{
"新建文件时使用的编码 (fileencoding)
set fenc=utf-8			
"打开文件时识别的编码 (fileencodings)
set fencs=utf-8,usc-bom,enu-jp,gb18030,gbk,gb2312,cp936 
"Vim内部使用编码，默认为local (encoding)
set enc=utf-8
"终端模式下的编码 (termencoding)
set tenc=utf-8 
" }}}

" undo
" {{{
set undofile                " 使用持久撤销 
set undodir=~/.vimundo      " 保存UNDO文件的目录
set undolevels=100          " undo的最大条数
" }}}

" buffer
" {{{
set hidden                  " 允许未保存时切换缓冲区 
" }}}

set noswapfile              " 不使用备份文件

set history=100			    " 历史文件记录的行数

set confirm 			    " 处理未保存或只读文件时弹出确认

colorscheme monokai         " 着色模式
set guifont=Monaco:h10      " 使用的字体

syntax enable			    " 打开语法高亮

set colorcolumn=80          " 80字符后加红线标记

set autoindent			    " 自动对其
set ai!				        " 自动缩进
set smartindent			    " 智能自动缩进
set nu!				        " 显示行号
set cursorline              " 突出显示当前行

set softtabstop=4           " 退格键可以一次删除4个空格
set tabstop=4			    " 使用空格代替tab
set shiftwidth=4            " 缩进的空格数为4
set expandtab			    " 将Tab自动转化为空格 [使用^v+Tab输入真正的Tab]

set cmdheight=2			    " 命令行的高度

filetype on			        " 开启文件类型侦测
filetype indent on 		    " 针对不同的文件类型采用不同的缩进格式
filetype plugin on		    " 针对不同的文件类型加载对应的插件
filetype plugin indent on	" 启动自动补全

let mapleader = ","
set relativenumber


"set autochdir               " 自动切换工作路径
""""""""""""""""""""""""""""""""""""""""
" 文件设置
""""""""""""""""""""""""""""""""""""""""
set nowrap                  " 不自动换行
set laststatus=2		    " 总是显示状态栏
" 状态行显示光标所在行的行号和列号 
set ruler
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)


"""""""""""""""""""""""""""""""""""""""
" 搜索和匹配
"""""""""""""""""""""""""""""""""""""""
set showmatch			    " 高亮显示匹配的括号
set matchtime=5			    " 匹配括号高亮的时间（单位是十分之一秒）
set ignorecase			    " 忽略大小写
set incsearch			    " 逐字符高亮

""""""""""""""""""""""""""""""""""""""""
" 编辑
""""""""""""""""""""""""""""""""""""""""
" 补全括号
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap { {}<LEFT>
" 使用空格折叠
nnoremap <unique><silent><space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"关闭所有折叠
nnoremap <unique><leader>zm zM
"打开所有折叠
nnoremap <unique><leader>zr zR

""""""""""""""""""""""""""""""""""""""""
" Monokai
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" TaskList
""""""""""""""""""""""""""""""""""""""""
let g:tlWindowPosition=1
nnoremap <silent> <unique> <leader>tl :TaskList<CR>

""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="powerlineish"
if !exists('g:airline_symbols')                                               
    let g:airline_symbols = {}                                                  
endif 
let g:airline_left_sep = ''  
let g:airline_left_alt_sep = ''  
let g:airline_right_sep = '' 
let g:airline_right_alt_sep = ''    
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''  
let g:airline_symbols.linenr = ''
" 使用左箭头选择上一个缓冲区
noremap <unique><LEFT> :bp<CR>
" 使用右箭头选择下一个缓冲区
noremap <unique><RIGHT> :bn<CR>

""""""""""""""""""""""""""""""""""""""""
" CtrlP
""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

""""""""""""""""""""""""""""""""""""""""
"NERDTree
""""""""""""""""""""""""""""""""""""""""
" 自动显示Bookmarks
let NERDTreeShowBookmarks=1 
" 以箭头显示目录
let NERDTreeDirArrows=1
" 不显示帮助
let NERDTreeMinimalUI=1
nmap nt :NERDTreeToggle<CR>
"
""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><unique> tb :TagbarToggle<CR> 

""""""""""""""""""""""""""""""""""""""""
" neosnippet
""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

""""""""""""""""""""""""""""""""""""""""
" Neocomplete
""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""
" vim-codefmt
""""""""""""""""""""""""""""""""""""""""
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    " autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
augroup END

""""""""""""""""""""""""""""""""""""""""
" 语言设定
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" Lang - Go
""""""""""""""""""""""""""""""""""""""""
au FileType go let g:go_highlight_functions = 1
au FileType go let g:go_highlight_methods = 1
au FileType go let g:go_highlight_structs = 1
au FileType go let g:go_highlight_interfaces = 1
au FileType go let g:go_highlight_operators = 1
au FileType go let g:go_highlight_build_constraints = 1
au FileType go let g:go_fmt_command = "goimports"
"au FileType go let g:go_fmt_fail_silently = 1
"au FileType go let g:go_fmt_autosave = 0


" 代码折叠
"{{{{{
au FileType go set nofoldenable             "打开文件时不折叠
"au FileType go set foldenable              "打开文件时折叠
"au FileType go set foldopen-=search        " 搜索时不展开折叠
"au FileType go set foldopen-=undo          " 撤消时不展开折叠
au FileType go set foldmethod=indent       " 折叠方式
"}}}}}

au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>ds <Plug>(go-def-split)
au FileType go nmap <leader>dv <Plug>(go-def-vertical)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>gd <Plug>(go-doc)
au FileType go nmap <leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>s <Plug>(go-implements)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>e <Plug>(go-rename)

""""""""""""""""""""""""""""""""""""""""
" Lang - Go
""""""""""""""""""""""""""""""""""""""""
