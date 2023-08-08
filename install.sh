#!/bin/zsh

/bin/rm -rf ~/.cpp-init > /dev/null 2>&1

curl -fsSL https://raw.githubusercontent.com/YusufLisawi/cpp-init/main/cpp-init > ~/.cpp-init

chmod +x ~/.cpp-init

echo "export PATH=~/.cpp-init" >> ~/.zshrc

echo "source ~/.cpp-init" >> ~/.zshrc


echo "cpp-init\e[1;32m v$WIZZARD_VERSION\e[0m installed"
