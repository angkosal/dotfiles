syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
set background=dark
let g:airline_theme='onehalfdark'

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif

hi Normal guibg=NONE ctermbg=NONE
