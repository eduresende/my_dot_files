export HISTFILESIZE=1000000000
export HISTSIZE=1000000

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] $(parse_git_branch) \n'
else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch) \$ '
    PS1='\n${debian_chroot:+($debian_chroot)}\w/ $(parse_git_branch) -----------------------------------------------------------\n$ '
fi

alias ls='ls -h --color=auto'
#alias l='ls'

# git
alias gc='git commit -m'
alias gb='git branch'
alias gs='git status'
alias ga='git add . && git add -u .'
alias gco='git checkout'
alias gcm='git checkout master'
alias gm='git merge'
alias gl='git log'
alias gplom='git pull origin master'
alias gpom='git push origin master'
alias gplod='git pull origin develop:develop'
alias gpod='git push origin develop:develop'

alias hlogs='heroku logs --app lpj-convitebook-staging'
alias hlogp='heroku logs --app lpj-convitebook-production'

alias eba='gvim ~/.bashrc'
alias sba='source ~/.bashrc'
alias off='xset dpms force off'

alias hg='history | grep '

PATH="$HOME/.bin:$PATH"

alias rspec='rspec --drb --format doc --color '

# export JAVA_HOME=/cygdrive/c/Arquivos\ de\ programas/Java/jdk1.6.0_16

if [ "$PS1" ] ; then
mkdir -p -m 0700 /dev/cgroup/cpu/user/$$ > /dev/null 2>&1
echo $$ > /dev/cgroup/cpu/user/$$/tasks
echo "1" > /dev/cgroup/cpu/user/$$/notify_on_release
fi
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
