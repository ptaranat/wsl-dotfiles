# GPG
export GPG_TTY=$(tty)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$HOME/.cache/p10k-instant-prompt-panat.zsh" ]]; then
	source "$HOME/.cache/p10k-instant-prompt-panat.zsh"
fi

source ~/.zsh_plugins/zsh-snap/znap.zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

znap prompt romkatv/powerlevel10k

# Plugins
znap source ohmyzsh/ohmyzsh
znap source ohmyzsh \
	plugins/{git,debian,autojump,colored-man-pagesgpg-agent} \
	plugins/{python,pip} \
	plugins/{node,npm,yarn} \
	plugins/golang \
	plugins/{rust,cargo} \
	plugins/{aws,docker,terraform}

znap source djui/alias-tips
# znap source marlonrichert/zsh-autocomplete
znap source marlonrichert/zsh-hist
znap source zdharma/fast-syntax-highlighting

# Zsh-users
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-users/zsh-history-substring-search
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions

plugins=()

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='micro'
fi

# Keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# GO
export PATH=$PATH:$(go env GOPATH)bin

# Scroll in less
export LESS='--mouse --wheel-lines=3'

# Bat theme
export BAT_THEME=base16

# Navi Widget (Ctrl+G)
eval "$(navi widget zsh)"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
