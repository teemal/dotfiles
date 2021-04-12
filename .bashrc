# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
     . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# export SHELL=$(which zsh)
[ -n "$SSH_TTY" ] && exec $SHELL
source ~/.zsh_aliases

parse_git_branch() {
     git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\e[93m$(parse_git_branch)->\e[95m \w \n\e[0;32m teemal\e[36m ¯\_(ツ)_/¯: \e[0m"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.tgenv/bin:$PATH"
export PATH="$HOME/idea-IU-203.7717.56/bin:$PATH"
export PYTHONPATH="${PYTHONPATH}:/home/ta008943/Dev/Devops/golden-goose/gg-common/python/lib/python3.8/site-packages/"
source "$HOME/.cargo/env"

#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/services/rapid/warden-secrets/terragrunt.hcl
#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/multi-service/p20-20-devops_golden-goose/rapid/terragrunt.hcl
#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/multi-service/p20-20-devops_gg-build-docker/rapid/terragrunt.hcl