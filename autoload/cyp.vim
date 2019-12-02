if exists("b:cyp_format_command")
    finish
endif

function cypFormatLine() 
    let lnum = v:lnum
    let cur_text = getline(lnum)
    if cur_text =~ '(by .*)\s\.=\..*'
        let mod_text = cur_text

        setline(mod_text)
    endif

endfunction


let b:cyp_format_command = 1
