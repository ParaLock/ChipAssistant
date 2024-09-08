#!/bin/bash

source ../env/esp/start.sh esp32s3
idf.py set-target esp32s3
idf.py menuconfig
