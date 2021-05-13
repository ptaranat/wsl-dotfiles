# Aliases
alias reload="exec zsh"
alias e=$EDITOR
alias c="clear"
alias python="python3"
alias ls="exa"
alias zshconf="e ~/.zshrc"
alias weather="curl wttr.in"
alias bat="batcat"
alias fd="fdfind"
alias rg="rgrep"
alias disks='echo "╓───── m o u n t . p o i n t s"; \
			echo "╙────────────────────────────────────── ─ ─ "; \
			lsblk -a; echo ""; \
			echo "╓───── d i s k . u s a g e";\
			echo "╙────────────────────────────────────── ─ ─ "; \
			df -h;'
alias fixdos="find . -type f -print0 | xargs -0 dos2unix"
alias memo="bat -p ~/memo.md"
alias lyn="learnyounode"
alias ljs="javascripting"
