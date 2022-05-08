# GPG
export GPG_TTY=$(tty)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "$HOME/.cache/p10k-instant-prompt-panat.zsh" ]]; then
	source "$HOME/.cache/p10k-instant-prompt-panat.zsh"
fi

if type brew &>/dev/null; then
  fpath+=$(brew --prefix)/share/zsh/site-functions
fi

source ~/.zsh_plugins/zsh-snap/znap.zsh

znap source romkatv/powerlevel10k

# Plugins
# znap install ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh
znap source ohmyzsh/ohmyzsh \
	lib/{cli,clipboard,compfix,completion,correction} \
	lib/{diagnostics,directories,functions,git,grep} \
	lib/{history,key-bindings,misc} \
	lib/{spectrum,termsupport,theme-and-appearance} \
	plugins/{git,debian,colored-man-pages,gpg-agent} \
	plugins/{python,pip} \
	plugins/golang \
	plugins/{node,npm,nvm,yarn} \
	plugins/{ruby,gem} \
	plugins/{kubectl,minikube} \
	plugins/{ansible,aws,terraform}

# fpath+=( ~[ohmyzsh]/{fd,gh,helm,ripgrep})
# znap fpath _minikube 'minikube completion zsh'

znap source aloxaf/fzf-tab
znap source djui/alias-tips
znap source marlonrichert/zsh-hist
znap source zdharma/fast-syntax-highlighting
znap eval zoxide 'zoxide init zsh --cmd j'
# Vi Mode
znap source jeffreytse/zsh-vi-mode
export ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE
zvm_after_init_commands+=('znap source unixorn/fzf-zsh-plugin')
zvm_after_init_commands+=('eval "$(navi widget zsh)"')
# Zsh-users
znap source zsh-users/zsh-completions
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
znap source zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
ZSH_AUTOSUGGEST_STRATEGY=(history)
znap source zsh-users/zsh-autosuggestions
# Speed up pasting w/ autosuggest
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

plugins=()

# User configuration
export ZSH_CUSTOM="$HOME/.zsh"
# Source custom zsh files
for config ($HOME/.zsh/*.zsh) source $config


# [[ -s /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/bit bit

export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
