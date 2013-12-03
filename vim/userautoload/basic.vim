" ステータス行を常に表示する
set laststatus=2

" コマンドラインに使われる画面上の行数
set cmdheight=1

" Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する
set showmode

"モードラインの無効化
set nomodeline

" すべてのモードでマウスが有効
set mouse=a


set number

" 行番号を表示する。
set number

" 閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set showmatch

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//e

helptags $HOME/.vim/bundle/vimdoc-ja/doc
set helplang=ja,en
set statusline=%F%m%r%h%w\%=[TYPE=%Y]\[FORMAT=%{&ff}]\[ENC=%{&fileencoding}]\[LOW=%l/%L]

set nu
set hlsearch
