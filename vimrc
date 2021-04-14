"-----------------------
" Vundle plugin Config
"-----------------------

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'Lokaltog/vim-powerline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'SirVer/ultisnips'
Plugin 'derekwyatt/vim-protodef'
Plugin 'preservim/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'sjl/gundo.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'suan/vim-instant-markdown'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()


"-------------
" Vim FileType
"--------------
" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype indent on 

" enable syntax hightlight and completion
syntax on
syntax enable

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType cpp set omnifunc=ccomplete#Complete
" TODO add sys lib ctags and the omnifunc
let OmniCpp_DefaultNamespaces = ["_GLIBCXX_STD"]
set tags+=/usr/include/c++/4.8.5/stdcpp.tags


"------------------
" Vim ShortCut Key 
"------------------
" THE LEADER !!!
let mapleader=";"

" define the shortcut key to line start or line end
nmap LB 0
nmap LE $
" copy selected context to sys clipboard
vnoremap <Leader>y "+y
" copy clipboard to vim
nmap <Leader>p "+p
" close now window
nmap <Leader>q :q<CR>
" save now window
nmap <Leader>w :w<CR>
" save all window and exit vim
nmap <Leader>WQ :wa<CR>:q<CR>
" exit vim without any save
nmap <Leader>Q :qa!<CR>
" traverse all sub windows
nnoremap nw <C-W><C-W>
" jump to right window 
nnoremap <Leader>lw <C-W>l
" jump to left window 
nnoremap <Leader>hw <C-W>h
" jump to up window 
nnoremap <Leader>kw <C-W>k
" jump to down window 
nnoremap <Leader>jw <C-W>j
" jump between pairing operator
nmap <Leader>M %


" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" sublime key bindings
nmap <D-]> >>
nmap <D-[> <<
vmap <D-[> <gv
vmap <D-]> >gv

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

"-----------------------
" Session && Viminfo
"-----------------------
set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
" save undo history
set undodir=~/.undo_history/
set undofile
" save session 
map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
" recover session 
map <leader>rs :source my.vim<cr> :rviminfo my.viminfo<cr>


"--------
" Vim UI
"--------
" color scheme
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd


" for gui sys menu toolbar 
set guioptions-=m
set guioptions-=T
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline 
set cursorcolumn

" search
set incsearch
set hlsearch
set ignorecase
set smartcase

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
set ruler                                                         " show cursor postion
" set relativenumber
"set foldmethod=indent                                            " base indenet or syntax flod code
set foldmethod=syntax
set nofoldenable                                                  " when open close the fold
set wildmenu                                                      " wild complete


" Default Indentation
set autoindent
set smartindent     " indent when
set tabstop=4       " tab width
set softtabstop=4   " backspace
set shiftwidth=4    " indent width
" set textwidth=79
" set smarttab
set expandtab       " expand tab to space
set nowrap          " ban wrap

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

"-----------------
" Plugin Settings
"-----------------

" powerline
"let g:Powerline_colorscheme='solarized256'
 
" cpp-enhanced-highlight
syntax keyword cppSTLtype initializer_list

" vim-fswitch
" *.cpp <-> *.h 
nmap <silent> <Leader>sw :FSHere<cr>

" indent-guides
" startup with vim 
let g:indent_guides_enable_on_vim_startup=1
" show indent from level ? 
let g:indent_guides_start_level=2
" guide block size 
let g:indent_guides_guide_size=1
" key i to open/close 
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" vim-signature 
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

" tagbar
" tagbar window show on the left
let tagbar_left=1 
"  show/hide window (identifier list by tag)
nnoremap <Leader>ilt :TagbarToggle<CR> 
" windos width 
let tagbar_width=32 
" tagbar window don't show bullshit info 
let g:tagbar_compact=1
" which reserved word gen to key
let g:tagbar_type_cpp = {
         \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }

" traverse tags 
nmap <Leader>tn :tnext<CR>
nmap <Leader>tp :tprevious<CR>

" indexer
" default --c++-kinds=+p+l reset to  --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" --fields=+iaS can't satify YCM reset to--fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" YCM
nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
" Only #include or had openfile
nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>

" CtrlSF
nnoremap <Leader>sp :CtrlSF<CR>*/

" NERD Commenter
" <leader>cc comment
" <leader>cu canlce comment

" DrawIt
" DrawIt --- start draw

" UltiSnips
" please place in ~/.vim/bundle/ultisnips/mysnippets
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" UltiSnips hotkey tab confirm with YCM, so reset 
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" Nerdtree 
" file list
nmap <Leader>fl :NERDTreeToggle<CR>
" set win size 
let NERDTreeWinSize=32
" win position 
let NERDTreeWinPos="right"
" is show hidden file 
let NERDTreeShowHidden=1
" NERDTree is show verbose info 
let NERDTreeMinimalUI=1
" when delete file is delete buff 
let NERDTreeAutoDeleteBuffer=1

" MiniBufExplorer
" show/hidden MiniBufExplorer
map <Leader>bl :MBEToggle<cr>
" buffer switch hotkey 
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

"------------------
" Useful Functions
"------------------
" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif


" confirm: is need confirm
" wholeword: is need wholeword match
" replace: need be replace str
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction

" not confirm not wholeword 
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" not confirm wholeword 
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm not wholeword 
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" confirm wholeword 
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

