LICOLOR=1
alias ls='ls -G'
alias la='ls -al'
alias bake='bundle exec rake'

export GPG_TTY=$(tty)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home"

function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"
 
PS1="\w$YELLOW\$(parse_git_branch)\n$RED>$YELLOW>$GREEN>$NO_COLOR "

if [ -f ~/.nexus_credentials ]; then
    . ~/.nexus_credentials
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/brian/google-cloud-sdk/path.bash.inc' ]; then source '/Users/brian/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/brian/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/brian/google-cloud-sdk/completion.bash.inc'; fi

