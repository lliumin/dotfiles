# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="cloud"
ZSH_THEME="dstufft"
# ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
export COMPLETION_WAITING_DOTS="false"
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git django pip osx fabric brew extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
PATH=~/Scripts:~/Library/Python/2.7/bin:~/.local/bin:~/code/scripts:$PATH
cdpath=(~ ~/Shortcuts ~/Library/Python/2.7/lib/python/site-packages ~/.local/lib/python2.7/site-packages)
alias api="sudo apt-get -y install"
alias psi="python -m 'SimpleHTTPServer'"
alias dj_run="./manage.py runserver 0.0.0.0:800${1:-0}"
export PIP_DOWNLOAD_CACHE="~/.pipcache"
export OH_MY_ZSH_HG=""
