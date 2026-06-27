0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# FSH Colors
zstyle :plugin:fast-syntax-highlighting theme "neutral"
typeset -g FAST_THEME_NAME="neutral"
typeset -Ag FAST_HIGHLIGHT_STYLES

# 16-colour named palette (terminal palette indices 0-15). Referenced as $c[name]
# so styles read by colour name while staying palette-adaptive. bold = weight,
# reserved for commands and errors.
typeset -A c=(
  black 0  red     1  green     2  yellow     3  blue     4  magenta     5  cyan     6  white     7
  grey  8  br-red  9  br-green 10  br-yellow 11  br-blue 12  br-magenta 13  br-cyan 14  br-white 15
)
# 256-colour accents (no equivalent in the 16-colour palette)
c[orange]=208

FAST_HIGHLIGHT_STYLES[neutraldefault]=none

# Errors
FAST_HIGHLIGHT_STYLES[neutralunknown-token]=fg=$c[red],bold
FAST_HIGHLIGHT_STYLES[neutralmatherr]=fg=$c[red],bold

# Commands (bold = weight reserved for executable tokens)
FAST_HIGHLIGHT_STYLES[neutralreserved-word]=fg=$c[yellow],bold
FAST_HIGHLIGHT_STYLES[neutralalias]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralsuffix-alias]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralglobal-alias]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralbuiltin]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralfunction]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralcommand]=fg=$c[green],bold
FAST_HIGHLIGHT_STYLES[neutralprecommand]=fg=$c[green],bold,underline
FAST_HIGHLIGHT_STYLES[neutralhashed-command]=fg=$c[green],bold

# Quiet tokens (secondary)
FAST_HIGHLIGHT_STYLES[neutralcomment]=fg=$c[grey]
FAST_HIGHLIGHT_STYLES[neutralcommandseparator]=fg=$c[grey]
FAST_HIGHLIGHT_STYLES[neutralpath_pathseparator]=fg=$c[grey]

# Paths
FAST_HIGHLIGHT_STYLES[neutralpath]=fg=$c[cyan]
FAST_HIGHLIGHT_STYLES[neutralpath-to-dir]=fg=$c[blue]

# Arguments & quoting
FAST_HIGHLIGHT_STYLES[neutralsingle-hyphen-option]=fg=$c[br-blue]
FAST_HIGHLIGHT_STYLES[neutraldouble-hyphen-option]=fg=$c[br-blue]
FAST_HIGHLIGHT_STYLES[neutralback-quoted-argument]=fg=$c[br-white]
FAST_HIGHLIGHT_STYLES[neutralsingle-quoted-argument]=fg=$c[orange]
FAST_HIGHLIGHT_STYLES[neutraldouble-quoted-argument]=fg=$c[orange]
FAST_HIGHLIGHT_STYLES[neutraldollar-quoted-argument]=fg=$c[orange]
FAST_HIGHLIGHT_STYLES[neutralback-or-dollar-double-quoted-argument]=fg=$c[cyan]
FAST_HIGHLIGHT_STYLES[neutralback-dollar-quoted-argument]=fg=$c[cyan]
FAST_HIGHLIGHT_STYLES[neutralassign]=fg=$c[blue]
FAST_HIGHLIGHT_STYLES[neutralredirection]=fg=$c[magenta]
FAST_HIGHLIGHT_STYLES[neutralvariable]=fg=$c[br-cyan]
FAST_HIGHLIGHT_STYLES[neutralassign-array-bracket]=fg=$c[cyan]
FAST_HIGHLIGHT_STYLES[neutralexec-descriptor]=fg=$c[yellow]
FAST_HIGHLIGHT_STYLES[neutralsubcommand]=fg=$c[br-yellow]
FAST_HIGHLIGHT_STYLES[neutraloptarg-string]=fg=$c[yellow]
FAST_HIGHLIGHT_STYLES[neutraloptarg-number]=fg=$c[magenta]

# Globbing & history
FAST_HIGHLIGHT_STYLES[neutralglobbing]=fg=$c[br-magenta]
FAST_HIGHLIGHT_STYLES[neutralglobbing-ext]=fg=$c[br-magenta]
FAST_HIGHLIGHT_STYLES[neutralhistory-expansion]=fg=$c[br-red]

# Math
FAST_HIGHLIGHT_STYLES[neutralmathvar]=fg=$c[blue]
FAST_HIGHLIGHT_STYLES[neutralmathnum]=fg=$c[magenta]

# Control flow: for-loop
FAST_HIGHLIGHT_STYLES[neutralfor-loop-variable]=fg=$c[blue]
FAST_HIGHLIGHT_STYLES[neutralfor-loop-number]=fg=$c[magenta]
FAST_HIGHLIGHT_STYLES[neutralfor-loop-operator]=fg=$c[magenta]
FAST_HIGHLIGHT_STYLES[neutralfor-loop-separator]=fg=$c[br-green]

# Control flow: case
FAST_HIGHLIGHT_STYLES[neutralcase-input]=fg=$c[br-green]
FAST_HIGHLIGHT_STYLES[neutralcase-parentheses]=fg=$c[yellow]
FAST_HIGHLIGHT_STYLES[neutralcase-condition]=bg=$c[blue],none

# Here-strings
FAST_HIGHLIGHT_STYLES[neutralhere-string-tri]=fg=$c[yellow]
FAST_HIGHLIGHT_STYLES[neutralhere-string-text]=fg=$c[blue]
FAST_HIGHLIGHT_STYLES[neutralhere-string-var]=fg=$c[cyan],bg=$c[black]

# Brackets
FAST_HIGHLIGHT_STYLES[neutralpaired-bracket]=bg=$c[blue]
FAST_HIGHLIGHT_STYLES[neutralbracket-level-1]=fg=$c[green]
FAST_HIGHLIGHT_STYLES[neutralbracket-level-2]=fg=$c[yellow]
FAST_HIGHLIGHT_STYLES[neutralbracket-level-3]=fg=$c[cyan]
FAST_HIGHLIGHT_STYLES[neutralsingle-sq-bracket]=fg=$c[green]
FAST_HIGHLIGHT_STYLES[neutraldouble-sq-bracket]=fg=$c[green]
FAST_HIGHLIGHT_STYLES[neutraldouble-paren]=fg=$c[yellow]

# Subtle / correction (black slot reads as a faint tint, not a dark block)
FAST_HIGHLIGHT_STYLES[neutralcorrect-subtle]=fg=$c[blue],bg=$c[black]
FAST_HIGHLIGHT_STYLES[neutralincorrect-subtle]=fg=$c[red],bold,bg=$c[black]
FAST_HIGHLIGHT_STYLES[neutralsubtle-separator]=bg=$c[black],fg=$c[green]
FAST_HIGHLIGHT_STYLES[neutralsubtle-bg]=bg=$c[black]

FAST_HIGHLIGHT_STYLES[neutralrecursive-base]=fg=default
FAST_HIGHLIGHT_STYLES[neutralsecondary]=neutral

unset c
