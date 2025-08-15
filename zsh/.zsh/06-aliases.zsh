# Aliases
alias reload="exec zsh"
alias e=$EDITOR
alias c="clear"
alias h="history -10"
alias hg="history | grep"
alias ZZ="exit"
alias q="exit"
alias neovide="/c/Users/Panat/bin/neovide.exe --wsl --geometry=200x60"
# Replace ls with exa
alias ls="exa"
alias l="exa --group-directories-first"
alias ll="exa -l --group-directories-first --git"
alias la="exa -la --group-directories-first --git"
alias lm="exa -ls modified --group-directories-first --reverse --git"
alias lmr="exa -ls modified --group-directories-first --git"
# Edit configs
alias zshrc="$EDITOR ~/.zshrc"
alias zshalias="$EDITOR ~/.zsh/06-aliases.zsh"
alias zshenv="$EDITOR ~/.zsh/01-environment.zsh"
alias zshrpg="$EDITOR ~/.zsh/07-rpg.zsh"
alias dots="cd ~/.dotfiles"
alias vimrc="$EDITOR ~/.vim/general.vim"
alias vimplug="$EDITOR ~/.vim/plugins.vim"
alias vimplugs="$EDITOR ~/.vim/plugin-settings.vim"
alias vimui="$EDITOR ~/.vim/ui.vim"
# Reminder
alias memo="bat -p ~/.memo.md"
alias memov="bat -p ~/.memov.md"
# Overrides
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -I"
alias fd="fdfind"
alias python="python3"
# Git
alias gwa="git worktree add"
alias gwl="git worktree list"
alias gwk="git worktree lock"
alias gwm="git worktree move"
alias gwp="git worktree prune"
alias gwr="git worktree remove"
alias gwu="git worktree unlock"
alias grum="git rebase upstream/main"
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
# Write a blog post
alias write="$HOME/projects/website/write_post.sh"
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

function mcd() {
	if [ "$1" != "" ]
	then
		mkdir -p $1 ; cd $1
	else
		echo "Missing folder name"
	fi
}

# ascii
alias toiletlist='for i in ${TOILET_FONT_PATH:=/usr/share/figlet}/*.{t,f}lf; do j=${i##*/}; echo ""; echo "╓───── "$j; echo "╙────────────────────────────────────── ─ ─ "; echo ""; toilet -d "${i%/*}" -f "$j" "${j%.*}"; done'
alias ascii="toilet -t -f 3d"
alias future="toilet -t -f future"
alias rusto="toilet -t -f rusto"
alias rustofat="toilet -t -f rustofat"
