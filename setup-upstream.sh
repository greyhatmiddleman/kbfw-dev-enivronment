#!/bin/bash


echo 'This will setup the upstream repo'

cd ./qmk_firmware
git remote add upstream https://github.com/qmk/qmk_firmware.git
cd ..

cd ./vial-qmk
git remote add upstream https://github.com/vial-kb/vial-qmk.git
cd ..

cd ./zsa-qmk
git remote add upstream https://github.com/zsa/qmk_firmware.git
cd ..
