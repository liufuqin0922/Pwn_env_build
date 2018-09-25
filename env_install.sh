# modify apt source
sudo mv /etc/apt/sources.list  /etc/apt/sources.list.save
sudo cp sources.list /etc/apt/sources.list

# into home dir
cd ~

sudo apt update
sudo apt -y install zsh
sudo apt -y install python-pip git ruby vim

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh /bin/zsh

# install zsh plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mv ./Pwn_env_build/zshrc ~/.zshrc
source .zshrc


# install pwndbg
git clone https://github.com/pwndbg/pwndbg
cd pwndbg
./setup.sh

# install pwntools
sudo pip2 install pwntools


# install LibcSearcher
git clone https://github.com/lieanu/libc.git
cd libc
## change the original database
rm -rf libc_database
git clone https://github.com/niklasb/libc-database
cd libc_database 
chmod 755 get
./get

sudo python setup.py develop


# install one_gadget
gem install one_gadget