# Development Environment for Building Keyboard Firmware
This repository is to help you setup a development environment to build your keyboard firmware. This requires Docker and is currently supported for QMK Firmware or repositories forked form the QMK source.

Purpose of this repositiory was for me to test builds not only from the main QMK firmware, but also from the zsa and vial firmware repositories.


## Requirements
- Docker
- Host should have a vanilla install of qmk with all of its reqired dependencies

## Limitations
- Unable to flash directly from the running docker container.
- Unable to build firmware with EE_HAND because it will load a specific eeprom setting for each hand's controller


## Setup
I suggest cloning all the firmware repos in a different developent folder, seperate from the host's qmk firmware path.


## Usage
The following is an example to run the docker container to build the firmware within the host's qmk firmware folder. If you would need to test a different firmware, just change the `QMK_ROOT_FOLDER` variable to the desired path.

```
QMK_ROOT_FOLDER=/dev/kb_firmwares/qmk_firmware
KBFW_IMAGE="docker image name"

cd $QMK_ROOT_FOLDER

docker run --rm -it \
  -v `pwd`:/home/qmk/qmk_firmware \
  $KBFW_IMAGE compile -kb crkbd -km default

ls *.{hex,bin}
```


## Future
- Once I can get my hands on some nice!nanos, ZMK and BlueMicro Firmware might be added
- Test with podman


## Troubleshooting
- Ensure that you used `git clone --recurse-submodules` for each firmware repository you clone.


