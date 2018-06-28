# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
# export PS1="\[\033[1;35m\]-----------|\[\e[1;32m\]\t\[\e[m\]\[\e[1;31m\][\[\e[m\]\[\e[1;31m\]\h\[\e[m\]\[\e[1;31m\]]\[\e[m\]\[\e[33;40m\]\w\[\033[1;34m\]|====>\[\e[0;37m\]"
# Gentoo (/etc/bash/bashrc)
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi
export PS2="| => "
alias ls="ls -la"
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33'
export GREP_OPTIONS='--color=auto'
export TERM=xterm-256color
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export TMUX_POWERLINE_PATCHED_FONT_IN_USE="false"
export EDITOR=vim
export VISUAL=vim
