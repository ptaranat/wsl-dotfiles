# Aliases
alias reload="exec zsh"
alias e=$EDITOR
alias c="clear"
alias h="history -10"
alias hg="history | grep"
# Replace ls with exa
alias ls="exa"
alias l="exa --group-directories-first"
alias ll="exa -l --group-directories-first --git"
alias la="exa -la --group-directories-first --git"
alias lm="exa -ls modified --group-directories-first --reverse --git"
alias lmr="exa -ls modified --group-directories-first --git"
# Edit configs
alias zshconf="$EDITOR ~/.zshrc"
alias zshalias="$EDITOR ~/.zsh/06-aliases.zsh"
# Reminder
alias memo="bat -p ~/memo.md"
# Overrides
alias python="python3"
# alias bat="batcat"
alias fd="fdfind"
alias rg="rgrep"
# Toys
alias weather="curl wttr.in"
alias disks='echo "╓───── m o u n t . p o i n t s"; \
			echo "╙────────────────────────────────────── ─ ─ "; \
			lsblk -a; echo ""; \
			echo "╓───── d i s k . u s a g e";\
			echo "╙────────────────────────────────────── ─ ─ "; \
			df -h;'
# Recursively convert line endings to Unix
alias fixdos="find . -type f -print0 | xargs -0 dos2unix"
# JS and Node
alias lyn="learnyounode"
alias ljs="javascripting"
# GitHub
alias ghc="gh repo clone"
# Update cargo packages (need cargo-update)
alias cargoupdate="cargo install-update -a"
# Filetype
alias -s md="glow -p"

# Search for aliases
function what() {
	if [ "$1" != "" ]
	then
		alias | grep --color=always "$1" | bat
	else
		alias | bat
	fi
}

# View git diff in bat
function batdiff() {
	git diff --name-only --diff-filter=d | xargs bat --diff
}
