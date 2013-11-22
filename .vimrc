colorscheme molokai
" g:molokai_original=1
" g:rehash256 = 1
" background=dark

execute pathogen#infect()
syntax on
filetype plugin indent on

"autocmd FileType python setlocal omnifunc=jedi#complete
"let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#force_omni_input_patterns.python = '[^. \t]\.\w*'

autocmd BufRead,BufNewFile *.log set syntax=log4j
