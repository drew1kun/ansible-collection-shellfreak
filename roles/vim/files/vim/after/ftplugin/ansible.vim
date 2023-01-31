"============================== ANSIBLE ========================================
let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }

setlocal tabstop=2      " Number of spaces in one tab
setlocal softtabstop=2  " Delete tabs as one keystroke
setlocal shiftwidth=2   " Number of spaces to use for autoindenting

setlocal nocopyindent  " Copy the previous indentation on autoindenting

setlocal nowrap      " Show long lines as one line (scroll horisontally to see entire line)
setlocal formatoptions+=tcroql  " Autocomment for '#, //, /**/' comments (does not work for .vim files like .vimrc)
setlocal list listchars=tab:▸·,trail:·,precedes:←,extends:→,nbsp:‡ ",eol:§
"===============================================================================
