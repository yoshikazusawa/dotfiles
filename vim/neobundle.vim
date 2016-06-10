" Let NeoBundle manage NeoBundle
NeoBundle 'Shougo/neobundle.vim'

" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
NeoBundle 'https://github.com/clausreinke/typescript-tools.vim'

NeoBundle 'https://github.com/elzr/vim-json.git'
let g:vim_json_syntax_conceal = 0
NeoBundle 'stephpy/vim-yaml'
"NeoBundle 'ShowMarks'
NeoBundle 'thinca/vim-visualstar'

NeoBundle 'Shougo/neocomplcache'

NeoBundle "kien/ctrlp.vim"
NeoBundle "sudar/vim-arduino-syntax"
NeoBundle 'L9'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'The-NERD-tree'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'ref.vim'
NeoBundle 'surround.vim'
NeoBundle 'taglist.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'mru.vim'
NeoBundle 'vcscommand.vim'

NeoBundle 'Align'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'scrooloose/syntastic'



"NeoBundle 'airblade/vim-gitgutter'


" My Bundles here:
"
" Note: You don't set neobundle setting in .gvimrc!
" Original repos on github
"NeoBundle 'Lokaltog/vim-easymotion'
"NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"NeoBundle 'FuzzyFinder'
"NeoBundle 'rails.vim'
" Non github repos
"NeoBundle 'git://git.wincent.com/command-t.git'
" Non git repos
"NeoBundle 'http://svn.macports.org/repository/macports/contrib/mpvim/'
"NeoBundle 'https://bitbucket.org/ns9tks/vim-fuzzyfinder'
