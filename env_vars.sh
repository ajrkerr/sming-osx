# /usr/bin/env sh

SCRIPT_FILE=$BASH_SOURCE[0]
if [[ -z "$SCRIPT_FILE" ]]
then
  SCRIPT_FILE="${(%):-%N}"
fi
PROJECT_DIR="$( cd "$( dirname "$SCRIPT_FILE" )" && pwd )"

echo "Configuring Envirnoment Variables"
export ESP_HOME=$PROJECT_DIR/esp-open-sdk
export SMING_HOME=$PROJECT_DIR/sming/Sming
export ESPTOOL2=$ESP_HOME/utils/esptool2

# Configuring options for $PROJECT_DIR/sming/Sming/Makefile-project.mk
export COM_PORT=`ls /dev/tty.wc* | head`
export COM_SPEED=230400
export SPI_SIZE=4M

echo "PROJECT_DIR: ${PROJECT_DIR}"
echo "COM_PORT: ${COM_PORT}"