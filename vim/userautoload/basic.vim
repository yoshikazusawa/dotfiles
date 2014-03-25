"Vi互換モードをオフにする
set notimeout          " マッピングについてタイムアウトしない
set ttimeout           " 端末のキーコードについてタイムアウトする
set timeoutlen=100     " 100 ミリ秒後にタイムアウトする"

" ステータス行を常に表示する
set laststatus=2

" コマンドラインに使われる画面上の行数
set cmdheight=1

" Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する
set showmode

set title        "ウィンドウのタイトルを書き換える
set cursorline   "カーソル行を強調表示

"モードラインの無効化
set nomodeline

" indent
set autoindent
set smartindent

" すべてのモードでマウスが有効
set mouse=a
"マウス関連"
set ttymouse=xterm2

" 行番号を表示する。
set number

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set showmatch

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//e

helptags $HOME/.vim/bundle/vimdoc-ja/doc
set helplang=ja,en
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

set hlsearch

" map
nnoremap j gj
nnoremap k gk
