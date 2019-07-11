set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
""""""""""""""""""""""VIM PLUG""""""""""""""""""""
"不兼容vi
set nocompatible

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'liuchengxu/vim-which-key'
" Plug 'kien/ctrlp.vim'
" Plug 'majutsushi/tagbar'
Plug 'suan/vim-instant-markdown'
" Plug 'tpope/vim-surround'
" Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'Yggdroot/indentLine'
" Plug 'w0rp/ale'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-obsession'
" Plug 'itchyny/lightline.vim'
Plug 'idanarye/vim-vebugger'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'easymotion/vim-easymotion'
" CocInstall
" Plug 'neoclide/coc-lists'
" Plug 'neoclide/coc-snippets'
" Plug 'neoclide/coc-pairs'
" Plug 'neoclide/coc-python'
call plug#end()

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

filetype plugin indent on

""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""
colorscheme monokai

autocmd FileType python set foldmethod=indent tabstop=4 textwidth=79
" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %
" 解决consle输出乱码
language messages zh_CN.utf-8
"关闭错误bell
set noeb
set vb t_vb=
" 打开语法高亮
syntax enable
" 开启语法检测
syntax on
" 设置行号
set nu
" 高亮搜索命中的文本
set hlsearch
" 随着键入即时搜索
set incsearch
" 文件修改之后自动载入
set autoread
" 搜索时忽略大小写
set ignorecase
" 有一个或以上大写字母时仍大小写敏感
set smartcase
" 在状态栏显示正在输入的命令
set showcmd
" 显示括号配对情况
set showmatch
" :next, :make 命令之前自动保存
set autowrite
" 退格键可用
set backspace=2
" 退格键一次删掉4个空格
set smarttab
" 缩进
set autoindent
set smartindent
" " 保存文件时自动删除行尾空格或Tab
" autocmd BufWritePre * :%s/\s\+$//e
" " 保存文件时自动删除末尾空行
" autocmd BufWritePre * :%s/^$\n\+\%$//ge
" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
" 代码折叠 光标在缩进下方时用za命令折叠或展开
set fdm=indent
" 默认展开
set foldlevel=99
" 突出显示当前行，列
"set cursorline
"set cursorcolumn
" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" " 显示状态行当前设置
" set statusline

" " 设置状态行显示常用信息
" " %F 完整文件路径名
" " %m 当前缓冲被修改标记
" " %m 当前缓冲只读标记
" " %h 帮助缓冲标记
" " %w 预览缓冲标记
" " %Y 文件类型
" " %b ASCII值
" " %B 十六进制值
" " %l 行数
" " %v 列数
" " %p 当前行数占总行数的的百分比
" " %L 总行数
" " %{...} 评估表达式的值，并用值代替
" " %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" " %{&ff} 显示文件类型
" set statusline=%F%m%r%h%w%=\ [ft=%Y]\ %{\"[fenc=\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"]\"}\ [ff=%{&ff}]\ [asc=%03.3b]\ [hex=%02.2B]\ [pos=%04l,%04v][%p%%]\ [len=%L]

" " 设置 laststatus = 0 ，不显式状态行
" " 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
" " 设置 laststatus = 2 ，总是显式状态行
set laststatus=2
"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""
" " j k 移动行的时候光标始终在屏幕中间
" nnoremap j jzz
" nnoremap k kzz

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" 映射切换tab的键位
nnoremap [t :tabp<CR>
nnoremap ]t :tabn<CR>

" F2切换行号显示
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3打开目录树
nmap <silent> <F3> :NERDTreeToggle<CR>

" F4显示TagList
nmap <silent> <F4> :Vista coc<CR>

" F5运行脚本
" autocmd FileType python nmap <F5> :CocCommand python.execInTerminal <CR>
" autocmd FileType python imap <F5> <Esc>:CocCommand python.execInTerminal <CR>
" autocmd FileType python vmap <F5> <Esc>:CocCommand python.execInTerminal <CR>

autocmd FileType python nnoremap <buffer> <C-F5> :call vebugger#pdb#start("%:p")<CR>
"":VBGstartPDB "%:p"<CR>
autocmd FileType python inoremap <buffer> <C-F5> <Esc>:call vebugger#pdb#start("%:p")<CR>
autocmd FileType python vnoremap <buffer> <C-F5> <Esc>:<call vebugger#pdb#start("%:p")<CR>

nnoremap <F5> :call <SID>compile_and_run()<CR>
inoremap <F5> <Esc>:call <SID>compile_and_run()<CR>
vnoremap <F5> <Esc>:call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! time python3 %"
    endif
endfunction

let g:asyncrun_open = 15

" " F5运行脚本
" if exists("$VIRTUAL_ENV")
    " autocmd FileType python nnoremap <buffer> <F5> :!time $VIRTUAL_ENV'/bin/python' "%:p"<CR>
" else
    " autocmd FileType python nnoremap <buffer> <F5> :!time python "%:p"<CR>
" endif

" "一键运行代码
" autocmd FileType python nnoremap <F5> :call CompileRunGcc()<CR>
   " func! CompileRunGcc()
       " exec "w"
" if &filetype == 'c'
           " exec "!g++ % -o %<"
           " exec "!time ./%<"
" elseif &filetype == 'cpp'
           " exec "!g++ % -o %<"
           " exec "!time ./%<"
" elseif &filetype == 'java'
           " exec "!javac %"
           " exec "!time java %<"
" elseif &filetype == 'sh'
           " :!time bash %
" elseif &filetype == 'python'
           " exec "!time python %"
" elseif &filetype == 'html'
           " exec "!firefox % &"
" elseif &filetype == 'go'
   " "        exec "!go build %<"
           " exec "!time go run %"
" elseif &filetype == 'mkd'
           " exec "!~/.vim/markdown.pl % > %.html &"
           " exec "!firefox %.html &"
" endif
   " endfunc


" <F6> 新建标签页
map <F6> <Esc>:tabnew<CR>

" <F7> 拷贝粘贴代码不破坏缩进
set pastetoggle=<F7>

if has("win64") || has("win32")
    " <F8> sort import
    autocmd FileType python map <buffer> <F8> :CocCommand python.sortImports<CR>
    " !autopep8 -i -a --ignore=W690,E501 %:p<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :call CocAction('format')<CR>
    " !yapf -i %:p --style=pep8<CR><CR>
else
    " <F8> sort import
    autocmd FileType python map <buffer> <F8> :CocCommand python.sortImports<CR>
    " !autopep8 -i -a --ignore=W690,E501 %:p;isort %:p;<CR><CR>
    " <F9> pep8 by yapf
    autocmd FileType python map <buffer> <F9> :call CocAction('format')<CR>
    " !yapf -i %:p --style=pep8;isort %:p;<CR><CR>
endif


" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" 左右分割窗口Ctrl+w +v
" 上下分割窗口Ctrl+w +s
" 关闭窗口Ctrl+w  +q

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" " quicker window resize
" nnoremap <C-Enter> <C-w>=
" nnoremap <C-Left> <C-w><
" nnoremap <C-Right> <C-w>>
" nnoremap <C-Up> <C-w>+
" nnoremap <C-Down> <C-w>-


" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %
""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""
" NerdCommenter
let g:NERDSpaceDelims=1

" NERDTREE
" 不显示的文件
let NERDTreeIgnore=['\.pyc$', '\~$']
" show nerdtree when starts up
" autocmd vimenter * NERDTree
" 退出最后一个buff时也退出nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 退出最后一个buff时也退出所有窗口
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif

" instant-markdown
let g:instant_markdown_slow = 1

" airline
" let g:airline_section_y = '%{strftime("%H:%M")}'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" configure the title text for quickfix buffers >
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

" " gitgutter
" let g:gitgutter_sign_modified = '*'
" let g:gitgutter_sign_removed = '-'

" " ale
" let b:ale_linters = ['flake8']
" let b:ale_fixers = [
" \   'remove_trailing_lines',
" \   'isort',
" \   'ale#fixers#generic_python#BreakUpLongLines',
" \   'yapf',
" \]
" let g:ale_fix_on_save = 1


" coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> for trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> for confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"  open yank list
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)


" set statusline+=%{coc#status()}

" " Add diagnostic info for https://github.com/itchyny/lightline.vim
" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ 'active': {
      " \   'left': [ [ 'mode', 'paste' ],
      " \             [ 'cocstatus', 'method', 'readonly', 'filename', 'modified' ] ]
      " \ },
      " \ 'component_function': {
      " \   'cocstatus': 'coc#status',
      " \   'method': 'NearestMethodOrFunction'
      " \ },
      " \ }

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:airline#extensions#coc#enabled = 1
let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'


"vista.vim
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

" set statusline+=%{NearestMethodOrFunction()}
" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

" "which_key
" let g:mapleader = "\<Space>"
" let g:maplocalleader = ","

" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :WhichKey ','<CR>

"vim-easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Vebugger
"设置Vebugger的命令前缀
let g:vebugger_leader=','
