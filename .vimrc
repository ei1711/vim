" Setting of ei1711's Vim.
filetype plugin indent on
filetype on
syntax enable               " 構文毎に文字色を変化させる

"--- Color ---
" colorscheme industry
if $COLORTERM != 'gnome-terminal'
    set background=dark
    set term=xterm-256color
    colorscheme molokai
else
    set t_Co=16
    hi comment ctermfg=6
    hi LineNr ctermfg=15
endif
"-------------

"--- Key Mapping ---
"左右のカーソル移動で行を跨いで移動
set whichwrap=b,s,h,l,<,>,[,],~

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

noremap y "+y

" vimのカーソル移動を表示行単位で行う
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
set backspace=indent,eol,start  " バックスペースを有効にする
" 数字のインクリメント,デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
"-------------------

"--- Character Encoding ---
set encoding=UTF-8     " Vimを起動するときの文字コード(EUC-JP)
set fileencoding=UTF-8 " 保存時の文字コード(EUC-JP)
set fileformats=unix,dos,mac    " 改行コードの自動判別(左側が優先される)
set ambiwidth=double    " □ や ○ が崩れる問題を解決
"--------------------------

"--- Files Processing ---
set confirm             " 保存されていないファイルがある場合は終了前に保存確認をする
set hidden              " 保存されていないファイルがある場合でも別のファイルを開くことが出来る
set autoread            " 編集中のファイルが変更されたら自動で読み直す
set noswapfile          " スワップファイルを作らない
set backup              " ファイルのバックアップを有効にする
set writebackup         " 編集前のファイルをバックアップファイルとする
" $HOME/05_Backupをバックアップファイルの保存先とする
set backupdir=$HOME/05_Backup
" バックアップを取得するファイル名を「ファイル名.タイムスタンプ」とする
au BufWritePre * let &bex = '.' . strftime("%Y%m%d_%H%M%S")
"------------------------

"--- Search & Substitution ---
set hlsearch            " 検索結果文字列のハイライトを有効にする
set incsearch           " インクリメンタルサーチを行う
set ignorecase          " 検索時に大文字小文字の区別をしない
set smartcase           " 大文字と小文字が混在した検索のみ、大文字小文字の区別をする
set wrapscan            " 最後尾まで検索を終えたら、次の検索で先頭へ移動する
set gdefault            " 置換時、 g オプションをデフォルトで有効にする
nnoremap <silent> <ESC><ESC> :nohlsearch<CR> " ESCキー連打でハイライトを消す
"-----------------------------

"--- Tab & Indent ---
set smarttab
set expandtab           " Tabの代わりにSpaceを使う
set tabstop=4           " Tab幅を4にする
set shiftwidth=4        " オートインデントでずれる幅
set softtabstop=4       " 連続した空白に対してTabやBackSpaceでカーソルが動く幅
set autoindent          " 改行時に前行のインデントを継続する
set smartindent         " 改行時に入力された行の末尾に合わせて次行のインデントを増減する
set cindent
"set tabstop=2           " Tab幅を4にする
"set shiftwidth=2        " オートインデントでずれる幅
"set softtabstop=2       " 連続した空白に対してTabやBackSpaceでカーソルが動く幅
"--------------------
set wrap                " 折り返して表示
set virtualedit=block,onemore
set notitle
set ruler               " ルーラーを表示
set number              " 行番号を表示
set list                " Tab や EOF を を可視化する
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%,eol:$
set wildmenu
set wildmode=longest:full
set showcmd             " 入力中のコマンドをステータスに表示する
set cursorline          " 現在の行を強調表示
set showmatch           " 括弧の対応関係を表示
set matchtime=1
set history=256         " historyを256件保存

" 履歴に保存する情報の指定
set viminfo='100,/50,%,<1000,f50,s100,:100,c,h,!

set laststatus=2        " ステータスラインを常に表示
set scrolloff=3         " スクロールの余裕を確保する
" ステータスラインに表示する情報の指定
" ファイルタイプ
set statusline=[Type=%Y]
" ファイル名(絶対パス表示 > 現在は相対パスに設定)
set statusline+=%f
"set statusline+=%F
" ヘルプページなら[HELP]と表示
set statusline+=%h
" 変更チェックの表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" プレビューウィンドウなら[Preview]と表示
set statusline+=%w
" これ以降は右寄せ
set statusline+=%=
" ファイルエンコーディングを表示(現在はファイルフォーマットも表示)
"set statusline+=[Enc=%{&fenc!=''?&fenc:&enc}]
set statusline+=[%{&fenc!=''?&fenc:&enc}:%{&ff}]
" ファイルフォーマット
"set statusline+=[Format=%{&ff}]
" 現在行数/全行数
set statusline+=[Row=%4l/%4L]
" 現在位置のパーセンテージ
set statusline+=[%3p%%]
" バッファNo.
set statusline+=[Buff=%n]
" ホスト名
"set statusline+=[Host=%{matchstr(hostname(),'\\w\\+')}]

" ステータスラインの色
highlight StatusLine term=NONE cterm=NONE ctermfg=black ctermbg=white

" コメントの色をDarkCyanに変更
highlight Comment ctermfg=DarkCyan

" yankしたテキストをクリップボードに格納
set clipboard+=unnamed,autoselect

" コマンドラインモードでTabによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full

" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

" インサートモードに入るときに自動でコメントアウトされないようにする
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"----------------

"--- Template ---
autocmd BufNewFile *.c 0r $HOME/.vim/template/c.txt
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/cpp.txt

"----------------
"全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" マウスでの操作を有効にする
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

" クリップボードからのペースト時にautoindentを無効にする
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

" CUIでVimを使用した際に生じるEscのディレイ解消
if !has('gui_running')
    set timeout timeoutlen=1000 ttimeoutlen=50
endif

" ビープ音を消す
set vb t_vb=
