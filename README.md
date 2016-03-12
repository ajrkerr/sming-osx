# Wemos

This project contains some scripts to boostrap a Wemos or ESP8266 project for OSX. It is a scripted version of their instructions available at: https://github.com/SmingHub/Sming/wiki/MacOS-Quickstart

## Required Driviers
If using a Wemos D1 ensure that you download and install a CH340 driver. 
http://www.wemos.cc/downloads/

## Scripts Overview

### setup_system_dependencies.sh
This script downloads and installs the necessary packages for your system. This includes:
- Installing XCode command line tools
- Installing Homebrew
- Installing Homebrew packages: binutils coreutils automake wget gawk libtool gettext gperf gnu-sed grep


### setup.sh
This script downloads and configures the SDK locally. This involves:
- Downloading a precompiled version of the ESP SDK
- Downloading and building Sming
- Downloading and building Esptool2


### env_vars.sh
Source this file, it will set the environment variables necessary to run make

## Installation & Usage
```bash
$PROJECT_DIR=/your/choice/of/dir

# Setup
git clone git@github.com:ajrkerr/sming-osx.git $PROJECT_DIR
$PROJECT_DIR/setup_system_dependencies.sh
$PROJECT_DIR/setup.sh

# Building
source $PROJECT_DIR/env_vars.sh
cd $PROJECT_DIR/sming/samples/Basic_Blink
make
make flash
```
