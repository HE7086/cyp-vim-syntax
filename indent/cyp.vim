if exists('b:did_indent')
    finish
endif
let b:did_indent=1

setlocal indentexpr=GetCYPIndent()
setlocal autoindent nolisp nosmartindent
setlocal indentkeys+==Proof,=QED,=Case,=Assumption

" avoid multiple definitions
if exists("*GetCYPIndent")
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

" get shiftwidth
if exists("g:cyp_shiftwidth")
    function s:sw()
        return g:cyp_shiftwidth
    endfunction
elseif exists('*shiftwidth')
  function s:sw()
    return shiftwidth()
  endfunction
else
  function s:sw()
    return &l:shiftwidth ? &l:shiftwidth : &l:tabstop
  endfunction
endif

let s:keyword = '\((\s*by\s*\)\@\<\!\(Proof\|Case\|QED\|Assumption\|Lemma\|To\sshow\|IH\)\(\s*)\)\@\!' 

function GetCYPIndentIntern()
    let prev_num = prevnonblank(v:lnum - 1)

    " start of the file should not be indented
    if prev_num == 0
        return 0
    endif

    let next_num = nextnonblank(v:lnum + 1)

    let cur_text = getline(v:lnum)
    let prev_text = getline(prev_num)
    let next_text = getline(next_num)

    " start of a proof should be aligned to next line's .=.
    if cur_text !~ s:keyword && cur_text !~ '\.=\.'
        " next is a 'by reference'
        if next_text =~ '^\s*(by.*)\s*\.=\..*'
            return match(next_text, '\.=\.') + 4
        endif
    endif

    " parse 'by reference'
    if cur_text !~ s:keyword && cur_text =~ '\.=\.'
        while prev_num > 0 && prev_text !~ s:keyword
            let prev_num = prevnonblank(prev_num - 1)
            let prev_text = getline(prev_num)
        endwhile

        return indent(prev_num) + s:sw()
    endif

    let ind = indent(prev_num)

    if cur_text =~ '^\s*Case' && prev_text =~ '^\s*QED'
        return ind - s:sw()
    endif

    if cur_text =~ '^\s*Case' && prev_text =~ '^\s*Proof'
        return ind + s:sw()
    endif

    " in a block of Proof or Case
    if prev_text =~ '^\s*\(Proof\|Case\)'
        let ind += s:sw()
    endif

    if cur_text =~ '^\s*QED'
        let ind -= s:sw()
    endif

    return ind
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

let &cpo = s:cpo_save
unlet s:cpo_save
