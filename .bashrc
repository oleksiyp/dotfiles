# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
    xterm-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ] && source /usr/share/git-core/contrib/completion/git-prompt.sh

if [ "$color_prompt" = yes ]; then
    if [ -n "$SSH_CLIENT" ]; then
        PS1="${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\[\033[01;34m\]\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) [\h:\w]\[\033[1;35m\]\$(__git_ps1)\[\033[1;33m\]\$\[\e[0m\] "
    else
        PS1="${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\$? \$(if [[ \$? == 0 ]]; then echo \"\[\033[01;32m\]\342\234\223\[\033[01;34m\]\"; else echo \"\[\033[01;31m\]\342\234\227\"; fi) [\w]\[\033[1;35m\]\$(__git_ps1)\[\033[1;33m\]\$\[\e[0m\] "
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# sudo apt-get install grc
GRC=`which grc 2> /dev/null`
if [ "$color_prompt" = yes ] && [ -n "$GRC" ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias ls='colourify ls --color'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
    alias head='colourify head'
    alias tail='colourify tail'
    alias dig='colourify dig'
    alias mount='colourify mount'
    alias ps='colourify ps'
    alias mtr='colourify mtr'
    alias df='colourify df'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# GIT
alias g='git'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

unset color_prompt force_color_prompt


# bash key bindings
# Ctrl + A	Go to the beginning of the line you are currently typing on
# Ctrl + E	Go to the end of the line you are currently typing on
# Ctrl + L      Clears the Screen, similar to the clear command
# Ctrl + U	Clears the line before the cursor position. If you are at the end of the line, clears the entire line.
# Ctrl + H	Same as backspace
# Ctrl + R	Let’s you search through previously used commands
# Ctrl + C	Kill whatever you are running
# Ctrl + D	Exit the current shell
# Ctrl + Z	Puts whatever you are running into a suspended background process. fg restores it.
# Ctrl + W	Delete the word before the cursor
# Ctrl + K	Clear the line after the cursor
# Ctrl + T	Swap the last two characters before the cursor
# Esc + T	Swap the last two words before the cursor
# Alt + F	Move cursor forward one word on the current line
# Alt + B	Move cursor backward one word on the current line
# Tab	        Auto-complete files and folder names
