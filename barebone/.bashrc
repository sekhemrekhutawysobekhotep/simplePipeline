# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# HISTSIZE=1000
# HISTFILESIZE=2000
HISTSIZE=-1 
HISTFILESIZE=-1
export HISTTIMEFORMAT="%d/%m/%y %T "


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ ' # green
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ ' # blue
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \$ ' # red

else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi


# ......................... fresh from stens ......................... #


alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias uuuuuu='cd ../../../../../..'
alias uuuuuuu='cd ../../../../../../..'

alias ls='ls --color=auto'
alias s='ls -la'
alias l='ls -latr'

alias vi='vim'
alias hi='history'
alias tmp='cd /tmp/ '


alias pp='vi /usr/tmp/pp'
alias seepp=' cat /usr/tmp/pp'
alias tt='vi /usr/tmp/tt'
alias seett=' cat /usr/tmp/tt'
alias hh='vi /usr/tmp/hh'
alias seehh=' cat /usr/tmp/hh'

alias usr='cd /usr/tmp '

alias sss='unset AWS_ID; source config'

alias getgg="source  ${HOME}/show_github.sh "

alias cdv='cd /var/log'

# alias cdt='cd /opt/code/github.com/tomav/docker-mailserver_mf '
# alias cdt='  cd /opt/code/github.com/tomav/docker-mailserver '
alias cdt='    cd /usr/tmp/loud_deploy/email/docker-mailserver '

alias bdoc='echo "docker build --tag stens_mail ."; docker build --tag stens_mail . '
alias docup='echo "docker-compose up"; docker-compose up '
alias ldoc='echo "docker exec -ti $(docker ps -q ) bash"; docker exec -ti $(docker ps -q ) bash'
alias cdoc='echo "export CID=$(docker ps -q )"; export CID=$(docker ps -q )'
alias sdoc='echo "docker stop $CID"; docker stop $CID'
alias rmdoc='echo "docker rm $CID"; docker rm $CID'

alias stdl='echo "docker stop $(docker ps  -q -l )"; echo; docker stop $(docker ps  -q -l )' # stop last launched container

alias ver='echo "uname -m && uname -r && cat /etc/*release";uname -m && uname -r && cat /etc/*release '

alias lp='meteor list-platforms'

alias lll='echo "loadDb.sh orgs forms users tasks  ";loadDb.sh orgs forms users tasks '

# .........

export PATH=${HOME}/bin:$PATH:.

export EDITOR=/usr/bin/vim

export JAVA_HOME=/usr/local/java/jdk
export PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

export ANDROID_HOME=/usr/tmp/android-sdk-linux
export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}

# source ${HOME}/google-cloud-sdk/path.bash.inc
# source ${HOME}/google-cloud-sdk/completion.bash.inc


alias doinit='source  ~/init_settings ' # taken from ${HOME}/Dropbox/Documents/projects/medcomm/init_settings
# alias ddd='   source  ~/init_settings ' # taken from ${HOME}/Dropbox/Documents/projects/medcomm/init_settings
# alias ddd='cd ~/other_src/loudspeed/build '
alias ddd='cd ~/other_src/github.com/loudthink/loudspeed/build '

alias docustom='   . ~/.bashrc '
alias vicustom='  vi ~/.bashrc '
alias seecustom='cat ~/.bashrc '

# ............

alias login='logon_container.sh $1' # helper to permit logging into running container

# alias seeip="echo my IP is `  ip route get 8.8.8.8 | awk '{print $NF; exit}' ` " # what is my IP ?

alias np='echo "netstat -peanut "; netstat -peanut '

# ...... following added to deploy loudspeed to cloud

alias ot=' cd ~/other_src '

# NOW in config NOT here
# export KUBERNETES_HOME=${HOME}/kubernetes
# export KUBERNETES_HOME=/usr/local/bin/kubernetes
# export PATH=${KUBERNETES_HOME}/cluster:${PATH} # install/run kubernetes from your own home dir

# ...... above added to deploy loudspeed to cloud

# ............... top of cut  ........................  install_node.sh

# export NODE_VER=v6.3.1  # edit this line next time you need to update nodejs
# export NODE_VER=v4.4.7 # matches meteor 1.4 # edit this line next time you need to update nodejs
# export NODE_VER=v4.5.0 # matches meteor 1.4.1.1 # edit this line next time you need to update nodejs
export NODE_VER=v4.6.2 # matches meteor 1.4.1.1 # edit this line next time you need to update nodejs

# env var OS_ARCH must be ONE of below ... remove comment as appropriate for your OS
# export OS_ARCH=darwin-x64  # apple OSX
export OS_ARCH=linux-x64   # ubuntu linux


# pick parent dir of nodejs install  ... comment out or remove ONE of below
# export CODE_PARENT_DIR=/opt/code  # root owned dir ... requires you to sudo prior to npm install going forward
export CODE_PARENT_DIR=${HOME}    # RECOMMENDED

# ......... following env vars are OK no edits needed

export NODE_CODEDIR=${CODE_PARENT_DIR}/nodejs
export COMSUFFIX=tar.gz
export NODE_NAME=node-${NODE_VER}
# export NODE_PARENT=${NODE_CODEDIR}/${NODE_NAME}
export NODE_PARENT=${NODE_CODEDIR}/${NODE_NAME}-${OS_ARCH} 

export PATH=${NODE_PARENT}/bin:${PATH}
export NODE_PATH=${NODE_PARENT}/lib/node_modules

# ............... end of cut  ........................  install_node.sh

# export PATH=/opt/code/coreos-kubernetes/kube-aws/linux-amd64:${PATH}  # kube-aws

# export PATH=${HOME}/kubernetes/platforms/linux/amd64:$PATH  #  gives kubectl 


# ... install go

export GOPATH=/opt/code/gopath
# export GOBIN=$GOPATH/bin
# export PATH=$GOPATH:$GOBIN:$PATH:/usr/local/go/bin
export PATH=$GOPATH/bin:$PATH

# export GOROOT=/opt/code/go
export GOROOT=/usr/local/go # GOROOT must be set only when installing to a custom location
export PATH=${GOROOT}/bin:$PATH

#           meteor list-platforms
#           meteor remove-platform xxx yyy zzz
#           meteor remove-platform ios
#           meteor remove-platform android
#           meteor remove-platform ios android
#           meteor add-platform ios

