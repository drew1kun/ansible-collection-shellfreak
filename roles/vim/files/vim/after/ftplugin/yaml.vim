"================================== YAML =======================================
let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }

setlocal tabstop=2      " Number of tab is four spaces
setlocal softtabstop=2  " Delete tabs as one keystroke
setlocal shiftwidth=2   " Number of spaces to use for autoindenting
setlocal nocopyindent   " Copy the previous indentation on autoindenting
setlocal nowrap         " Show long lines as one line (scroll horisontally to see entire line)
setlocal formatoptions+=tcroql  " Autocomment for '#, //, /**/' comments (does not work for .vim files like .vimrc)
setlocal list listchars=tab:▸·,trail:·,precedes:←,extends:→,nbsp:‡ ",eol:§

" Make autocomments work properly and prevent indenting current line when pressing Enter:
filetype plugin indent off

" If filetype plugin indent has to be used, then use following function
" to prevent filetype indent plugin indenting current line when pressing Enter
" This must go after 'filetype plugin indent on'
"augroup overrideftplugins
"    au!
"    au FileType * set cinkeys= indentkeys=
"augroup END
" This must be added in .vim/after/ftplugin/yaml.vim, but removed from
" .vim/after/ftplugin/ansible.vim
"===============================================================================
