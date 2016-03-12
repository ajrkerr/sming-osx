# /usr/bin/env bash


echo "Installing XCode Command Line Tools"
xcode-select --install


echo "Installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


echo "Installing Dependencies from Homebrew"
brew tap homebrew/dupes
brew install binutils coreutils automake wget gawk libtool gettext gperf gnu-sed --with-default-names grep
