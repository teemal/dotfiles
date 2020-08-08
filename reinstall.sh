#!/usr/bin/bash

mkdir -p $HOME/Dev/personal/dotfiles

#direct stdout and stderr to log.out
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1
# Everything below will go to the file 'log.out':

#update/upgrade apt
sudo apt -y update
sudo apt -y upgrade

#install timeshift
sudo apt -y install timeshift

#install neofetch
sudp apt install neofetch

#install zoom
cd $HOME/downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt -y install ./zoom_amd64.deb

#install brave
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
sudo sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com `lsb_release -sc` main" >> /etc/apt/sources.list.d/brave.list'
sudo apt install brave-browser brave-keyring

#install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb


#install vscode
if ! command -v code &> /dev/null
    sudo apt install software-properties-common apt-transport-https wget
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    sudo apt install code
fi

#update vscode keybindings
rm ~/.config/Code/User/keybindings.json
ln ~/Dev/personal/dotfiles/keybindings.json ~/.config/Code/User/keybindings.json

#install discord
sudo snap install discord --classic
​
#install postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
sudo tar -xzf postman.tar.gz -C /opt
rm postman.tar.gz
sudo ln -s /opt/Postman/Postman /usr/bin/postman
​
#install zsh and oh-my-zsh
if [ $0 != 'zsh' ]; then
    apt -y install zsh
    chsh -s /usr/bin/zsh
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
​
    #if ~.zsh_aliases doesnt exist, remove default shell files, clone repo, and make links
    FILE=~/.zsh_aliases
    if test -f "$FILE"; then
        cd ~/dev/personal
        git clone https://github.com/teemal/dotfiles.git
        rm -f ~/.zshrc ~/.zsh_aliases
        ln ~/Dev/personal/dotfiles/.zshrc ~/.zshrc
        ln ~/Dev/personal/dotfiles/.zsh_aliases ~/.zsh_aliases
        source ~/.zshrc 
    fi
fi

#nerd fonts
cd ~
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip
mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
fc-cache -f -v
ln ~/Dev/personal/dotfiles/settings.json ~/.config/Code/User/settings.json

#install pyenv
if ! command -v pyenv &> /dev/null
then
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc
    exec "$SHELL"
    #build deps
    sudo apt-get update; sudo apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    #install python2
    pyenv install 2.7.8
    pyenv install 3.5.2
fi

echo "which pyenv:"
which pyenv

pyenv local 2.7.8

#install vmware horizon client
wget https://download3.vmware.com/software/view/viewclients/CART21FQ1/VMware-Horizon-Client-5.4.1-15988340.x64.bundle
chmod a+x Mware-Horizon-Client-5.4.1-15988340.x64.bundle
sudo ./VMware-Player-6.0.3-1895310.x86_64.bundle






​