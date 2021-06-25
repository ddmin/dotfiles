#                   __ _ _
#  _ __  _ __ ___  / _(_) | ___
# | '_ \| '__/ _ \| |_| | |/ _ \
# | |_) | | | (_) |  _| | |  __/
# | .__/|_|  \___/|_| |_|_|\___|
# |_|

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Rust
PATH="$HOME/.cargo/bin:$PATH"

# Go
export PATH="$PATH:/usr/local/go/bin"
export GOPATH="$HOME/Code/Go"
export PATH="$PATH:$GOPATH/bin"
export GOBIN="$GOPATH/bin"

# Code
PATH="$PATH:$HOME/Code/Bash"
PATH="$PATH:$HOME/Code/Python/CLI"
PATH="$PATH:$HOME/Code/Python/BrainFook"
PATH="$PATH:$HOME/Code/Python/Chemistry"
PATH="$PATH:$HOME/Code/Python/Entei"
PATH="$PATH:$HOME/Code/Python/Entei/Files/misc"
PATH="$PATH:$HOME/Code/Python/TTS"
PATH="$PATH:$HOME/Code/Python/Vert"

export PATH
