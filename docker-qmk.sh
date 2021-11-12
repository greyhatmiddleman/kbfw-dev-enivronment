#!/bin/bash

# to run this script just add the arguments after the script name
# example: docker-qmk.sh compile -kb keyboard -km keymap


SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
QMK_ROOT_FOLDER=$SCRIPT_DIR/qmk_firmware
#QMK_ROOT_FOLDER=$SCRIPT_DIR/zsa-qmk
#QMK_ROOT_FOLDER=$SCRIPT_DIR/vial-qmk

docker run --rm -it -v $QMK_ROOT_FOLDER:/home/qmk/qmk_firmware user/qmk $@
