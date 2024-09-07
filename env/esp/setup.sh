#!/bin/bash
ESP_URL=https://github.com/espressif/esp-idf.git
ESP_VERSION=v5.3.1

CURR_DIR="$(dirname "$(realpath "$0")")"
TOOLS_PATH="$CURR_DIR/esp-idf-tools"

if [ -d "$CURR_DIR/esp-idf" ]; then
  echo "esp-idf already cloned. Skipping."
else
    git clone -b $ESP_VERSION --recursive $ESP_URL "$CURR_DIR/esp-idf"
fi

mkdir -p $TOOLS_PATH
export IDF_TOOLS_PATH="$TOOLS_PATH"

cd $CURR_DIR/esp-idf
./install.sh esp32