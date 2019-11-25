" Vim syntax file
"   Language: Check Your Proof
"   Maintainer: HE7086 <https://github.com/HE7086>
"
" Last Modified: Mon 25 Nov 2019 09:35:05 PM CET
"   Version: 0.1

if exists("b:current_syntax")
    finish
endif

syntax sync fromstart

syntax keyword cypKeyword       Lemma Proof Case QED
syntax keyword cypTheory        axiom goal induction IH


syntax match cypReference       "(by .+)"
syntax match cypDotEquals       "\.=\."
syntax match cypCusLemma        "^\s*Lemma .+:"


syntax region cypProofs         start="Proof" end="QED"
