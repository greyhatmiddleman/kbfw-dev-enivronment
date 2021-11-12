#!/bin/bash

# to run this script just add the arguments after the script name
# example: docker-qmk.sh compile -kb keyboard -km keymap

DEVQMK_IMAGE="greyhatmiddleman/dev-qmk"

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
#QMK_ROOT_FOLDER=$SCRIPT_DIR/qmk_firmware
#QMK_ROOT_FOLDER=$SCRIPT_DIR/zsa-qmk
QMK_ROOT_FOLDER=$SCRIPT_DIR/vial-qmk

docker run --rm -it \
	-e SKIP_GIT="true" \
	--network none \
	-v $QMK_ROOT_FOLDER:/home/qmk/qmk_firmware \
	$DEVQMK_IMAGE $@
