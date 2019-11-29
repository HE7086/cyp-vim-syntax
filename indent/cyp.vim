if exists('b:did_indent')
    finish
endif
let b:did_indent=1

setlocal indentexpr=GetCYPIndent()
setlocal autoindent nolisp nosmartindent
setlocal indentkeys+==Proof,=QED,=Case,=Assumption

" get shiftwidth
if exists('*shiftwidth')
  function s:sw()
    return shiftwidth()
  endfunction
else
  function s:sw()
    return &l:shiftwidth ? &l:shiftwidth : &l:tabstop
  endfunction
endif

function IsKeyWord()
    let lookingAt = getline('.')['.'-1] =~ '\k' ? expand('<cword>') : getline('.')['.'-1]
    if lookingAt =~ 'Proof|QED'

    endif

endfunction

function GetCYPIndentIntern()
    let prev_line = getline(a:line - 1)
    
endfunction

function GetCYPIndent()
    let ignorecase_save = &ignorecase
    try
        let &ignorecase = 0
        return GetCYPIndentIntern()
    finally
        let &ignorecase = ignorecase_save
    endtry
endfunction
