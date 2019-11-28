if exists('b:did_indent')
    finish
endif
let b:did_indent=1

setlocal indentexpr=GetCYPIndent()
setlocal autoindent nolisp nosmartindent
setlocal indentkeys += 0],0)

function GetCYPIndent(line)
    let prev_line = getline(a:line - 1)
    
endfunction
