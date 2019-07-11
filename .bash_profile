export CLICOLOR='Yes'
export MONOGACPREFIX="/usr/local"
source dnvm.sh

GOPATH="/Users/huangwei/go"
GOBIN=$GOPATH/bin

PATH="/usr/local/Cellar/python/3.7.3/bin:/usr/local/bin:${PATH}"

export PATH
export GOPATH
export GOBIN

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"

# alias vi=vim
# alias vim=mvim
# alias mvim='/usr/local/bin/mvim'
set -o vi
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
alias python=python3
alias pip=pip3
alias tmux="TERM=screen-256color-bce tmux"
