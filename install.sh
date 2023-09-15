#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

if [ Mac != $MACHINE ]; then
    echo "Only supports MacOS right now."
    exit 1;
fi

if [ -z $(which brew) ]; then
    echo "Unable to find brew. Visit https://brew.sh/ for installation guide."
    exit 1;
fi

if [ -z $(which nvim) ]; then
    echo "Installing neovim..."
    brew install nvim
fi

echo "Copying init.lua and plugins..."
mkdir -p ~/.config
mkdir -p ~/.config/nvim
cp $SCRIPT_DIR/init.lua ~/.config/nvim
cp -r $SCRIPT_DIR/lua ~/.config/nvim/


if [ -z $(which npm) ]; then
    echo "npm not installed, skipping pyright and tsserver"
    exit 1;
fi

echo "Installing pyright..."
npm i -g pyright

echo "Installing tsserver..."
npm install -g typescript typescript-language-server
