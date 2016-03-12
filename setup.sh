# /usr/bin/env bash

SCRIPT_FILE=$BASH_SOURCE[0]
if [[ -z "$SCRIPT_FILE" ]]
then
  SCRIPT_FILE="${(%):-%N}"
fi
SCRIPT_DIR="$( cd "$( dirname "$SCRIPT_FILE" )" && pwd )"

SDK_URL=https://bintray.com/artifact/download/kireevco/generic/esp-alt-sdk-v1.5.0.258-macos-x86_64.zip
SDK_ZIP=esp-alt-sdk-v1.5.0.258-macos-x86_64.zip
SDK_DIR=$SCRIPT_DIR/esp-open-sdk

SMING_DIR=$SCRIPT_DIR/sming
SMING_REPO=https://github.com/SmingHub/Sming.git

ESPTOOL2_REPO=https://github.com/raburton/esptool2
ESPTOOL2_DIR=$SCRIPT_DIR/esptool2

# Required for Sming to build
export ESP_HOME=$SCRIPT_DIR/esp-open-sdk

cd $SCRIPT_DIR

echo "Fetching ESP SDK"
rm -rf $SDK_DIR
mkdir -p $SDK_DIR
cd $SDK_DIR

curl -L -O $SDK_URL -o $SDK_ZIP || exit "Could not fetch file"
tar -zxf $SDK_ZIP -C $SDK_DIR || exit "Could not untar file"
chmod -R 775 $SDK_DIR

# This directory isn't correctly referenced in Sming, symlinking
ln -s $SDK_DIR/utils $SDK_DIR/esptool


echo "Building Sming core"
rm -rf $SMING_DIR
mkdir -p $SMING_DIR
cd $SMING_DIR

git clone $SMING_REPO $SMING_DIR || exit "Could not clone Sming"
cd Sming
make || exit "Could not build Sming"
