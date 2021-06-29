filetype on
let mapleader = " "
" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1


" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

" enable syntax hightlight and completion
syntax on

"--------
" Vim UI
"--------
" color scheme
set background=dark
"color solarized
" colorscheme gruvbox 
colorscheme molokai
let g:rehash256 = 1

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
"set cursorline cursorcolumn
set cursorline

" search
set incsearch
"set highlight 	" conflict with highlight current line
set ignorecase
set smartcase
set hlsearch

" editor settings
set history=1000
set nocompatible
set nofoldenable                                                  " disable folding"
set confirm                                                       " prompt when existing from an unsaved file
set backspace=indent,eol,start                                    " More powerful backspacing
set t_Co=256                                                      " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                                                       " use mouse in all modes
set report=0                                                      " always report number of lines changed                "
set nowrap                                                        " dont wrap lines
set scrolloff=5                                                   " 5 lines above/below cursor when scrolling
set number                                                        " show line numbers
set showmatch                                                     " show matching bracket (briefly jump)
set showcmd                                                       " show typed command in status bar
set title                                                         " show file in titlebar
set laststatus=2                                                  " use 2 lines for the status bar
set matchtime=2                                                   " show matching bracket for 0.2 seconds
set matchpairs+=<:>                                               " specially for html
" set relativenumber

" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
filetype indent on  " 将tab扩展为空格
set expandtab       " expand tab to space

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif
" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" change windows size
nnoremap <M-k> <c-w>-
nnoremap <M-j> <c-w>+

nnoremap <cr> <nop>
nnoremap ; :

" 改变光标的样式
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" 剪切板
" set clipboard = unnamed
" set guioptions+=a

" 修改临时文件等文件目录
" 如果文件夹不存在，则新建文件夹
" if !isdirectory($HOME.'/.vim/files') && exists('*mkdir')
"   call mkdir($HOME.'/.vim/files')
" endif
" 
" " 备份文件
" set backup
" set backupdir   =$HOME/.vim/files/backup/
" set backupext   =-vimbackup
" set backupskip  =
" " 交换文件
" set directory   =$HOME/.vim/files/swap//
" set updatecount =100
" " 撤销文件
" set undofile
" set undodir     =$HOME/.vim/files/undo/
" " viminfo 文件
" set viminfo     ='100,n$HOME/.vim/files/info/viminfo


"-------------------------------------------------------
" Plugin setting
"-------------------------------------------------------
" set nocompatible
" filetype off

call plug#begin('~/.vim/plugged')

" 快速注释
Plug 'vim-scripts/DoxygenToolkit.vim'
" for C++ style, change the '@' to '\'
let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre = "\\brief "
let g:DoxygenToolkit_templateParamTag_pre = "\\tparam "
let g:DoxygenToolkit_paramTag_pre = "\\param "
let g:DoxygenToolkit_returnTag = "\\return "
let g:DoxygenToolkit_throwTag_pre = "\\throw " " @exception is also valid
let g:DoxygenToolkit_fileTag = "\\file "
let g:DoxygenToolkit_dateTag = "\\date "
let g:DoxygenToolkit_authorTag = "\\author "
let g:DoxygenToolkit_versionTag = "\\version "
let g:DoxygenToolkit_blockTag = "\\name "
let g:DoxygenToolkit_classTag = "\\class "
let g:DoxygenToolkit_authorName = "Wang Wenjie, wnjiewang@mail.ustc.edu.cn"
let g:doxygen_enhanced_color = 1
"let g:load_doxygen_syntax = 1

" ack全局搜索
Plug 'mileszs/ack.vim'
:map <F3> :Ack! -i 
let g:ackhighlight=1
" let g:ack_autofold_results=1

" Plug 'ludovicchabant/vim-gutentags'

Plug 'skywind3000/asyncrun.vim'

Plug 'dense-analysis/ale'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-signify'	" display the different between local file and git


" quickly modify codes
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" highlight cpp code
Plug 'octol/vim-cpp-enhanced-highlight'

" recommend the code
" Plug 'ycm-core/YouCompleteMe'
" auto create .ycm_extra_conf.py for YouCompleteMe
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

" function list
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" switch between .h and .cpp files
" Plug 'vim-scripts/a.vim'

" display function parameters at the bottom
Plug 'Shougo/echodoc.vim'


" NERDTree
" Plug 'scrooloose/nerdtree'
" file explorer --replace nerdtree
Plug 'justinmk/vim-dirvish'


" auto fold codes
" Plug 'Konfekt/FastFold'


" markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'

" undotree
Plug 'mbbill/undotree'

" vim-anyfold
Plug 'pseewald/vim-anyfold'

"注释
Plug 'scrooloose/nerdcommenter'
" 注释说明 {{{
"<leader>cc   加注释
"<leader>cu   解开注释
"<leader>c<space>  加上/解开注释, 智能判断
"<leader>cy   先复制, 再注解(p可以进行黏贴)
" 注释的时候自动加个空格, 强迫症必配
let g:NERDSpaceDelims=1
" }}}

" 主题
Plug 'morhetz/gruvbox'

" 缩进格式化显示
Plug 'nathanaelkane/vim-indent-guides'
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" 在.h和.cpp之间切换
Plug 'derekwyatt/vim-fswitch'
" *.cpp 和 *.h 间切换
nmap <silent> <Leader>sw :FSHere<cr>

" 标签显示
Plug 'kshenoy/vim-signature'
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" 实现快速查找
Plug 'dyng/ctrlsf.vim'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。快捷键速记法：search in project
nnoremap <Leader>sp :CtrlSF<CR>
" 据说ag效率更高一点
let g:ctrlsf_ackprg='ag'
" 默认设置下，ctrlsf的形态很像sublime的搜索，每个结果有前后部分上下文，个人更偏好vs式的预览，这两种模式也可以按M随时切换 
let g:ctrlsf_default_view_mode='compact' 
" 设置不自动关闭，搜索字符串不像搜标签，经常需要点开看看。
let g:ctrlsf_auto_close=0  
" 大小写不敏感，为了查询更快速，默认设成大小写不敏感搜索。
let g:ctrlsf_case_sensitive='no'   
" 忽略部分目录
let g:ctrlsf_ignore_dir=['tags']  
" 设置在当前工作目录下搜索，和nerdtree一致。
let g:ctrlsf_default_root='cwd'  


" 多个快速选择
Plug 'terryma/vim-multiple-cursors'


call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
" set tags = ./.tags;,.tags
" set autochdir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-gutentags
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
 " let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
" let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
" let g:gutentags_modules = []
" if executable('ctags')
    " let g:gutentags_modules += ['ctags']
" endif
" if executable('gtags-cscope') && executable('gtags')
    " let g:gutentags_modules += ['gtags_cscope']
" endif

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
" let s:vim_tags = expand('~/.cache/tags')
" let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
" let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
" let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
" if !isdirectory(s:vim_tags)
   " silent! call mkdir(s:vim_tags, 'p')
   " endif

" 禁用 gutentags 自动加载 gtags 数据库的行为
" let g:gutentags_auto_add_gtags_cscope = 0
" display information when debug gutentags
" let g:gutentags_trace = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" asyncrun
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 12

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F4> :call asyncrun#quickfix_toggle(12)<cr>

" F9 compile single file
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F5 run single file
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" recognize the root dir
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 

" F7 compile the whole project
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 run the whole project
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 test the project
" nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

let g:asyncrun_status = ''
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ALE
" let g:ale_linters_explicit = 1
" let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
" let g:ale_lint_delay = 500

"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}\ %{ALEGetStatusLine()}

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_column_always = 1

" adjust the display of hint
let g:ale_sign_error = ">>"
let g:ale_sign_warning= '--'
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellRare
highlight SpellBad gui=undercurl guisp=red
highlight SpellCap gui=undercurl guisp=blue
highlight SpellRare gui=undercurl guisp=magenta

" quickly navigate between errors
" nnoremap <silent> <leader>j <Plug>(ale_previous_wrap)
" nnoremap <leader>k <Plug>(ale_next_wrap)
" nnoremap <silent> <leader>j <Plug>(ale_previous_wrap)
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)


"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查

let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 1
" let g:airline_theme = 'distinguished' 
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
"加强版状态栏
let g:airline_theme='molokai'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone
"设置全局配置文件的路径
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
"在注释中也可以补全
let g:ycm_complete_in_comments=1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:clang_user_options='|| exit 0'
" the directory of clangd binary
" let g:ycm_clangd_binary_path = "/home/wwj/software/llvm_clang_binary"
let g:ycm_clangd_binary_path = "/home/nhpcc502/wwj/llvm/llvm-9.0"
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1


" python interpreter
" set pythondll=
" let g:ycm_python_interpreter_path= '$python_interpreter'
let g:ycm_server_python_interpreter = '/usr/bin/python'
noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
           \ 'cs,lua,javascript': ['re!\w{2}'],
           \ }

" white list
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }


"设置error和warning的提示符，如果没有设置，ycm会以syntastic的
" g:syntastic_warning_symbol 和 g:syntastic_error_symbol 这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
" 添加C++11 支持
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options='std=c++11 -stdlib=libc++'

"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>

"离开插入模式后自动关闭预览窗口
set completeopt=longest,menu
autocmd InsertLeave * if pumvisible() == 0|pclose|endif





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LeaderF
" !!!!!!!!!!!!! need to learn more

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
" noremap <c-n> :LeaderfMru<cr>
" noremap <c-f> :LeaderfFunction!<cr>
" noremap <a-n> :LeaderfBuffer<cr>
" noremap <c-m> :LeaderfTag<cr>
noremap <leader>m :LeaderfMru<cr>
noremap <leader>f :LeaderfFunction!<cr>
noremap <leader>b :LeaderfBuffer<cr>
noremap <leader>t :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }

let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" echodoc
set cmdheight=2
let g:echodoc_enable_at_startup = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
" let NERDChristmasTree=0
" let NERDTreeWinSize=30
" let NERDTreeChDirMode=2
" let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" " let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
" let NERDTreeShowBookmarks=1
" let NERDTreeWinPos = "right"
" autocmd VimEnter * NERDTree
" " auto close when NERDTree is the last windows
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" " display the line number
" let g:NERDTreeShowLineNumbers=1
" " nerdcommenter
" let NERDSpaceDelims=1
" " nmap <D-/> :NERDComToggleComment<cr>
" let NERDCompactSexyComs=1
"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dirvish
" automatic sort directories and files
let g:dirvish_mode = ':sort ,^.*[\/],'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" --------------
" set buffer key
nmap <silent> <leader>= :bnext<CR>
nmap <silent> <leader>- :bprev<CR>
" nmap <s-=> :bnext<CR>
" nmap <s--> :bprev<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FastFold
" nmap zuz <Plug>(FastFoldUpdate)
" set fdm=indent
" set nofoldenable
" let g:fastfold_savehook = 1
" let g:fastfold_fold_command_suffixes =  ['x','X','a','A','o','O','c','C']
" let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
" let g:markdown_folding = 1
" let g:tex_fold_enabled = 1
" let g:vimsyn_folding = 'af'
" let g:xml_syntax_folding = 1
" let g:javaScript_fold = 1
" let g:sh_fold_enabled= 7
" let g:ruby_fold = 1
" let g:perl_fold = 1
" let g:perl_fold_blocks = 1
" let g:r_syntax_folding = 1
" let g:rust_fold = 1
" let g:php_folding = 1
" " let g:c_folding = 1
" " let g:cpp_folding = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
" ====markdown设置====
let g:table_mode_corner="|"

" ====open file in chrome browser====
nnoremap <leader>ch :update<Bar>silent ! start %:p<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
nnoremap <F2> :UndotreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-anyfold
let g:anyfold_fold_comments=1
set foldlevel=0
" hi Folded term=NONE cterm=NONE

" 
autocmd FileType * AnyFoldActivate

" activate anyfold by default
augroup anyfold
    autocmd!
    autocmd FileType * AnyFoldActivate
augroup END

        " autocmd! " remove AnyFoldActivate
" disable anyfold for large files
let g:FoldLargeFileSize = 1000000 " file is large if size greater than 1MB
autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:FoldLargeFileSize || f == -2 | call FoldLargeFile() | endif
function FoldLargeFile()
    augroup anyfold
        autocmd!
        autocmd FileType * setlocal foldmethod=indent " fall back to indent folding
    augroup END
endfunction

" 映射oo为插入换行符，并且不进入插入模式
nmap oo o<ESC>
