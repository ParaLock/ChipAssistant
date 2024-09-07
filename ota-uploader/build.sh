#!/bin/bash

idf.py set-target esp32
idf.py menuconfig

idf.py build