" Vim syntax file
"   Language: Check Your Proof
"   Maintainer: HE7086 <https://github.com/HE7086>
"
" Last Modified: Mon 25 Nov 2019 09:35:05 PM CET
"   Version: 0.1

"if exists("b:current_syntax")
"    finish
"endif

syntax sync fromstart

syntax keyword cypKeyword       Proof Case QED
syntax keyword cypTheory        axiom goal induction IH
syntax keyword cypLemma         Lemma


syntax match cypReference       /(by .\{-})/
syntax match cypDotEquals       /\.=\./
syntax match cypCusLemma        /\(Lemma\)@<=.\{-}\(:\)@=/
syntax match cypToShow          /To show/


syntax region cypProofs         start="Proof" end="QED"

if version < 508
    command -nargs=+ HiLink hi link <args>
else
    command -nargs=+ HiLink hi def link <args>
endif

HiLink cypKeyword       Statement
HiLink cypToShow        Statement
HiLink cypTheory        Identifier
HiLink cypLemma         Include
HiLink cypCusLemma      Include
HiLink cypDotEquals     Operator
HiLink cypReference     Keyword

let b:current_syntax = "cyp"
