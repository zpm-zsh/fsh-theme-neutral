# Fast Syntax Highlighting — Neutral Theme

A colour scheme for [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting) (FSH).

`neutral` uses the terminal's own 16-colour palette (indices 0–15) instead of
hard-coded RGB, so it adapts to whatever colour scheme the terminal already
uses. Weight (bold) is reserved for commands and errors; everything else is
distinguished by colour alone, keeping the line calm and readable. Bright
colours (8–15) separate token classes that would otherwise share a hue
(options vs paths, globbing vs redirection, subcommands vs arguments).

## Install (zpm)

```zsh
zpm load zpm-zsh/fsh-theme-neutral
```

The theme sets `zstyle :plugin:fast-syntax-highlighting theme "neutral"`; load it
after fast-syntax-highlighting.

## Colours

| Token group                                   | Style          |
|-----------------------------------------------|----------------|
| commands, functions, builtins, aliases        | green + bold   |
| precommand (`sudo`, `nice`, …)                | green + bold + underline |
| reserved words (`if`, `for`, …)               | yellow + bold  |
| unknown token, math error                     | red + bold     |
| comment, separators                           | grey (8)       |
| paths                                         | cyan           |
| path to existing dir                          | blue           |
| options (`-x`, `--long`)                      | bright blue    |
| quoted strings (`'…'`, `"…"`)                 | bright orange  |
| command substitution (`` `…` ``)              | bright white   |
| variables                                     | bright cyan    |
| subcommands (`git **commit**`)               | bright yellow  |
| redirections                                  | magenta        |
| globbing (`* ? [ ]`)                          | bright magenta |
| history expansion (`!!`, `!$`)                | bright red     |
| `case` / `for` body keywords                  | bright green   |
| bracket levels 1 / 2 / 3                      | green / yellow / cyan |
| subtle panels (corrections, here-string var)  | subtle background |

Bold marks only what runs (commands) or what is wrong (errors). The subtle
background panels use the terminal's `black` slot, which on a light scheme reads
as a faint tint rather than a dark block.
