#!/bin/bash

git config --global --add safe.directory "*"

BASE_DIR=$(git rev-parse --show-toplevel)

ESP_URL=https://github.com/espressif/esp-idf.git
ESP_VERSION=v5.3.1

TOOLS_PATH="$BASE_DIR/env/esp/esp-idf-tools"
ESP_PATH="$BASE_DIR/env/esp/esp-idf"
export IDF_TOOLS_PATH="$TOOLS_PATH"

if [ -d "$TOOLS_PATH/esp-idf" ]; then
  echo "esp-idf already cloned. Skipping."
else
    git clone -b $ESP_VERSION --recursive $ESP_URL "$ESP_PATH"
fi

mkdir -p $TOOLS_PATH

pushd ./
cd $ESP_PATH
./install.sh $2
popd

source "$ESP_PATH/export.sh"
