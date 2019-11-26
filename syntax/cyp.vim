" Vim syntax file
"   Language: Check Your Proof
"   Maintainer: HE7086 <https://github.com/HE7086>
"
" Last Modified: Tue 26 Nov 2019 12:34:08 PM CET
"   Version: 0.1.2

if exists("b:current_syntax")
    finish
endif

syntax sync fromstart

syntax keyword cypKeyword       Proof Case QED Assumption
syntax keyword cypKeyword       on with
syntax keyword cypTheory        axiom goal IH data declare_sym
syntax match   cypProof         /by induction/
syntax match   cypProof         /by extensionality/
syntax match   cypProof         /by case analysis/
syntax match   cypProof         /by cheating/
syntax keyword cypLemma         Lemma
syntax keyword cypBool          True False
syntax match cypToShow          /To show/

syntax match cypComment         /^--.*/

syntax keyword cypTypes         Int Integer Bool Char String List


if !exists("g:cyp_syntax_referbrace")
    syntax match cypReference       /(by .\{-})/
else
    syntax match cypReference       /\((\)\@\<\=by .\{-}\()\)\@\=/
endif
syntax match cypEqualEtc        /\.=\./
syntax match cypEqualEtc        /</
syntax match cypEqualEtc        />/
syntax match cypEqualEtc        /<=/
syntax match cypEqualEtc        />=/
syntax match cypArrow           /==>/
syntax match cypArrow           /<==/
syntax match cypCusLemma        /\(Lemma\)\@\<\=.\{-}\(:\)\@\=/


" syntax region cypProofs         start="Proof" end="QED" skip="Case"

if version < 508
    command -nargs=+ HiLink hi link <args>
else
    command -nargs=+ HiLink hi def link <args>
endif

if !exists("g:cyp_syntax_colorscheme")
    HiLink cypKeyword       Statement
    HiLink cypToShow        Statement
    HiLink cypTheory        Identifier
    HiLink cypProof         Type
    HiLink cypLemma         Include
    HiLink cypCusLemma      Keyword
    HiLink cypEqualEtc      Operator
    HiLink cypReference     Keyword
    HiLink cypBool          Boolean
    HiLink cypArrow         Conditional
    HiLink cypComment       Comment
    HiLink cypTypes         Statement
else
    HiLink cypKeyword       Keyword
    HiLink cypToShow        Keyword
    HiLink cypTheory        Identifier
    HiLink cypProof         Type
    HiLink cypLemma         Include
    HiLink cypCusLemma      Include
    HiLink cypEqualEtc      Operator
    HiLink cypReference     Function
    HiLink cypBool          Boolean
    HiLink cypArrow         Conditional
    HiLink cypComment       Comment
    HiLink cypTypes         Type
endif

delcommand HiLink
let b:current_syntax = "cyp"
