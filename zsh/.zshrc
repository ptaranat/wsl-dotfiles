# GPG
export GPG_TTY=$(tty)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$HOME/.cache/p10k-instant-prompt-panat.zsh" ]]; then
	source "$HOME/.cache/p10k-instant-prompt-panat.zsh"
fi

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

source ~/.zsh_plugins/zsh-snap/znap.zsh

znap source romkatv/powerlevel10k

# Plugins
znap install ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh \
	plugins/{git,debian,colored-man-pages,gpg-agent} \
	plugins/{python,pip} \
	plugins/golang \
	plugins/{node,npm,yarn} \
	plugins/{ruby,gem} \
	plugins/{kubectl,minikube} \
	plugins/{ansible,aws,terraform}

# fpath+=( ~[ohmyzsh]/{fd,gh,helm,ripgrep})
# znap fpath _minikube 'minikube completion zsh'

znap source djui/alias-tips
znap source marlonrichert/zsh-hist
znap source zdharma/fast-syntax-highlighting
znap source ptaranat/omz-autojump
znap source jeffreytse/zsh-vi-mode
zvm_after_init_commands+=('znap source changyuheng/zsh-interactive-cd')
zvm_after_init_commands+=('znap source unixorn/fzf-zsh-plugin')

# Zsh-users
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions

plugins=()

# User configuration
export ZSH_CUSTOM="$HOME/.zsh"
# Source custom zsh files
for config ($HOME/.zsh/*.zsh) source $config

# Navi Widget (Ctrl+G)
eval "$(navi widget zsh)"

# [[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit
