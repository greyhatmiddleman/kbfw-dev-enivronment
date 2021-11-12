# Development Environment for Building Keyboard Firmware
This repository is to help you setup a development environment to build your keyboard firmware. This requires Docker and is currently supported for the QMK Firmware or repositories forked from the QMK source.

Purpose of this repositiory was for me to test builds not only from the main QMK firmware, but also from the ZSA and Vial firmware repositories.


## Requirements
- Host should have a vanilla install of qmk with all of its required dependencies, this is to ensure you have a method of flashing your compiled firmware to your controller
- Docker, all commands are for linux base host. Windows commands will be updated later.


## Limitations
- Unable to flash directly from the running docker container.
- Unable to build firmware with EE_HAND because it will load a specific eeprom setting for each hand's controller


## Setup
I suggest cloning all the firmware repos in a different developent folder, seperate from the host's qmk firmware path. You can run the following commands to get the entire source repositories and setup your dev environment:

```
mkdir -p ~/dev
cd ~/dev
git clone --recurse-submodules https://github.com/greyhatmiddleman/kbfw_sandbox.git
```

To build the docker image, after you have cloned the repository and run the follow:
```
cd kbfw_sandbox
docker build -t localhost/dev-qmk .
```
There is no need to run the qmk setup within the container.

A Docker image is also available in docker hub:
```
docker pull greyhatmiddleman/dev-qmk:latest
```

## Usage
The following is an example to run the docker container to build the firmware within the host's qmk firmware folder. If you need to test a different firmware, just change the `QMK_ROOT_FOLDER` variable to the desired path.

```bash
QMK_ROOT_FOLDER=~/dev/kbfw_sandbox/qmk_firmware
#QMK_ROOT_FOLDER=~/dev/kbfw_sandbox/vial-qmk
#QMK_ROOT_FOLDER=~/dev/kbfw_sandbox/zsa-qmk

DEVQMK_IMAGE="greyhatmiddleman/dev-qmk"

cd $QMK_ROOT_FOLDER

docker run --rm -it \
  -e SKIP_GIT="true" \
  --network none \
  -v `pwd`:/home/qmk/qmk_firmware \
  $DEVQMK_IMAGE compile -kb crkbd -km default

ls *.{hex,bin}
```


## Future
- Once I can get my hands on some nice!nanos, ZMK and BlueMicro Firmware might be added
- Test with podman
- Determine if its possible to flash directly from docker.


## Troubleshooting
- Ensure that you used `git clone --recurse-submodules` for each firmware repository you clone.
