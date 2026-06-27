#!/usr/bin/env zsh
# Sources the theme and asserts key style values match the design.
set -e
typeset -Ag FAST_HIGHLIGHT_STYLES
source "${0:A:h}/../fsh-theme-neutral.plugin.zsh"

fail=0
check() {
  local key=$1 want=$2
  local got=${FAST_HIGHLIGHT_STYLES[$key]}
  if [[ $got != $want ]]; then
    print -r -- "FAIL $key: want '$want' got '$got'"
    fail=1
  fi
}

# command-group keeps bold (green=2)
check neutralcommand          'fg=2,bold'
check neutralfunction         'fg=2,bold'
check neutralbuiltin          'fg=2,bold'
check neutralalias            'fg=2,bold'
check neutralprecommand       'fg=2,bold,underline'
# errors keep bold (red=1)
check neutralunknown-token    'fg=1,bold'
check neutralmatherr          'fg=1,bold'
check neutralincorrect-subtle 'fg=1,bold,bg=0'
check neutralreserved-word    'fg=3,bold'
# quiet tokens (grey=8)
check neutralcomment              'fg=8'
check neutralpath_pathseparator   'fg=8'
check neutralcommandseparator     'fg=8'
# bold dropped from ordinary tokens
check neutralpath             'fg=6'
check neutralfor-loop-operator 'fg=5'
# quoted strings -> bright orange (256-colour accent)
check neutralsingle-quoted-argument 'fg=208'
check neutraldouble-quoted-argument 'fg=208'
check neutraldollar-quoted-argument 'fg=208'
# bright (8-15) assignments
check neutralvariable             'fg=14'  # br-cyan
check neutralsingle-hyphen-option 'fg=12'  # br-blue
check neutraldouble-hyphen-option 'fg=12'
check neutralsubcommand           'fg=11'  # br-yellow
check neutralglobbing             'fg=13'  # br-magenta
check neutralglobbing-ext         'fg=13'
check neutralhistory-expansion    'fg=9'   # br-red
check neutralback-quoted-argument 'fg=15'  # br-white
check neutralcase-input           'fg=10'  # br-green
check neutralfor-loop-separator   'fg=10'
# black slot (0) preserved as subtle panel
check neutralsubtle-bg        'bg=0'
check neutralcorrect-subtle   'fg=4,bg=0'
check neutralpaired-bracket   'bg=4'

(( fail )) && { print "TEST FAILED"; exit 1 }
print "ALL OK"
