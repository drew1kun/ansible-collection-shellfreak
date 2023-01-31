" vim-airline template by danrneal (http://github.com/danrneal)
" Cipherpunk theme by drew1kun

let g:airline#themes#cipherpunk#palette = {}

let s:RED    = '#D75E5E'
let s:GREEN  = '#85AC02'
let s:YELLOW = '#CEA802'
let s:BLUE   = '#5C83D0'
let s:CYAN   = '#5ABDBF'
let s:BLACK  = '#303030'
let s:DGREY  = '#444444'
let s:LGREY  = '#BCBCBC'
let s:WHITE  = '#FFFFFF'

let s:TERM_RED    = 167
let s:TERM_GREEN  = 106
let s:TERM_YELLOW = 179
let s:TERM_BLUE   = 68
let s:TERM_CYAN   = 73
let s:TERM_BLACK  = 235
let s:TERM_DGREY  = 238
let s:TERM_LGREY  = 250
let s:TERM_WHITE  = 253

let s:GREY0  = s:WHITE
let s:GREY1  = s:LGREY
let s:GREY2  = s:DGREY
let s:BG     = s:BLACK

let s:TERM_GREY0  = s:TERM_WHITE
let s:TERM_GREY1  = s:TERM_LGREY
let s:TERM_GREY2  = s:TERM_DGREY
let s:TERM_BG     = s:TERM_BLACK

" Normal mode
let s:N1 = [ s:BG, s:GREEN, s:TERM_BG, s:TERM_GREEN ]
let s:N2 = [ s:GREY1, s:GREY2, s:TERM_GREY1, s:TERM_GREY2 ]
let s:N3 = [ s:GREEN, s:BG, s:TERM_GREEN, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#cipherpunk#palette.normal_modified = {
    \ 'airline_c': [ s:GREY0, s:BG, s:TERM_GREY0, s:TERM_BG, 'bold' ],
    \ }

" Command mode
let s:C1 = [ s:BG, s:BLUE, s:TERM_BG, s:TERM_BLUE ]
let s:C2 = [ s:GREY1, s:GREY2, s:TERM_GREY1, s:TERM_GREY2 ]
let s:C3 = [ s:BLUE, s:BG, s:TERM_BLUE, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)
let g:airline#themes#cipherpunk#palette.commandline_modified = {
    \ 'airline_c': [ s:GREY0, s:BG, s:TERM_GREY0, s:TERM_BG, 'bold' ],
    \ }

" Insert mode
let s:I1 = [ s:BG, s:CYAN, s:TERM_BG, s:TERM_CYAN ]
let s:I2 = s:N2
let s:I3 = [ s:CYAN, s:BG, s:TERM_CYAN, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#cipherpunk#palette.insert_modified = g:airline#themes#cipherpunk#palette.normal_modified

" Replace mode
let s:R1 = [ s:BG, s:RED, s:TERM_BG, s:TERM_RED ]
let s:R2 = s:N2
let s:R3 = [ s:RED, s:BG, s:TERM_RED, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#cipherpunk#palette.replace_modified = g:airline#themes#cipherpunk#palette.normal_modified

" Visual mode
let s:V1 = [ s:BG, s:YELLOW, s:TERM_BG, s:TERM_YELLOW ]
let s:V2 = s:N2
let s:V3 = [ s:YELLOW, s:BG, s:TERM_YELLOW, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#cipherpunk#palette.visual_modified = g:airline#themes#cipherpunk#palette.normal_modified

" Inactive mode
let s:IA1 = [ s:BG, s:GREY2, s:TERM_BG, s:TERM_GREY2 ]
let s:IA2 = s:N2
let s:IA3 = [ s:GREY2, s:BG, s:TERM_GREY2, s:TERM_BG ]
let g:airline#themes#cipherpunk#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
let g:airline#themes#cipherpunk#palette.inactive_modified = g:airline#themes#cipherpunk#palette.normal_modified
