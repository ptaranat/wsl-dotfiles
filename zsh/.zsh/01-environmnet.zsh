# Paths
export PATH=$HOME/.local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
	export EDITOR='vim'
else
	export EDITOR='micro'
fi

# GO
export PATH=$PATH:$(go env GOPATH)bin

# Scroll in less
export LESS='--mouse --wheel-lines=3'

# Bat theme
export BAT_THEME=base16

# Language
export LANG=en_US.UTF-8
