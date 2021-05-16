# Paths
path=("/home/linuxbrew/.linuxbrew/bin" $path)
path=($(go env GOPATH)bin $path)
path=($HOME/.local/bin $path)

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='micro'
fi

# Scroll in less
export LESS='--mouse --wheel-lines=3 -r'

# Bat theme
export BAT_THEME=base16

# Language
export LANG=en_US.UTF-8