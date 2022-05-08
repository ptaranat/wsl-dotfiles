# XDG
if [[ -z "$XDG_RUNTIME_DIR" ]]; then
  export XDG_RUNTIME_DIR=/run/user/$UID
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    export XDG_RUNTIME_DIR=/tmp/$USER-runtime
    if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
      mkdir -m 0700 "$XDG_RUNTIME_DIR"
    fi
  fi
fi

# Paths
path=("/home/linuxbrew/.linuxbrew/bin" $path)
path=("/usr/local/go/bin" $path)
path=($HOME/.local/bin $path)
path=($HOME/bin $path)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='nvim'
fi

# SSH Agent
znap eval ssh-agent 'keychain --eval id_rsa -q --noask'

# Scroll in less
export LESS='--mouse --wheel-lines=3 -r'

# Bat theme
export BAT_THEME=base16

# Language
export LANG=en_US.UTF-8

# Kubernetes
export KUBECONFIG=$HOME/.kube/config

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs --glob "!{node_modules/*,.git/*}"'

# export BROWSER="/mnt/c/Program Files/Google/Chrome/Application/chrome.exe"
export BROWSER=host_chrome

# function fix_wsl2_interop() {
#     for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
#         if [[ -e "/run/WSL/${i}_interop" ]]; then
#             export WSL_INTEROP=/run/WSL/${i}_interop
#         fi
#     done
# }

# fix_wsl2_interop
