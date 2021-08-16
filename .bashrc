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
#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/services/rapid/warden-secrets/terragrunt.hcl
#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/multi-service/p20-20-devops_golden-goose/rapid/terragrunt.hcl
#rapid-live-01/dg-commercial-dev-train-rapid/us-east-1/dev/multi-service/p20-20-devops_gg-build-docker/rapid/terragrunt.hcl
# export PYTHONPATH="${PYTHONPATH}:/home/ta008943/Dev/Devops/golden-goose/gg-common/python/lib/python3.8/site-packages/"
# export PYTHONPATH="${PYTHONPATH}:/home/ta008943/src/pyenv/versions/3.8.6/envs/gg/lib/python3.8/site-packages"
source "$HOME/.cargo/env"

alias devopsenv="echo -n P2020_PASS=; read -rs P2020_PASS; echo; export P2020_PASS; export PYTHONSTARTUP=\"/home/ta008943/Dev/Devops/devopstools/devopstools/dlenv_startup.py\"; pyenv activate devops 2> >(grep -v PYENV_VIRTUALENV_DISABLE_PROMPT)"
export NODENV_ROOT="$HOME/src/nodenv"
export PATH="$NODENV_ROOT/bin:$PATH"
eval "$(nodenv init -)"

# tfenv
export PATH="$HOME/src/tfenv/bin:$PATH"
export TFENV_ROOT="$HOME/src/tfenv/"
export PATH="$HOME/src/tgenv/bin:$PATH"

# # pyenv    
export PYENV_ROOT="$HOME/src/pyenv"    
export PATH="${PYENV_ROOT}/bin:${PATH}"
eval "$(pyenv init -)"   
eval "$(pyenv virtualenv-init -)"

# pyenv support
# export PYENV_ROOT="${HOME}/src/.pyenv"
# if ! [[ ":${PATH}:" == *":${PYENV_ROOT}/bin:"* ]]; then
#     export PATH="${PYENV_ROOT}/bin:${PATH}"
#     eval "$( pyenv init --path )"
#     eval "$(pyenv virtualenv-init -)"
# fi
# if command -v pyenv &>/dev/null; then
#     eval "$( pyenv init - )"
#     eval "$( pyenv virtualenv-init - )"
# fi

# nodenv packages
export PATH="/home/ta008943/src/nodenv/versions/15.14.0/lib:${PATH}"

source ~/cfhome-bash/cfhome.sourceme.sh

# first command opens up the port forwarding
# second command opens up firefox with a specific profile
function v3r_ff {
	nohup ssh -D 4060 -q -C -N -f v3r-s-s-gg >/dev/null 2>&1 &
	nohup firefox -P "maxar_v3r" >/dev/null 2>&1 & exit
}
